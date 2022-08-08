package org.yaukie.frame.kettle.core;

import lombok.extern.slf4j.Slf4j;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.job.Job;
import org.springframework.beans.factory.SmartInitializingSingleton;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.SmartLifecycle;
import org.springframework.stereotype.Component;
import org.yaukie.frame.autocode.model.XJob;
import org.yaukie.frame.autocode.model.XMonitor;
import org.yaukie.frame.autocode.model.XMonitorExample;
import org.yaukie.frame.autocode.service.api.XMonitorService;
import org.yaukie.frame.kettle.service.JobService;
import org.yaukie.frame.pool.StandardPoolExecutor;
import org.yaukie.frame.pool.StandardThreadFactory;
import org.yaukie.xtl.cons.XJobStatus;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * @Author: yuenbin
 * @Date :2020/11/9
 * @Time :18:49
 * @Motto: It is better to be clear than to be clever !
 * @Destrib: 作业执行提交入口
 **/
@Component
@Slf4j
public class XJobSubmit  {

    @Autowired
    private JobService jobService;

    @Autowired
    private StandardPoolExecutor executor ;

    @Autowired
    private XMonitorService xMonitorService ;

    /**通过引用来记录线程池工厂中线程*/
    private Set<Thread> threadsContainer = new HashSet<>();

    /**专门用于存放线程池中运行中的线程,便于一系列的操作*/
    public static ConcurrentHashMap<String,Future> activeCurrentMap = new ConcurrentHashMap();


    public synchronized void submit(XJob xJob ,Map params ) throws KettleException{

        StandardThreadFactory threadFactory = new StandardThreadFactory("kettleThreadPool",threadsContainer);
        threadFactory.setJobName(xJob.getJobName());
        executor.setThreadFactory(threadFactory);
        executor.allowCoreThreadTimeOut(true);
        String monitorId = xJob.getJobId();
        Future future = executor.submit(new doRunTask(xJob, monitorId,params));
        activeCurrentMap.put(xJob.getJobId(),future);
    }

    public boolean isPoolActive(){
        return executor.getCurrentTaskCounts() > 0 ;
    }


    public boolean isTerminated(){
        return executor.isTerminated();
    }

    /**
     *  获取当前队列中正在跑的任务数
     * @return
     */
    public int getCurrentTaskCounts(){
        int taskCounts = executor.getCurrentTaskCounts() ;
        return taskCounts;
    }


    /**
     *  @Author: yuenbin
     *  @Date :2020/11/10
     * @Time :15:03
     * @Motto: It is better to be clear than to be clever !
     * @Destrib:  看看队列中是否有在跑的作业任务
    **/
//    public boolean isExistTask(XJob xJob){
//        AtomicBoolean isExist = new AtomicBoolean(false);
//        //进来之前,先清理一下activeCurrentMap中已执行完的线程
//        if(activeCurrentMap.size() > 0 ){
//            activeCurrentMap.keySet().forEach(key ->{
//                Thread tmp = activeCurrentMap.get(key);
//                log.debug("====={}",key);
//                if(!tmp.isAlive()){
//                    activeCurrentMap.remove(key);
//                }
//            });
//        }
//
//        try {
//            Thread.sleep(500);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        //过滤不存活的线程
//        if(!threadsContainer.isEmpty()){
//                threadsContainer.stream().filter(Thread::isAlive)
//                        .forEach(system -> {
//                            String threadName = system.getName() ;
//                            log.debug("当前运行的任务：{} \t\n",threadName);
//                            if(activeCurrentMap.containsKey(threadName)){
//                                isExist.set(true);
//                            }
//                            activeCurrentMap.put(threadName, system);
//                        });
//        }
//
//        return  isExist.get();
//    }


    /**
     * @Author: yuenbin
     * @Date : 2021/9/20
     * @Time : 15:59
     * @Motto: It is better to be clear than to be clever !
     * @Destrib:  单条线程任务,
    */
    private final class  doRunTask implements Callable {
        private XJob xJob ;
        private String monitorId ;
        private Map params ;
        public doRunTask (XJob  xJob,String monitorId ,Map params){
            this.xJob = xJob ;
            this.monitorId= monitorId;
            this.params=params ;
        }
        @Override
        public Object call()  {
            return   doRunJob(xJob,monitorId,params);
        }
    }

    /* *
     * @Description 运行一个任务
     * @Date  2021/9/20
     */
    private XJobStatus doRunJob(XJob xJob ,String monitorId ,Map params){
        String status = "" ;
        String des="";
        Job job = null ;
            try {
              job =  jobService.startJob(xJob,params);
              return XJobStatus.SUCCESS ;
            } catch (KettleException ex) {
                status = XJobStatus.UNKNOWN.value();
                StringWriter out = new StringWriter();
                ex.printStackTrace(new PrintWriter(out));
                des = out.toString().substring(0,400 );
                XMonitorExample xMonitorExample = new XMonitorExample() ;
                xMonitorExample.createCriteria().andTargetIdEqualTo(monitorId) ;

                XMonitor xMonitor =  xMonitorService.selectFirstExample(xMonitorExample) ;
                if(xMonitor !=null ){
                    String failCount = xMonitor.getFailCount();
                    if(failCount.equals("null") || failCount.equals("")){
                        failCount="0" ;
                    }
                    xMonitor.setTargetStatus(status);
                    xMonitor.setDescription(des);
                    xMonitor.setFailCount((Integer.parseInt(failCount)+1)+"");
                    xMonitorService.updateByExampleSelective(xMonitor,xMonitorExample);
                }

                return XJobStatus.FAILED ;

            }
     }

    public void stopJob(XJob xJob){
        if(!activeCurrentMap.containsKey(xJob.getJobId())){
            throw  new RuntimeException("当前任务已结束或未运行!");
        }

         final Future future = activeCurrentMap.get(xJob.getJobId()) ;
         Runnable cancellation = new Runnable() {
            @Override
            public void run() {
                try {
                    Thread.sleep(200);
                    future.cancel(true) ;
                } catch (InterruptedException ex) {
                    log.error("任务中断出现异常,原因为:{}",ex);
                }
            }
        };
        new Thread(cancellation).start();
    }

}

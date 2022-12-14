package org.yaukie.frame.kettle.api;

import org.yaukie.base.annotation.OperLog;
import org.yaukie.base.annotation.SetDataSource;
import org.yaukie.base.constant.SysConstant;
import org.yaukie.base.util.DateHelper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.httpclient.util.DateUtil;
import org.apache.commons.lang3.StringUtils;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.job.JobMeta;
import org.pentaho.di.repository.Repository;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.yaukie.builder.QuartzManager;
import org.yaukie.base.annotation.EnablePage;
import org.yaukie.base.annotation.LogAround;
import org.yaukie.base.core.controller.BaseController;
import org.yaukie.base.config.UniformReponseHandler;
import org.yaukie.base.constant.BaseResult;
import org.yaukie.base.constant.BaseResultConstant;
import org.yaukie.base.constant.PageResult;
import org.yaukie.base.exception.UserDefinedException;
import org.yaukie.base.util.GenCodeUtil;
import org.yaukie.frame.autocode.dao.mapper.ExtendMapper;
import org.yaukie.frame.autocode.model.*;
import org.yaukie.frame.autocode.service.api.XJobService;
import org.yaukie.frame.autocode.service.api.XQuartzService;
import org.yaukie.frame.autocode.service.api.XRepositoryService;
import org.yaukie.frame.kettle.core.XJobSubmit;
import org.yaukie.frame.kettle.quartz.XQuartHandleService;
import org.yaukie.frame.kettle.service.JobService;
import org.yaukie.frame.kettle.service.LogService;
import org.yaukie.frame.pool.StandardPoolExecutor;
import org.yaukie.frame.pool.StandardThreadFactory;
import org.yaukie.xtl.KettleUtil;
import org.yaukie.xtl.cons.Constant;
import org.yaukie.xtl.cons.XJobStatus;
import org.yaukie.xtl.exceptions.XtlExceptions;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
* @author: yuenbin
* @create: 2020/11/09 11/28/955
**/
@RestController
@RequestMapping(value = "/api/xjob/")
@Api(value = "???????????????????????????", description = "???????????????????????????")
@Slf4j
public class XJobApiController extends BaseController {

    @Autowired
    private XJobService xJobService;

    @Autowired
    private XJobSubmit xJobSubmit;

    @Autowired
    private LogService logService;

    @Autowired
    private JobService jobService;

    @Autowired
    private XRepositoryService xRepositoryService ;

    @Resource
    private HttpServletResponse response;

    @Autowired
    private XQuartHandleService xQuartHandleService;

    @Autowired
    private XQuartzService xQuartzService ;

    @Resource
    private ExtendMapper extendMapper;


    @Autowired
    private StandardPoolExecutor executor ;

    @GetMapping(value = "/move2db")
    @ApiOperation("?????????????????????????????????")
    @EnablePage
    @LogAround("?????????????????????????????????")
    public BaseResult doMove2Db(
            @RequestParam(value = "flag",required = false)String flag) {

        /**?????????????????????????????????????????????*/
          Set<Thread> threadsContainer = new HashSet<>();

            StandardThreadFactory threadFactory = new StandardThreadFactory("kettleThreadPool",threadsContainer);
             executor.setThreadFactory(threadFactory);
            executor.allowCoreThreadTimeOut(true);
             executor.execute(()->{
                 // to -do
            }) ;
             return  null ;
    }


    @GetMapping(value = "/qryTrendData")
    @ApiOperation("????????????")
    @EnablePage
    @LogAround("????????????")
    public BaseResult qryTrendData(
            @RequestParam(value = "flag",required = false)String flag,
            @RequestParam(value = "createDateBegin",required = false)String createDateBegin,
            @RequestParam(value = "createDateEnd",required = false)String createDateEnd) {
        if(StringUtils.isEmpty(createDateBegin)){
            return BaseResult.fail();
        }

        if(StringUtils.isEmpty(createDateEnd)){
            return BaseResult.fail();
        }

        Map param = new HashMap(16) ;

        Map dataMap = new HashMap() ;
        List<String> dateList = getPreDate(createDateEnd,10) ;
          Collections.reverse(dateList);
        param.put("dateList", dateList);
        List<Map> resultList = new LinkedList<>();
        if("0".equals(flag))
        {
            resultList = extendMapper.getRunnedInstancesTrend(param);
        }else if("1".equals(flag)){
            resultList = extendMapper.getRunnedOkTrend(param);
        }else if("2".equals(flag)){
            resultList = extendMapper.getRunnedErrorTrend(param);
        }

        List<String> resultList1 = new LinkedList<>() ;
        Map aMap = new HashMap(16) ;
        if(!CollectionUtils.isEmpty(resultList)){
            for(Map tmp : resultList){
                String date = tmp.get("cur_date")+"" ;
                String curData = tmp.get("curData")+"" ;
                aMap.put(date, curData);
            }

            for (String s : dateList) {
                if(!aMap.containsKey(s)){
                    aMap.put(s, "0");
                }
            }
        }
         Map<String, String> sortMap= new TreeMap<String, String>(new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return o1.compareTo(o2);
            }
        });
        List dataList = new LinkedList() ;
        sortMap.putAll(aMap);
        sortMap.forEach((k,v) ->{
            dataList.add(v) ;
        });
        dataMap.put("xExampleData", dateList) ;
        dataMap.put("seriesExampleData", dataList);

        return BaseResult.success(dataMap) ;
    }


    @GetMapping(value = "/qrySeriesData")
    @ApiOperation("??????????????????")
    @EnablePage
    @LogAround("??????????????????")
    public BaseResult qrySeriesData(
             @RequestParam(value = "createDateBegin",required = false)String createDateBegin,
            @RequestParam(value = "createDateEnd",required = false)String createDateEnd) {
        if(StringUtils.isEmpty(createDateBegin)){
            return BaseResult.fail();
        }

        if(StringUtils.isEmpty(createDateEnd)){
            return BaseResult.fail();
        }

        Map param = new HashMap(16) ;

        param.put("startTime", createDateBegin);
        param.put("stopTime", createDateEnd);

        Map dataMap  = new HashMap() ;
        List jobSeries = new LinkedList() ;
        List transSeries = new LinkedList() ;
        Map resultMap = extendMapper.getNormalJobInstances(param) ;
        jobSeries.add(resultMap==null?"0":resultMap.get("normal_job_instances")) ;
         resultMap=extendMapper.getNormalTransInstances(param);
        transSeries.add(resultMap==null?"0":resultMap.get("normal_trans_instances")) ;
         resultMap = extendMapper.getSpecialJobInstances(param) ;
        jobSeries.add( resultMap==null?"0":resultMap.get("special_job_instances")) ;
         resultMap = extendMapper.getSpecialTransInstances(param) ;
        transSeries.add( resultMap==null?"0":resultMap.get("special_trans_instances")) ;
        dataMap.put("jobSeriesData", jobSeries);
        dataMap.put("transSeriesData", transSeries);
        return BaseResult.success(dataMap) ;
    }

    @GetMapping(value = "/qryTransWarningInfo")
    @ApiOperation("????????????????????????")
    @EnablePage
    @LogAround("????????????????????????")
    public BaseResult qryTransWarningInfo(
            @RequestParam(value = "offset", required = false) String offset,
            @RequestParam(value = "limit", required = false) String limit,
            @RequestParam(value = "createDateBegin",required = false)String createDateBegin,
            @RequestParam(value = "createDateEnd",required = false)String createDateEnd) {
        if(StringUtils.isEmpty(createDateBegin)){
            return BaseResult.fail();
        }

        if(StringUtils.isEmpty(createDateEnd)){
            return BaseResult.fail();
        }

        Map param = new HashMap(16) ;

        param.put("startTime", createDateBegin);
        param.put("stopTime", createDateEnd);

        List<Map> jobList = (List<Map>) extendMapper.getTransWarningRecords(param);

        PageResult pageResult = new PageResult(jobList);
        Map<String, Object> result = new HashMap<>();
        List<Map> dataList = (List) pageResult.getRows();
        if(!CollectionUtils.isEmpty(dataList)){
            for(int i=0;i<dataList.size();i++){
                Map map = dataList.get(i);
                map.put("rowIndex", (i+1));
            }
        }
        result.put(RESULT_ROWS,dataList);
        result.put(RESULT_TOTLAL, pageResult.getTotal());
        return BaseResult.success(result) ;

    }


    @GetMapping(value = "/qryJobWarningInfo")
    @ApiOperation("????????????????????????")
    @EnablePage
    @LogAround("????????????????????????")
    public BaseResult qryJobWarningInfo(
            @RequestParam(value = "offset", required = false) String offset,
            @RequestParam(value = "limit", required = false) String limit,
            @RequestParam(value = "createDateBegin",required = false)String createDateBegin,
            @RequestParam(value = "createDateEnd",required = false)String createDateEnd) {
        if(StringUtils.isEmpty(createDateBegin)){
            return BaseResult.fail();
        }

        if(StringUtils.isEmpty(createDateEnd)){
            return BaseResult.fail();
        }

        Map param = new HashMap(16) ;

        param.put("startTime", createDateBegin);
        param.put("stopTime", createDateEnd);

        List<Map> transList = (List<Map>) extendMapper.getJobWarningRecords(param);

        PageResult pageResult = new PageResult(transList);
        Map<String, Object> result = new HashMap<>();
        List<Map> dataList = (List) pageResult.getRows();
        if(!CollectionUtils.isEmpty(dataList)){
            for(int i=0;i<dataList.size();i++){
                Map map = dataList.get(i);
                map.put("rowIndex", (i+1));
            }
        }
        result.put(RESULT_ROWS,dataList);
        result.put(RESULT_TOTLAL, pageResult.getTotal());

        return BaseResult.success(result) ;

    }

    @GetMapping(value = "/getRunningDetail",produces = "application/json")
    @ApiOperation("??????????????????")
    @LogAround("??????????????????")
    public BaseResult getRunningDetail(
            @RequestParam(value = "createDateBegin",required = true)String createDateBegin,
            @RequestParam(value = "createDateEnd",required = true)String createDateEnd
    )   {
        if(StringUtils.isEmpty(createDateBegin)){
            return BaseResult.fail();
        }

        if(StringUtils.isEmpty(createDateEnd)){
            return BaseResult.fail();
        }

        Map param = new HashMap(16) ;

        param.put("startTime", createDateBegin);
        param.put("stopTime", createDateEnd);

        //??????????????????
        Map resultMap = extendMapper.getTotalInstances(param) ;
        String totalInstances = resultMap.get("total_instances")+"";
        resultMap = extendMapper.getRunnedOkInstances(param);
        String runnedOkInstances = resultMap.get("runned_ok_instances")+"";
        resultMap = extendMapper.getRunnedErrorInstances(param);
        String runnedErrorInstances = resultMap.get("runned_error_instances")+"";
        resultMap = extendMapper.getRunningInstances(param);
        String runningInstances = resultMap.get("running_instances")+"" ;
        resultMap = extendMapper.getRunnedInstances(param);
        String runnedInstances = resultMap.get("runned_instances")+"";
        int  unRunnedInstances = Integer.parseInt(totalInstances)-Integer.parseInt(runnedInstances) ;
        Map dataMap = new HashMap() ;
        dataMap.put("totalInstances", totalInstances);
        dataMap.put("runnedOkInstances", runnedOkInstances);
        dataMap.put("runnedErrorInstances", runnedErrorInstances);
        dataMap.put("runningInstances", runningInstances);
        dataMap.put("unRunnedInstances", unRunnedInstances);
        dataMap.put("runnedInstances",runnedInstances );
        //??????????????????
        resultMap = extendMapper.getRunnedOkSum(param);
        String runnedOkSum =resultMap==null?"0": resultMap.get("runned_ok_sum")+"" ;
        dataMap.put("runnedOkSum", StringUtils.isAllEmpty(runnedOkSum)?"0":runnedOkSum);
        resultMap = extendMapper.getRunnedErrorSum(param) ;
        String runnedErrorSum = resultMap==null?"0":resultMap.get("runned_error_sum")+"" ;
        dataMap.put("runnedErrorSum", StringUtils.isAllEmpty(runnedErrorSum)?"0":runnedErrorSum);
        return BaseResult.success(dataMap) ;
    }

    @GetMapping(value = "/getLogText",produces = "application/json")
    @ApiOperation("??????????????????")
    @LogAround("??????????????????")
    public BaseResult getLogText(
            @RequestParam(value = "jobId",required = true)String jobId
    )   {
        if(StringUtils.isEmpty(jobId)){
            return BaseResult.fail();
        }

        Map param = new HashMap() ;
        param.put("jobId", jobId) ;
        Map result = extendMapper.qryJobLogText(param) ;
          return BaseResult.success(result==null?"??????????????????":result.get("logText")) ;
    }

    @GetMapping(value = "/getJobImage",produces = "application/json")
    @ApiOperation("?????????????????????")
     @LogAround("?????????????????????")
    public BaseResult getJobImage(
            @RequestParam(value = "jobId",required = true)String jobId
             )   {
        if(StringUtils.isEmpty(jobId)){
            return BaseResult.fail();
        }
        XJobExample xJobExample = new XJobExample() ;
        xJobExample.createCriteria().andJobIdEqualTo(jobId);
        XJob xJob = xJobService.selectFirstExample(xJobExample);
        String jobType = xJob.getJobType() ;
        // ??????????????????????????????
        String repositoryId = xJob.getJobRepositoryId();
        XRepositoryExample xRepositoryExample = new XRepositoryExample();
        xRepositoryExample.createCriteria().andRepoIdEqualTo(repositoryId + "");
        XRepository xRepository = xRepositoryService.selectFirstExample(xRepositoryExample);
        if (xRepository == null) {
            return  new UniformReponseHandler().sendErrorResponse_System(new XtlExceptions("??????????????????!"));
        }
        OutputStream os =null ;
        try {

            Repository repository ;
            if(xJob.getJobType().equals("db")){
                repository =  KettleUtil.conByNative(xRepository.getRepoId(),xRepository.getRepoName(),
                        xRepository.getRepoName(),xRepository.getRepoType(),
                        xRepository.getDbHost(),xRepository.getDbPort(),xRepository.getDbName(),
                        xRepository.getDbUsername(),xRepository.getDbPassword(),xRepository.getRepoUsername(),
                        xRepository.getRepoPassword()) ;
            }else {
                repository = KettleUtil.conFileRep(xJob.getJobRepositoryId(),
                        xRepository.getRepoName(),xRepository.getBaseDir() );
            }

            JobMeta jobMeta = KettleUtil.loadJob(xJob.getJobName(), xJob.getJobPath(), repository);

            BufferedImage bufferedImage = KettleUtil.generateJobImage(jobMeta);

            response.setContentType("image/png");
            os = response.getOutputStream() ;
            if(bufferedImage !=null ){
                ImageIO.write(bufferedImage, "png",os );
            }
        }catch (KettleException e1 )
        {
            return new UniformReponseHandler().sendErrorResponse_System(e1) ;
        }catch (Exception e2) {
            return new UniformReponseHandler().sendErrorResponse_System(e2) ;
        } finally {
            if(os !=null ){
                try {
                    os.flush();
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }
        return BaseResult.success() ;
    }

    @GetMapping(value = "/qryJobPageInfo")
    @ApiOperation("????????????????????????")
    @EnablePage
    @LogAround("????????????????????????")
    @SetDataSource(SysConstant.DsType.MASTER)
    public BaseResult qryJobPageInfo(
            @RequestParam(value = "offset",required = false)String offset,
            @RequestParam(value = "limit",required = false)String limit,
            @RequestParam(value = "jobName",required = false)String jobName,
            @RequestParam(value = "targetResult",required = false)String targetResult,
            @RequestParam(value = "createDateBegin",required = false)String createDateBegin,
            @RequestParam(value = "createDateEnd",required = false)String createDateEnd) {
        Map params = new HashMap() ;
        if(org.apache.commons.lang.StringUtils.isNotEmpty(jobName)){
            params.put("jobName",jobName );
        }
        if(org.apache.commons.lang.StringUtils.isNotEmpty(targetResult)){
            params.put("targetResult",targetResult );
        }
        if(org.apache.commons.lang.StringUtils.isNotEmpty(createDateBegin)){
            try {
                params.put("startTime", DateHelper.format(new SimpleDateFormat("yyyy.MM.dd").parse(createDateBegin.replaceAll("\\-", "."))));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }else {
            params.put("startTime", DateUtil.formatDate(new Date(), "yyyy.MM.dd") );
        }
        if(org.apache.commons.lang.StringUtils.isNotEmpty(createDateEnd)){
            try {
                params.put("stopTime", DateHelper.format(new SimpleDateFormat("yyyy.MM.dd").parse(createDateEnd.replaceAll("\\-", "."))));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }else {
            params.put("stopTime", DateUtil.formatDate(new Date(), "yyyy.MM.dd"));
        }

        List<Map> xJobList = extendMapper.qryJobPageInfo(params) ;

        PageResult pageResult = new PageResult(xJobList);
        Map<String, Object> result = new HashMap<>();
        List<Map> dataList = (List) pageResult.getRows();
        if(!CollectionUtils.isEmpty(dataList)){
            dataList.forEach(item -> {
                if(!item.containsKey("quartz")){
                    item.put("quartz","???????????????" );
                }else {
                    String quartz = item.get("quartz") +"";
                    if(StringUtils.isAllBlank(quartz)){
                        item.put("quartz","???????????????" );
                    }
                }
            });
        }
        result.put(RESULT_ROWS,dataList);
        result.put(RESULT_TOTLAL, pageResult.getTotal());

        return BaseResult.success( result);

    }



    @RequestMapping(value = "/startJob")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "jobId" + "", value = "jobId" + "", required = true, dataTypeClass = String.class),
    })
    @ApiOperation("??????????????????")
    @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.START)
    public BaseResult startJob(
            @RequestParam(name = "jobId", required = true) String jobId) {

        if (StringUtils.isEmpty(jobId)) {
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }

        XJobExample xJobExample = new XJobExample();
        xJobExample.createCriteria().andJobIdEqualTo(jobId);
        XJob xJob = xJobService.selectFirstExample(xJobExample);
        if (xJob == null) {
            return BaseResult.fail("???????????????!");
        }

        // ??????????????????,????????????,???????????????????????????
//        boolean isExists = xJobSubmit.isExistTask(xJob) ;
//        if(isExists){
//            return BaseResult.fail("???????????????????????????,???????????????!");
//        }
        //???start???????????????????????????????????????,.??????status????????????pending
        Map param = new HashMap();
        param.put("jobId", xJob.getJobId());
        param.put("monitorType", "job");
        if (xJob.getIsMonitorEnabled().equals("1")) {
            logService.doAddMonitor(param);
        }
        try {
            xJobSubmit.submit(xJob,null);
            int currentTasks = xJobSubmit.getCurrentTaskCounts();
            log.info("??????????????????{}???", currentTasks);
            return new UniformReponseHandler<>().sendSuccessResponse("??????????????????,?????????????????????" + currentTasks + "?????????");
        }catch (KettleException ex )
        {
            return  new UniformReponseHandler<>().sendErrorResponse_UserDefined(ex);
        }
      
        
    }

    @GetMapping(value = "/addJob2Sche")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "jobId" + "", value = "jobId" + "", required = true, dataTypeClass = String.class),
            @ApiImplicitParam(name = "cron" + "", value = "cron" + "", required = true, dataTypeClass = String.class),
            @ApiImplicitParam(name = "description" + "", value = "description" + "", required = true, dataTypeClass = String.class)
    })
    @ApiOperation("????????????????????????")
    @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.SCHEDULER)
    public BaseResult addJob2Sche(
            @RequestParam(name = "jobId", required = true) String jobId,
            @RequestParam(name = "cron", required = true) String cron,
            @RequestParam(name = "description", required = true) String description) {
        if (StringUtils.isEmpty(jobId)) {
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }

        XJobExample xJobExample = new XJobExample();
        xJobExample.createCriteria().andJobIdEqualTo(jobId);
        XJob xJob = xJobService.selectFirstExample(xJobExample);
        if (xJob == null) {
            return BaseResult.fail("???????????????!");
        }

        //???????????????????????????????????????????????????
        SchedulerFactory schedulerFactory = QuartzManager.schedulerFactory ;
        try {
            Scheduler scheduler = schedulerFactory.getScheduler() ;
            Map param = Constant.getQuartzBasic(xJob.getJobName(), xJob.getJobPath());
            JobKey jobKey = JobKey.jobKey(param.get("jobName")+"",
                    param.get("jobGroupName")+"");
            boolean exists =  scheduler.checkExists(jobKey);
            if(exists){
                return  new BaseResult(11002, "?????????????????????????????????,???????????????["+jobKey.getName()+"]", null);
              }
        } catch (SchedulerException e) {

        }

        XQuartzExample xQuartzExample = new XQuartzExample();
        xQuartzExample.createCriteria().andTargetIdEqualTo(jobId)
                .andQuartzTypeEqualTo("job");
        XQuartz xQuartz = xQuartzService.selectFirstExample(xQuartzExample) ;
        if(xQuartz !=null ){
            xQuartz.setQuartzCron(cron);
            xQuartz.setQuartzDescription(description);
            xQuartz.setIsDel("0");
            xQuartzService.updateByExampleSelective(xQuartz, xQuartzExample);
        }else {
            xQuartz = new XQuartz() ;
            xQuartz.setQuartzId(GenCodeUtil.nextId());
            xQuartz.setTargetId(jobId);
            xQuartz.setQuartzType("job");
            xQuartz.setQuartzCron(cron);
            xQuartz.setQuartzDescription(description);
            xQuartz.setIsDel("0");
            xQuartzService.insertSelective(xQuartz) ;
            log.info("????????????????????????!");
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        }

        try {
            xQuartHandleService.addJobToSche(xJob);
        } catch (UserDefinedException ex) {
            throw new UserDefinedException(BaseResultConstant.UNKNOW_EXCEPTION);
        }

        return new UniformReponseHandler<>()
                .sendSuccessResponse("??????????????????????????????!");

    }

    @RequestMapping(value = "/removeJobFromSche/{jobId}")
    @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.SCHEDULER)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "jobId" + "", value = "jobId" + "", required = true, dataTypeClass = String.class),
    })
    @ApiOperation("????????????????????????")
    public BaseResult removeJobFromSche(
            @PathVariable(name = "jobId", required = true) String jobId) {
        if (StringUtils.isEmpty(jobId)) {
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }

        XJobExample xJobExample = new XJobExample();
        xJobExample.createCriteria().andJobIdEqualTo(jobId);
        XJob xJob = xJobService.selectFirstExample(xJobExample);
        if (xJob == null) {
            return BaseResult.fail("???????????????!");
        }

        try {
            xQuartHandleService.removeJobFromSche(xJob);
        }catch (UserDefinedException ex ){
            throw new UserDefinedException(BaseResultConstant.UNKNOW_EXCEPTION,"????????????????????????");
        }

        return new UniformReponseHandler<>()
                .sendSuccessResponse("?????????????????????????????????????????????!");
    }


    @RequestMapping(value = "/stopJob")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "jobId" + "", value = "jobId" + "", required = true, dataTypeClass = String.class),
    })
    @ApiOperation("??????????????????")
    @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.STOP)
    public BaseResult stopJob(
            @RequestParam(name = "jobId", required = true) String jobId) {
        if (StringUtils.isEmpty(jobId)) {
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }

        XJobExample xJobExample = new XJobExample();
        xJobExample.createCriteria().andJobIdEqualTo(jobId);
        XJob xJob = xJobService.selectFirstExample(xJobExample);
        if (xJob == null) {
            return BaseResult.fail("???????????????!");
        }

        XJobStatus xJobStatus =null ;
        try {
            xJobStatus =  jobService.doStopJob(xJob);

        }catch (XtlExceptions e) {
            String msg = e.getMessage() ;
            return BaseResult.fail(msg) ;
        }

        return new UniformReponseHandler<>()
                .sendSuccessResponse("??????????????????,??????:"+xJobStatus.description());
    }

    @RequestMapping(value = "/killJob")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "jobId" + "", value = "jobId" + "", required = true, dataTypeClass = String.class),
    })
    @ApiOperation("??????????????????")
    @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.STOP)
    public BaseResult killJob(
            @RequestParam(name = "jobId", required = true) String jobId) {
        if (StringUtils.isEmpty(jobId)) {
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }

        XJobExample xJobExample = new XJobExample();
        xJobExample.createCriteria().andJobIdEqualTo(jobId);
        XJob xJob = xJobService.selectFirstExample(xJobExample);
        if (xJob == null) {
            return BaseResult.fail("???????????????!");
        }
        XJobStatus xJobStatus = null ;
        try {
            xJobStatus =  jobService.doKillJob(xJob);

        } catch (XtlExceptions e) {
            String msg = e.getMessage() ;
            return BaseResult.fail(msg) ;
        }

        return new UniformReponseHandler<>()
                .sendSuccessResponse("??????????????????,??????:"+xJobStatus.description());
    }

    public static ArrayList<String> getPreDate(String curDate,int intervals )  {
        ArrayList<String> pastDaysList = new ArrayList<>();
        for (int i = 0; i <intervals; i++) {
            try {
                pastDaysList.add(getPastDate(curDate,i));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return pastDaysList;
    }

    /**
     * ??????????????????????????????
     *
     * @param past
     * @return
     */
    public static String getPastDate(String curDate,int past) throws ParseException {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(curDate));
        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);
        Date today = calendar.getTime();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String result = format.format(today);
        return result;
    }

}

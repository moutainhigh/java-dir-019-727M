package org.yaukie.frame.provider;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.httpclient.util.DateUtil;
import org.apache.commons.lang.StringUtils;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.repository.Repository;
import org.pentaho.di.trans.TransMeta;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.yaukie.base.annotation.EnablePage;
import org.yaukie.base.annotation.LogAround;
import org.yaukie.base.annotation.OperLog;
import org.yaukie.base.config.UniformReponseHandler;
import org.yaukie.base.constant.BaseResult;
import org.yaukie.base.constant.BaseResultConstant;
import org.yaukie.base.constant.PageResult;
import org.yaukie.base.constant.SysConstant;
import org.yaukie.base.core.controller.BaseController;
import org.yaukie.base.exception.UserDefinedException;
import org.yaukie.base.util.DateHelper;
import org.yaukie.base.util.GenCodeUtil;
import org.yaukie.builder.QuartzManager;
import org.yaukie.frame.autocode.dao.mapper.ExtendMapper;
import org.yaukie.frame.autocode.model.*;
import org.yaukie.frame.autocode.service.api.XQuartzService;
import org.yaukie.frame.autocode.service.api.XRepositoryService;
import org.yaukie.frame.autocode.service.api.XTransService;
import org.yaukie.frame.kettle.core.XTransSubmit;
import org.yaukie.frame.kettle.quartz.XQuartHandleService;
import org.yaukie.frame.kettle.service.LogService;
import org.yaukie.frame.kettle.service.TransService;
import org.yaukie.xtl.KettleUtil;
import org.yaukie.xtl.cons.Constant;
import org.yaukie.xtl.cons.XTransStatus;
import org.yaukie.xtl.exceptions.XtlExceptions;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* @author: yuenbin
* @create: 2020/11/09 11/28/955
**/
@RestController
@RequestMapping(value = "/provider/trans")
@Api(value = "????????????????????????????????????", description = "????????????????????????????????????")
@Slf4j
public class XTransProviderController extends BaseController {

    @Autowired
    private XTransService xTransService;

    @Autowired
    private XTransSubmit xTransSubmit ;

    @Autowired
    private LogService logService;

    @Autowired
    private TransService transService;

@Autowired
    private XQuartzService xQuartzService ;

    @Autowired
    private XQuartHandleService xQuartHandleService;

    @Autowired
    private ExtendMapper extendMapper ;

    @Autowired
    private XRepositoryService xRepositoryService ;

    @Resource
    private HttpServletResponse response;


    @GetMapping(value = "/qryTransPageInfo")
    @ApiOperation("????????????????????????")
    @EnablePage
    @LogAround("????????????????????????")
    public BaseResult qryTransPageInfo(
            @RequestParam(value = "offset",required = false)String offset,
            @RequestParam(value = "limit",required = false)String limit,
            @RequestParam(value = "transName",required = false)String transName,
            @RequestParam(value = "targetResult",required = false)String targetResult,
            @RequestParam(value = "createDateBegin",required = false)String createDateBegin,
            @RequestParam(value = "createDateEnd",required = false)String createDateEnd) {

        Map params =new HashMap() ;
        if(StringUtils.isNotEmpty(transName)){
            params.put("transName",transName );
        }
        if(StringUtils.isNotEmpty(targetResult)){
            params.put("targetResult",targetResult );
        }
        if(StringUtils.isNotEmpty(createDateBegin)){
            try {
                params.put("startTime", DateHelper.format(new SimpleDateFormat("yyyy.MM.dd").parse(createDateBegin.replaceAll("\\-", "."))));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }else {
            params.put("startTime",DateUtil.formatDate(new Date(), "yyyy.MM.dd") );
        }
        if(StringUtils.isNotEmpty(createDateEnd)){
            try {
                params.put("stopTime", DateHelper.format(new SimpleDateFormat("yyyy.MM.dd").parse(createDateEnd.replaceAll("\\-", "."))));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }else {
            params.put("stopTime", DateUtil.formatDate(new Date(), "yyyy.MM.dd"));
        }

        List<Map> list = extendMapper.qryTransPageInfo(params) ;

        PageResult pageResult = new PageResult(list);
        Map<String, Object> result = new HashMap<>();
        List<Map> dataList = (List) pageResult.getRows();
        if(!CollectionUtils.isEmpty(dataList)){
            dataList.forEach(item -> {
                if(!item.containsKey("quartz")){
                    item.put("quartz","???????????????" );
                }else {
                    String quartz = item.get("quartz") +"";
                    if(StringUtils.isBlank(quartz)){
                        item.put("quartz","???????????????" );
                    }
                }
            });
        }
        result.put(RESULT_ROWS,dataList);
        result.put(RESULT_TOTLAL, pageResult.getTotal());

        return BaseResult.success( result);

    }


    @GetMapping(value = "/getTransImage",produces = "application/json")
    @ApiOperation("?????????????????????")
    @LogAround("?????????????????????")
    public BaseResult getJobImage(
            @RequestParam(value = "transId",required = true)String transId
    )   {
        if(StringUtils.isEmpty(transId)){
            return BaseResult.fail();
        }
        XTransExample xTransExample = new XTransExample() ;
        xTransExample.createCriteria().andTransIdEqualTo(transId);
        XTrans  xTrans = xTransService.selectFirstExample(xTransExample);
        String transType = xTrans.getTransType() ;
        // ??????????????????????????????
        String repositoryId = xTrans.getTransRepositoryId();
        XRepositoryExample xRepositoryExample = new XRepositoryExample();
        xRepositoryExample.createCriteria().andRepoIdEqualTo(repositoryId + "");
        XRepository xRepository = xRepositoryService.selectFirstExample(xRepositoryExample);
        if (xRepository == null) {
            return  new UniformReponseHandler().sendErrorResponse_System(new XtlExceptions("??????????????????!"));
        }
        OutputStream os =null ;
        try {

            Repository repository ;
            if(xTrans.getTransType().equals("db")){
                repository =  KettleUtil.conByNative(xRepository.getRepoId(),xRepository.getRepoName(),
                        xRepository.getRepoName(),xRepository.getRepoType(),
                        xRepository.getDbHost(),xRepository.getDbPort(),xRepository.getDbName(),
                        xRepository.getDbUsername(),xRepository.getDbPassword(),xRepository.getRepoUsername(),
                        xRepository.getRepoPassword()) ;
            }else {
                repository = KettleUtil.conFileRep(xTrans.getTransRepositoryId(),
                        xRepository.getRepoName(),xRepository.getBaseDir() );
            }

            TransMeta transMeta = KettleUtil.loadTrans(xTrans.getTransName(), xTrans.getTransPath(), repository);

            BufferedImage bufferedImage = KettleUtil.generateTransformationImage(transMeta);

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



    @GetMapping(value = "/getLogText",produces = "application/json")
    @ApiOperation("??????????????????")
    @LogAround("??????????????????")
    public BaseResult getLogText(
            @RequestParam(value = "transId",required = true)String transId
    )   {
        if(StringUtils.isEmpty(transId)){
            return BaseResult.fail();
        }

        Map param = new HashMap() ;
        param.put("transId", transId) ;
        Map result = extendMapper.qryTransLogText(param) ;
        return BaseResult.success(result==null?"??????????????????":result.get("logText")) ;
    }


    @RequestMapping(value = "/pauseTrans")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "transId" + "", value = "transId" + "", required = true, dataTypeClass = String.class),
    })
    @ApiOperation("??????????????????")
    @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.STOP)
    public BaseResult pauseTrans(
            @RequestParam(name = "transId",required = true) String transId) {
        if(StringUtils.isEmpty(transId)){
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }

        XTransExample xTransExample  = new XTransExample();
        xTransExample.createCriteria().andTransIdEqualTo(transId);
        XTrans xTrans = xTransService.selectFirstExample(xTransExample);
        if(xTrans ==null){
            return BaseResult.fail("???????????????!");
        }

        XTransStatus xTransStatus = null ;
        try {
            xTransStatus =  transService.doPauseTrans(xTrans);
        } catch (XtlExceptions e) {
            String msg = e.getMessage() ;
            return BaseResult.fail(msg) ;
        }

        return new UniformReponseHandler<>()
                .sendSuccessResponse("??????????????????,??????:"+xTransStatus.description());

    }

    @RequestMapping(value = "/resumeTrans")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "transId" + "", value = "transId" + "", required = true, dataTypeClass = String.class),
    })
    @ApiOperation("??????????????????")
    @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.OTHER)
    public BaseResult resumeTrans(
            @RequestParam(name = "transId",required = true) String transId) {
        if(StringUtils.isEmpty(transId)){
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }

        XTransExample xTransExample  = new XTransExample();
        xTransExample.createCriteria().andTransIdEqualTo(transId);
        XTrans xTrans = xTransService.selectFirstExample(xTransExample);
        if(xTrans ==null){
            return BaseResult.fail("???????????????!");
        }

        XTransStatus xTransStatus = null ;
        try {
            xTransStatus =  transService.doResumeTrans(xTrans);
        } catch (XtlExceptions e) {
            String msg = e.getMessage() ;
            return BaseResult.fail(msg) ;
        }

        return new UniformReponseHandler<>()
                .sendSuccessResponse("????????????????????????,??????:"+xTransStatus.description());

    }

        @PostMapping(value = "/startTrans")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "params" + "", value = "params" + "", required = true, dataTypeClass = Map.class),
    })
    @ApiOperation("??????????????????")
        @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.START)
        public BaseResult startTrans(
                @RequestBody Map params) {

        if(!params.containsKey("transId")){
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }
        String transId = params.get("transId")+"" ;
        XTransExample xTransExample  = new XTransExample();
        xTransExample.createCriteria().andTransIdEqualTo(transId);
        XTrans xTrans = xTransService.selectFirstExample(xTransExample);
        if(xTrans ==null){
            return BaseResult.fail("???????????????!");
        }

        // ??????????????????,????????????,???????????????????????????
//        boolean isExists = xTransSubmit.isExistTask(xTrans) ;
//        if(isExists){
//            return new UniformReponseHandler<>().sendErrorResponse_System(new XtlExceptions("???????????????????????????,??????????????????!"));
//        }
                //???start???????????????????????????????????????,.??????status????????????pending
                Map param = new HashMap() ;
        int currentTasks=0;
        try
            {
                param.put("transId", xTrans.getTransId());
                param.put("monitorType", "trans");
                String isMonitoredEnabled =  xTrans.getIsMonitorEnabled();
                if(StringUtils.isNotEmpty(isMonitoredEnabled) && isMonitoredEnabled.equals("1")){
                    logService.doAddMonitor(param);
                }
                xTransSubmit.submit(xTrans,params);
                  currentTasks = xTransSubmit.getCurrentTaskCounts() ;
                log.debug("??????????????????{}???",currentTasks);
            }catch (UserDefinedException ex ){
                throw  new UserDefinedException(BaseResultConstant.UNKNOW_EXCEPTION,ex.getMessage());
            }


        return new UniformReponseHandler<>().sendSuccessResponse("??????????????????,??????????????????"+currentTasks+"?????????");

    }

    @RequestMapping(value = "/addTrans2Sche")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "transId" + "", value = "transId" + "", required = true, dataTypeClass = String.class),
    })
    @ApiOperation("????????????????????????")
    @OperLog(moduleName = "????????????-??????",operationType = SysConstant.OperationType.SCHEDULER)
    public BaseResult addTrans2Sche(
            @RequestParam(name = "transId",required = true) String transId,
            @RequestParam(name = "cron", required = true) String cron,
            @RequestParam(name = "description", required = true) String description) {

        if (StringUtils.isEmpty(transId)) {
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }

        XTransExample xTransExample  = new XTransExample();
        xTransExample.createCriteria().andTransIdEqualTo(transId);
        XTrans xTrans = xTransService.selectFirstExample(xTransExample);
        if(xTrans ==null){
            return BaseResult.fail("???????????????!");
        }

        //???????????????????????????????????????????????????
        SchedulerFactory schedulerFactory = QuartzManager.schedulerFactory ;
        try {
            Scheduler scheduler = schedulerFactory.getScheduler() ;
            Map param = Constant.getQuartzBasic(xTrans.getTransName(), xTrans.getTransPath());
            JobKey jobKey = JobKey.jobKey(param.get("jobName")+"",
                    param.get("jobGroupName")+"");
            boolean exists =  scheduler.checkExists(jobKey);
            if(exists){
                return  new BaseResult(11002, "?????????????????????????????????,???????????????["+jobKey.getName()+"]", null);
            }
        } catch (SchedulerException e) {
            e.printStackTrace();
        }

        XQuartzExample xQuartzExample = new XQuartzExample();
        xQuartzExample.createCriteria().andTargetIdEqualTo(transId)
                .andQuartzTypeEqualTo("trans");
        XQuartz xQuartz = xQuartzService.selectFirstExample(xQuartzExample) ;
        if(xQuartz !=null ){
            xQuartz.setQuartzCron(cron);
            xQuartz.setQuartzDescription(description);
            xQuartz.setIsDel("0");
            xQuartzService.updateByExampleSelective(xQuartz, xQuartzExample);
        }else {
            xQuartz = new XQuartz() ;
            xQuartz.setQuartzId(GenCodeUtil.nextId());
            xQuartz.setTargetId(transId);
            xQuartz.setQuartzType("trans");
            xQuartz.setQuartzCron(cron);
            xQuartz.setQuartzDescription(description);
            xQuartz.setIsDel("0");
            xQuartzService.insertSelective(xQuartz) ;
            log.debug("????????????????????????!");
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        }

        try
        {
            xQuartHandleService.addTransToSche(xTrans);

        }catch (UserDefinedException ex )
        {
            throw  new UserDefinedException(BaseResultConstant.UNKNOW_EXCEPTION);
        }

        return new UniformReponseHandler<>()
                .sendSuccessResponse("??????????????????????????????!");

    }

    @RequestMapping(value = "/removeTransFromSche")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "transId" + "", value = "transId" + "", required = true, dataTypeClass = String.class),
    })
    @ApiOperation("????????????????????????")
    @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.SCHEDULER)
    public BaseResult removeTransFromSche(
            @RequestParam(name = "transId", required = true) String transId) {
        if (StringUtils.isEmpty(transId)) {
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }

        XTransExample xTransExample  = new XTransExample();
        xTransExample.createCriteria().andTransIdEqualTo(transId);
        XTrans xTrans = xTransService.selectFirstExample(xTransExample);
        if(xTrans ==null){
            return BaseResult.fail("???????????????!");
        }

        try {
            xQuartHandleService.removeTransFromSche(xTrans);
        }catch (UserDefinedException ex ){
            throw new UserDefinedException(BaseResultConstant.UNKNOW_EXCEPTION,"????????????????????????");
        }

        return new UniformReponseHandler<>()
                .sendSuccessResponse("?????????????????????????????????????????????!");

    }


    @RequestMapping(value = "/stopTrans")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "transId" + "", value = "transId" + "", required = true, dataTypeClass = String.class),
    })
    @ApiOperation("??????????????????")
    @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.STOP)
    public BaseResult stopTrans(
            @RequestParam(name = "transId", required = true) String transId) {
        if (StringUtils.isEmpty(transId)) {
        throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
    }

        XTransExample xTransExample  = new XTransExample();
        xTransExample.createCriteria().andTransIdEqualTo(transId);
        XTrans xTrans = xTransService.selectFirstExample(xTransExample);
        if(xTrans ==null){
            return BaseResult.fail("???????????????!");
        }

        XTransStatus xTransStatus =null ;
        try {
            xTransStatus =  transService.doStopTrans(xTrans);
        }catch (XtlExceptions e) {
            String msg = e.getMessage() ;
            return BaseResult.fail(msg) ;
        }

        return new UniformReponseHandler<>()
                .sendSuccessResponse("??????????????????,??????:"+xTransStatus.description());
    }

    @RequestMapping(value = "/killTrans")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "transId" + "", value = "transId" + "", required = true, dataTypeClass = String.class),
    })
    @ApiOperation("??????????????????")
    @OperLog(moduleName = "????????????-????????????",operationType = SysConstant.OperationType.STOP)
    public BaseResult killTrans(
            @RequestParam(name = "transId", required = true) String transId) {
        if (StringUtils.isEmpty(transId)) {
            throw new UserDefinedException(BaseResultConstant.PARAMETER_EXCEPTION);
        }
        XTransExample xTransExample  = new XTransExample();
        xTransExample.createCriteria().andTransIdEqualTo(transId);
        XTrans xTrans = xTransService.selectFirstExample(xTransExample);
        if(xTrans ==null){
            return BaseResult.fail("???????????????!");
        }
        XTransStatus xTransStatus = null ;
        try {
            xTransStatus =  transService.doKillTrans(xTrans);
        } catch (XtlExceptions e) {
            String msg = e.getMessage() ;
            return BaseResult.fail(msg) ;
        }

        return new UniformReponseHandler<>()
                .sendSuccessResponse("??????????????????,??????:"+xTransStatus.description());
    }


}

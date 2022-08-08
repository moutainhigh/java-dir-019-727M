package org.yaukie.frame.auth;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.yaukie.auth.constant.AjaxResult;
import org.yaukie.auth.service.api.CaptchaHandlerService;
import org.yaukie.base.annotation.LogAround;
import org.yaukie.base.constant.BaseResult;
import org.yaukie.base.constant.BaseResultConstant;
import org.yaukie.base.util.SpringContextUtil;
import org.yaukie.base.util.StringTools;
import org.yaukie.frame.util.FileIoUtil;

import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author: yuenbin
 * @Date :2021/5/12
 * @Time :16:45
 * @Motto: It is better to be clear than to be clever !
 * @Destrib: 验证码获取逻辑
 **/
@RestController
@RequestMapping(value = "/anon")
@Api(value = "匿名验证接口", description = "匿名验证接口")
@Slf4j
public class AnonController {


    @GetMapping(value = "/trialValid")
    @ApiOperation("验证软件是否过试用期")
    @LogAround("验证软件是否过试用期")
    public BaseResult trialValid() throws FileNotFoundException {

        BaseResult baseResult = BaseResult.success() ;
        String str = FileIoUtil.readSth();
        Date currentDate = new Date() ;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd HH:mm:ss");

        try {
            Date parse = dateFormat.parse(str);
            // 到期时间
            long endTime = 7* 24 * 60 *60 * 1000 ;
            endTime =  parse.getTime() + endTime  ;
           Date endDate = new Date(endTime);
           String endDateStr = dateFormat.format(endDate);
            long daysBetween=(currentDate.getTime()-parse.getTime()+1000000)/(60*60*24*1000);
              baseResult = new BaseResult(BaseResultConstant.SUCCESS.code,"当前软件是试用版将于"+endDateStr+"过期,如想购买正版请联系作者购买正版使用!!",endDateStr);
            if(daysBetween >=7  ){
                log.info("上次启动到现在相差了,{}天,上次启动日期为{}",daysBetween,str);
                baseResult = new BaseResult(BaseResultConstant.FAILED.code,"当前软件是试用版已于"+endDateStr+"过期,如想继续使用请联系作者购买正版!!",endDateStr);
            }

        }catch (Exception ex )
        {
            baseResult =  BaseResult.fail(ex.getMessage());
        }

        return baseResult ;
    }


}

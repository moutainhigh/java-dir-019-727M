package com.ubiquitous.market.fegin.api;


import com.ubiquitous.market.fegin.hystrix.LLMRiderFeignHystrix;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * 骑手服务Feign接口【容错服务降级处理】
 *
 * @author : fangyi
 * @date : 2020/2/28
 */
@FeignClient(value = "ubiquitous-RIDER", configuration = FeignSupportConfig.class, fallbackFactory = LLMRiderFeignHystrix.class, decode404 = true)
public interface LLMRiderFeignApi {


}

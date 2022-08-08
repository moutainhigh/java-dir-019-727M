package com.ubiquitous.market.fegin.hystrix;

import com.ubiquitous.market.fegin.api.LLMRiderFeignApi;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * @description: 服务熔断降级缺省回调类
 * @author: fy
 * @date: 2020/02/28
 **/
@Component
public class LLMRiderFeignHystrix implements FallbackFactory<LLMRiderFeignApi> {

    @Override
    public LLMRiderFeignApi create(Throwable throwable) {
        return null;
    }
}

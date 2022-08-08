package com.ubiquitous.market.data.wx;

import lombok.Data;

import java.util.Map;

/**
 * Created by admin on 2019/5/19.
 */
@Data
public class WeChatCommonTemplateMessageModel {

    /**
     * toUserOpenId
     */
    private String touser;

    private String template_id;

    private String page;

    private String form_id;

    private String url;

    private Map<String, WeChatTemplateValueModel> data;

    private Miniprogram miniprogram;


    @Data
    public static class Miniprogram {

        private String appid;

        private String pagepath;

    }
}

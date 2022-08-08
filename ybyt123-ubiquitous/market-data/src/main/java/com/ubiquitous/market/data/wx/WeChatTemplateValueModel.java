package com.ubiquitous.market.data.wx;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by admin on 2019/5/20.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class WeChatTemplateValueModel {

    public WeChatTemplateValueModel(String value) {
        this.value = value;
    }

    private String value;

    private String color;

}

package com.example.yang.richeditor.model;

/**
 * Title:
 * Description:
 *
 * @author yangzhengqiang
 * @version 2019-05-14
 */
public class InlineImageSpanVm<T extends IInlineImageSpanObtainObject> {

    private T spanObject;

    public InlineImageSpanVm(T spanObject) {
        this.spanObject = spanObject;
    }

    public T getSpanObject() {
        return spanObject;
    }

    public void setSpanObject(T spanObject) {
        this.spanObject = spanObject;
    }
}

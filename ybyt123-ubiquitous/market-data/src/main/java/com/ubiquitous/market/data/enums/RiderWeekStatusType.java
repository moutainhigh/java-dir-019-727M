package com.ubiquitous.market.data.enums;

public enum RiderWeekStatusType {
    REST(0, "休息中"),
    BUSINESS(1, "开工中");

    private int code;

    private String msg;

    RiderWeekStatusType(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }


    public String getMsg() {
        return msg;
    }
}

package com.example.yang.myapplication;

import java.io.IOException;

import okhttp3.Call;

/*
*   网络消息回调
*   如果链接成功，并且服务器返回链接消息，由succesd处理
*   如果连接失败，由failed处理连接失败事件
*   文件名：HttpResponse
*   作者：yang
*   时间：2018/05/27*/

public interface HttpResponse {
    void succesd(Call call,String response);
    void failed(Call call, IOException e);
}

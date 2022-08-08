package com.itheima.spring;


import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.client.RestHighLevelClient;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@SpringBootTest
@RunWith(SpringRunner.class)
public class Test_01 {
    @Autowired
    private RestHighLevelClient client;

    @Test
    public void contextLoad() {
//        //创建客户端 对象
//        RestHighLevelClient client=new RestHighLevelClient(RestClient.builder(
//          new HttpHost(
//                  "192.168.13.42",
//                  9200,
//                  "http"
//          )
//        ));
        System.out.println(client);
    }
/*
批量 操作
 */

    //创建批量操作对象
    @Test
    public void addBulk() {
        BulkRequest bulkRequest = new BulkRequest();

    }


}

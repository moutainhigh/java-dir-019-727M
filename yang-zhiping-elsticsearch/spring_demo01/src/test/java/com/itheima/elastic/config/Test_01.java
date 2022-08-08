package com.itheima.elastic.config;

import com.alibaba.fastjson.JSON;
import com.itheima.elastic.domain.Person;
import org.elasticsearch.action.admin.indices.delete.DeleteIndexRequest;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.support.master.AcknowledgedResponse;
import org.elasticsearch.client.IndicesClient;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.client.indices.GetIndexResponse;
import org.elasticsearch.cluster.metadata.MappingMetaData;
import org.elasticsearch.common.xcontent.XContentType;
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
    添加索引
     */
    @Test
    public void addContext() throws IOException {
        //使用 clent 对获取索引对象

        IndicesClient indices = client.indices();

        CreateIndexRequest createRequest = new CreateIndexRequest("itheima01");
        CreateIndexResponse response = indices.create(createRequest, RequestOptions.DEFAULT);
        //具体操作,获取 返回值
        //根据返回值判断结果
        System.out.println(response.isAcknowledged());

    }

    /*
       添加索引并且添加映射
        */
    @Test
    public void addIndexAndMapping() throws IOException {
        //1.使用client获取操作索引的对象
        IndicesClient indicesClient = client.indices();
        //2.具体操作，获取返回值
        CreateIndexRequest createRequest = new CreateIndexRequest("itcast01");
        //2.1 设置mappings
        String mapping = "{\n" +
                "      \"properties\" : {\n" +
                "        \"address\" : {\n" +
                "          \"type\" : \"text\",\n" +
                "          \"analyzer\" : \"ik_max_word\"\n" +
                "        },\n" +
                "        \"age\" : {\n" +
                "          \"type\" : \"long\"\n" +
                "        },\n" +
                "        \"name\" : {\n" +
                "          \"type\" : \"keyword\"\n" +
                "        }\n" +
                "      }\n" +
                "    }";
        createRequest.mapping(mapping, XContentType.JSON);


        CreateIndexResponse response = indicesClient.create(createRequest, RequestOptions.DEFAULT);

        //3.根据返回值判断结果
        System.out.println(response.isAcknowledged());


    }

    /*
    查询索引

     */
    @Test
    public void queryIndex() throws IOException {

        //获取索引对象
        IndicesClient indices = client.indices();
        GetIndexRequest getRequest = new GetIndexRequest("itcast01");
        GetIndexResponse response = indices.get(getRequest, RequestOptions.DEFAULT);

        //获取结果
        Map<String, MappingMetaData> mappings = response.getMappings();

        for (String key: mappings.keySet()) {
            System.out.println(key+":"+mappings.get(key).getSourceAsMap());
        }

    }
    /*
    删除 索引
     */
    @Test
    public void delete() throws IOException {
        //获取索引对象
        IndicesClient indices = client.indices();
        DeleteIndexRequest indexRequest = new DeleteIndexRequest("itcast");
        AcknowledgedResponse response = indices.delete(indexRequest, RequestOptions.DEFAULT);
        System.out.println(response.isAcknowledged());
    }
    /*
    判断 索引是否存在
     */
    @Test
    public void  existed() throws IOException {
        IndicesClient indices = client.indices();
        GetIndexRequest indexRequest = new GetIndexRequest("itheima");
        boolean exists = indices.exists(indexRequest, RequestOptions.DEFAULT);
        System.out.println(exists);

    }
    //   System.out.println("以上是关于索引的增删改查");

    /*
    关于文档的增删改查
     */
    /*
    添加文档
     */
    @Test

    public void addDoc() throws IOException {
        //还是要获取文档对象
        Map data=new HashMap<>();
        //添加数据
        //添加数据,获取结果
        data.put("address","北京");
        data.put("name","武则天");
        data.put("age",20);
        IndexRequest indexRequest =new IndexRequest("itcast").id("1").source(data) ;

        IndexResponse response = client.index(indexRequest, RequestOptions.DEFAULT);

     //   打印响应结果
        System.out.println(response.getId());
    }
    @Test
//使用对象 作为 数据
    public void addDoc01() throws IOException {
        //还是要获取文档对象
        Person p=new Person();
        p.setAddress("乔家大院");
        p.setAge(150);
        p.setId("2");
        p.setName("山西");
        //将对象转为json对象,先要 导入fastjson依赖
        String data = JSON.toJSONString(p);

        IndexRequest indexRequest =new IndexRequest("itcast04").id("1").source(data,XContentType.JSON) ;

        IndexResponse response = client.index(indexRequest, RequestOptions.DEFAULT);

        //   打印响应结果
        System.out.println(response.getId());
    }
    /*
    修改文档,和添加文档 一样,如果 id存在则就修改,如果id不存在 ,就添加
     */
    @Test
//使用对象 作为 数据
    public void addDoc02() throws IOException {
        //还是要获取文档对象
        Person p=new Person();
        p.setAddress("王家大院");
        p.setAge(150);
        p.setId("2");
        p.setName("山西");
        //将对象转为json对象,先要 导入fastjson依赖
        String data = JSON.toJSONString(p);

        IndexRequest indexRequest =new IndexRequest("itcast04").id("1").source(data,XContentType.JSON) ;

        IndexResponse response = client.index(indexRequest, RequestOptions.DEFAULT);

        //   打印响应结果
        System.out.println(response.getId());
    }
    /*
    根据id查询
     */
    @Test
    public void findOne() throws IOException {
        GetRequest getRequest = new GetRequest("itcast04","1");
        GetResponse response = client.get(getRequest, RequestOptions.DEFAULT);
        //获取数据对应的json
        System.out.println(response.getSourceAsString());

    }
    //删除文档
    @Test
    public void deleteDoc() throws IOException {
        DeleteRequest deleteRequest = new DeleteRequest("itcast04","1");
        DeleteResponse response = client.delete(deleteRequest, RequestOptions.DEFAULT);
        System.out.println(response.getId());

    }

}

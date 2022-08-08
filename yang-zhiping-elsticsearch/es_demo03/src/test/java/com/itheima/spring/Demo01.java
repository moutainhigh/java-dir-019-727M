package com.itheima.spring;

import com.alibaba.fastjson.JSON;
import com.itheima.spring.domain.Goods;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.TotalHits;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.index.query.*;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.elasticsearch.search.sort.SortOrder;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.swing.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@SpringBootTest
public class Demo01 {
    @Autowired
    private RestHighLevelClient client;

    /*
    查询搜索是重点练习---查询所有,matchAll,分页显示10条
     */
    @Test
    public void matchAll() throws IOException {
        //构建查询请求对象 ,指定查询的索引 名称
        SearchRequest searchRequest = new SearchRequest("goods");
        //创建查询条件构建器SearchSourceBuilder
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        //查询条件 ,查询所有文档
        MatchAllQueryBuilder query = QueryBuilders.matchAllQuery();

        //指定 查询 条件
        sourceBuilder.query(query);
        //添加 查询条件构建器
        searchRequest.source(sourceBuilder);
        //添加分页信息
        sourceBuilder.from(0);
        sourceBuilder.size(100);
        //查询,获取 查询结果
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

//获取命中对象
        SearchHits searchHits = searchResponse.getHits();

        //获取总记录数
        long value = searchHits.getTotalHits().value;

        System.out.println("总记录数" + value);

        List<Goods> goodsList = new ArrayList<>();
        //获取hits数据数组
        SearchHit[] hits = searchHits.getHits();

        for (SearchHit hit : hits) {
            //获取json字符串格式 的数据
            String sourceAsString = hit.getSourceAsString();

            //转为Java对象
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);
            goodsList.add(goods);


        }
        for (Goods goods : goodsList) {
            System.out.println(goods);
        }


    }

    /*
    term词条查询
     */
    @Test
    public void testTermQuery() throws IOException {
        SearchRequest searchRequest = new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        TermQueryBuilder query = QueryBuilders.termQuery("title", "华为");
        sourceBuilder.query(query);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
        SearchHits searchHits = searchResponse.getHits();
        //获取总记录数
        long value = searchHits.getTotalHits().value;
        System.out.println("总记录数" + value);
        List<Goods> goodsList = new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);
            goodsList.add(goods);


        }

        for (Goods goods : goodsList) {
            System.out.println(goods);
        }

    }

    /*
    词条分词查询 matchQuery
     */
    @Test
    public void TestMatchQuery() throws IOException {
        SearchRequest searchRequest = new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        MatchQueryBuilder query = QueryBuilders.matchQuery("title", "华为手机");
        query.operator(Operator.AND);//求并集
        sourceBuilder.query(query);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
        SearchHits searchHits = searchResponse.getHits();
        //获取总记录 条数
        long value = searchHits.getTotalHits().value;
        System.out.println("总记录条数" + value);

        List<Goods> goodsList = new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);

            goodsList.add(goods);


        }

        for (Goods goods : goodsList) {
            System.out.println(goods);
        }

    }

    /*
    模糊查询wildcardQuery
     */
    @Test
    public void testWildcardQuery() throws IOException {
        SearchRequest searchRequest = new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        WildcardQueryBuilder query = QueryBuilders.wildcardQuery("title", "华*");
        sourceBuilder.query(query);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
        SearchHits searchHits = searchResponse.getHits();
        long value = searchHits.getTotalHits().value;
        System.out.println("总记录数" + value);
        List<Goods> goodsList = new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();

        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);
            goodsList.add(goods);


        }

        for (Goods goods : goodsList) {
            System.out.println(goods);
        }

    }

    /*
    模糊查询
     */
    @Test
    public void testRegexQuery() throws IOException {
//        //获取请求索引 的 对象
        SearchRequest searchRequest = new SearchRequest("goods");
        //h获取查询条件 构建器对象
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        RegexpQueryBuilder query = QueryBuilders.regexpQuery("title", "\\w+(.)*");
        sourceBuilder.query(query);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

        SearchHits searchHits = searchResponse.getHits();

        long value = searchHits.getTotalHits().value;
        System.out.println("总条数" + value);
        List<Goods> goodsList = new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);
            goodsList.add(goods);


        }
        for (Goods goods : goodsList) {
            System.out.println(goods);
        }
    }

    /*
    模糊查询,根据前缀查询
     */
    @Test
    public void testPreFixQuery() throws IOException {
        SearchRequest searchRequest = new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        PrefixQueryBuilder query = QueryBuilders.prefixQuery("brandName", "三");
        sourceBuilder.query(query);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
        SearchHits searchHits = searchResponse.getHits();
        long value = searchHits.getTotalHits().value;
        System.out.println("总条数" + value);

        List<Goods> goodsList = new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);
            goodsList.add(goods);
        }

        for (Goods goods : goodsList) {
            System.out.println(goods);
        }

    }

    /*
范围查询:rangeQuery
     */
    @Test
    public void testRangeQuery() throws IOException {
        SearchRequest searchRequest = new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        RangeQueryBuilder query = QueryBuilders.rangeQuery("price");
        //指定下限
        query.gte(2000);
        //指定 上线
        query.lte(3000);
        sourceBuilder.query(query);
        //排序
        sourceBuilder.sort("price", SortOrder.ASC);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
        SearchHits searchHits = searchResponse.getHits();

        long value = searchHits.getTotalHits().value;
        System.out.println("总条数" + value);
        List<Goods> goodsList = new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);

            goodsList.add(goods);


        }
        for (Goods goods : goodsList) {
            System.out.println(goods);
        }


    }

    /*
       queryString查询
        */
    @Test
    public void testQueryString() throws IOException {
        SearchRequest searchRequest = new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        QueryStringQueryBuilder query = QueryBuilders.queryStringQuery("华为手机").field("title").field("categoryName").field("brandName").defaultOperator(Operator.AND);


        sourceBuilder.query(query);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
        SearchHits searchHits = searchResponse.getHits();

        long value = searchHits.getTotalHits().value;
        System.out.println("总条数" + value);


        List<Goods> goodsList = new ArrayList<>();

        SearchHit[] hits = searchHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);
            goodsList.add(goods);


        }
        for (Goods goods : goodsList) {
            System.out.println(goods);
        }

/*
布尔查询boolQuery,其实 就是对 多个查询拼接连接起来
 */
    }

    @Test
    public void testBoolQuery() throws IOException {
        SearchRequest searchRequest = new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        BoolQueryBuilder query = QueryBuilders.boolQuery();
        TermQueryBuilder termQuery = QueryBuilders.termQuery("brandName", "华为");
        query.must(termQuery);
        MatchQueryBuilder matchQuery = QueryBuilders.matchQuery("title", "手机");

        query.filter(matchQuery);

        RangeQueryBuilder rangeQuery = QueryBuilders.rangeQuery("price");

        ((RangeQueryBuilder) rangeQuery).gte(2000);
        ((RangeQueryBuilder) rangeQuery).lte(3000);

        query.filter(rangeQuery);
        sourceBuilder.query(query);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

        SearchHits searchHits = searchResponse.getHits();

        long value = searchHits.getTotalHits().value;
        System.out.println("总条数" + value);
        List<Goods> goodsList = new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();

        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);

            goodsList.add(goods);
        }
        for (Goods goods : goodsList) {
            System.out.println(goods);
        }

    }

    /*
聚合函数,桶函数 ,分组函数
查询包含手机的数据
查询品牌列表
     */
    @Test

    public void testHighLightQuery() throws IOException {
        SearchRequest searchRequest = new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        //查询 包含手机的数据
        MatchQueryBuilder query = QueryBuilders.matchQuery("title", "手机");
        sourceBuilder.query(query);
        /*
        查询 品牌列表
         */

        TermsAggregationBuilder agg = AggregationBuilders.terms("goods_brands").field("brandName").size(100);
        sourceBuilder.aggregation(agg);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

        SearchHits searchHits = searchResponse.getHits();

        long value = searchHits.getTotalHits().value;
        System.out.println("总条数" + value);

        List<Goods> goodsList = new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);
            goodsList.add(goods);


        }

        for (Goods goods : goodsList) {
            System.out.println(goods);
        }
        //获取聚合结果
        Aggregations aggregations = searchResponse.getAggregations();

        Map<String, Aggregation> aggregationMap = aggregations.asMap();

        Terms goods_brands = (Terms) aggregationMap.get("goods_brands");
        List<? extends Terms.Bucket> buckets = goods_brands.getBuckets();

        List brands = new ArrayList();
        for (Terms.Bucket bucket : buckets) {
            Object key = bucket.getKey();
            brands.add(key);

        }
        for (Object brand : brands) {
            System.out.println(brand);
        }
    }

    /*
    高亮查询
    1设置 高亮
    2高亮字段
    3前缀
    4后缀
    5将高亮的 字段数据,替换原有数据
     */
    @Test
    public void testHightQuery() throws IOException {
        SearchRequest searchRequest = new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        //1查询 title包含 手机的数据
        MatchQueryBuilder query = QueryBuilders.matchQuery("title", "手机");
        sourceBuilder.query(query);
        //1设置 高亮
        HighlightBuilder highlight = new HighlightBuilder();
        //设置三要素
        highlight.field("title");
        highlight.preTags("<font color='red'>");
        highlight.postTags("</font>");
        sourceBuilder.highlighter(highlight);
        /*
        查询品牌列表
        参数:1自定义名称,将用来获取数据
        分组的字段
         */
        TermsAggregationBuilder agg = AggregationBuilders.terms("goods_brands").field("brandName").size(100);
        sourceBuilder.aggregation(agg);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

        SearchHits searchHits = searchResponse.getHits();
        long value = searchHits.getTotalHits().value;
        System.out.println("总条数" + value);
        List<Goods> goodsList = new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);

            Map<String, HighlightField> highlightFields = hit.getHighlightFields();

            HighlightField highlightField = highlightFields.get("title");
            Text[] fragments = highlightField.fragments();
            goods.setTitle(fragments[0].toString());

            goodsList.add(goods);


        }

        for (Goods goods : goodsList) {
            System.out.println(goods);
        }

        // 获取聚合结果
        Aggregations aggregations = searchResponse.getAggregations();

        Map<String, Aggregation> aggregationMap = aggregations.asMap();

        //System.out.println(aggregationMap);
        Terms goods_brands = (Terms) aggregationMap.get("goods_brands");

        List<? extends Terms.Bucket> buckets = goods_brands.getBuckets();

        List brands = new ArrayList();
        for (Terms.Bucket bucket : buckets) {
            Object key = bucket.getKey();
            brands.add(key);
        }

        for (Object brand : brands) {
            System.out.println(brand);
        }

    }

    /*
    布尔查询查询品牌名称为 华为
    查询标题 包含手机
    查询价格在2000-3000
     */
    @Test
    public void bool() throws IOException {
        SearchRequest searchRequest = new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        //构造布尔查询
        BoolQueryBuilder query = QueryBuilders.boolQuery();

        //构建各个查询条件
        TermQueryBuilder termQuery = QueryBuilders.termQuery("brandName", "华为");

        query.must(termQuery);
        //查询标题包含手机
        MatchQueryBuilder matchQuery = QueryBuilders.matchQuery("title", "手机");
        query.must(matchQuery);
        //查询价格在 2000-3000
        RangeQueryBuilder rangeQuery = QueryBuilders.rangeQuery("price");
        RangeQueryBuilder gte = rangeQuery.gte(2000);
        RangeQueryBuilder lte = rangeQuery.lte(3000);
        query.filter(rangeQuery);
        //使用布尔查询拼接
        sourceBuilder.query(query);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
        SearchHits searchHits = searchResponse.getHits();
        //获取记录数
        long value = searchHits.getTotalHits().value;
        System.out.println("总条数" + value);
        List<Goods> goodsList = new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);

            goodsList.add(goods);
        }
        for (Goods goods : goodsList) {
            System.out.println(goods);
        }

    }
    /*
    高亮查询
     */
    @Test
    public void hight() throws IOException {
        SearchRequest  searchRequest=new SearchRequest("goods");
        SearchSourceBuilder sourceBuilder=new SearchSourceBuilder();
        //查询 标题包含手机的数据
        MatchQueryBuilder query = QueryBuilders.matchQuery("title", "手机");
        sourceBuilder.query(query);
        //设置高亮
        HighlightBuilder highlightBuilder=new HighlightBuilder();
        //设置三要素
        highlightBuilder.field("title");
        highlightBuilder.preTags("<font color='red'>");
        highlightBuilder.postTags("</font>");
        sourceBuilder.highlighter(highlightBuilder);
        /*
        查询品牌列表
         */
        AggregationBuilder agg = AggregationBuilders.terms("goods_brands").field("brandName").size(100);
        sourceBuilder.aggregation(agg);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

        SearchHits searchHits = searchResponse.getHits();

        long value = searchHits.getTotalHits().value;
        System.out.println("总条数"+value);
        List<Goods> goodsList=new ArrayList<>();
        SearchHit[] hits = searchHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Goods goods = JSON.parseObject(sourceAsString, Goods.class);
            //获取的 高亮结果,替换原先的列表
            Map<String, HighlightField> highlightFields = hit.getHighlightFields();

            HighlightField highlightField = highlightFields.get("title");

            Text[] fragments = highlightField.fragments();
            //替换
            goods.setTitle(fragments[0].toString());
            goodsList.add(goods);




        }

        for (Goods goods : goodsList) {
            System.out.println(goods);
        }

    }
}

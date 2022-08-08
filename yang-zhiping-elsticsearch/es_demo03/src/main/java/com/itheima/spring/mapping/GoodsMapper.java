package com.itheima.spring.mapping;

import com.itheima.spring.domain.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface GoodsMapper {
    /*
    查询所有
     */
    public List<Goods> findAll();
}

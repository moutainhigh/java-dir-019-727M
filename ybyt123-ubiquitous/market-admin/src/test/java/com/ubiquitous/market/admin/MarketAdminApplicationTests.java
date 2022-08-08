package com.ubiquitous.market.admin;

import com.ubiquitous.market.data.mapper.SkuMapper;
import com.ubiquitous.market.data.mapper.StorageMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MarketAdminApplicationTests {


	@Autowired
	private StorageMapper storageMapper;

	@Autowired
	private SkuMapper skuMapper;

	@Test
	public void contextLoads() {

		List<String> list = skuMapper.selectCodes();
		System.out.println(list);
	}

}

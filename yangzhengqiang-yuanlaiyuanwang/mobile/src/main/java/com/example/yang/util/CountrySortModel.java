/*      						
 * Copyright 2010 Beijing Xinwei, Inc. All rights reserved.
 * 
 * History:
 * ------------------------------------------------------------------------------
 * Date    	|  Who  		|  What  
 * 2015��3��21��	| duanbokan 	| 	create the file                       
 */

package com.example.yang.util;

/**
 *
 * 类简要描述
 *
 * <p>
 * 类详细描述
 * </p>
 *
 * @author duanbokan
 *
 */

public class CountrySortModel extends CountryModel

{
	// 显示数据拼音的首字母
	public String sortLetters;

	public CountrySortToken sortToken = new CountrySortToken();

	public CountrySortModel(String name, String number, String countrySortKey)
	{
		super(name, number, countrySortKey);
	}

}

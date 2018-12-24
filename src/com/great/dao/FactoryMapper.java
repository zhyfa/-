package com.great.dao;

import java.util.List;
import java.util.Map;

public interface FactoryMapper {
	//通过工厂名，查询工厂id
	public int getFactoryId(String factory_name);
	
	// 查询工厂列表的全部数据
	public List<Map<String, Object>> factoris();
	
}

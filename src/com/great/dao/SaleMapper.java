package com.great.dao;

import java.util.List;
import java.util.Map;

public interface SaleMapper {
	//获取这一周的每天的营业额
	public List<Map<String, Object>> getWeekMoney();
}

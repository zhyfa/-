package com.great.dao;

import java.util.List;
import java.util.Map;

public interface SaleMapper {
	// 获取本周的每天的营业额
	public List<Map<String, Object>> getWeekMoney();

	// 获取本月的每周的营业额
	public List<Map<String, Object>> getMonthMoney();
}

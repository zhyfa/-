package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface ReportMapper {
	public List<Map<String, Object>> queryIn(Map<String, Object> map);
	public List<Map<String, Object>> queryOut(Map<String, Object> map);
	public List<Map<String, Object>> queryPrice(Map<String, Object> map);
	public List<Map<String, Object>> queryProfit(Map<String, Object> map);
}

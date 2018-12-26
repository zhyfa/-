package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.ReportMapper;

@Service
public class ReportService {
	@Autowired
	private ReportMapper reportMapper;
	public List<Map<String, Object>> queryIn(Map<String, Object> map){
		return reportMapper.queryIn(map);
	}
	
	public List<Map<String, Object>> queryOut(Map<String, Object> map){
		return reportMapper.queryOut(map);
	}
	
	public List<Map<String, Object>> queryPrice(Map<String, Object> map){
		return reportMapper.queryPrice(map);
	}
	
	public List<Map<String, Object>> queryProfit(Map<String, Object> map){
		return reportMapper.queryProfit(map);
	}
}

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
	public List<Map<String, Object>> queryIn(){
		return reportMapper.queryIn();
	}
	
	public List<Map<String, Object>> queryOut(){
		return reportMapper.queryOut();
	}
}

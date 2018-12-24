package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.dao.SaleMapper;

@Service
public class SaleService {
	@Resource
	private SaleMapper saleMapper;
	//获取这一周的每天的营业额
	public List<Map<String, Object>> getWeekMoney(){
		return saleMapper.getWeekMoney();
	};
	
}

package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.dao.FactoryMapper;

@Service
public class FactoryService {
	@Resource
	private FactoryMapper factoryMapper;

	// 通过工厂名，查询工厂id
	public int getFactoryId(String factory_name) {
		return factoryMapper.getFactoryId(factory_name);
	};

	public List<Map<String, Object>> factoris() {
		return factoryMapper.factoris();
	}
}

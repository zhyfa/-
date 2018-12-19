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
	public List<Map<String, Object>> factoris(){
		return factoryMapper.factoris();
	}
}

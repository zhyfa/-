package com.great.service;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.MenuMapper;

@Service
public class MenuService {
	@Autowired
	private MenuMapper menuMapper;
	//查询menu（权限表）表的全部信息
	public List<Map<String, Object>> quaryAll() {
		return menuMapper.quaryAll();
	}
}

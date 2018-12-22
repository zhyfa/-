package com.great.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.great.dao.SpecialDrugMapper;

@Service
public class SpecialDrugService {
	@Resource
	private SpecialDrugMapper specialDrugMapper;

	public List<Map<String, Object>> queryAllByCondition(Integer pageIndex, Integer NUMBER, String drug_name, String start,
			String end) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageIndex,NUMBER);
		Map<String, Object> map=new HashMap<>();
		map.put("drug_name", drug_name);
		map.put("start", start);
		map.put("end", end);
		return specialDrugMapper.queryAll(map);
	}

//	public List<Map<String, Object>> queryAll() {
//		// TODO Auto-generated method stub
//		return specialDrugMapper.queryAll();
//	}
	
	public List<Map<String, Object>> queryAllSpecialSale(Integer pageIndex, Integer NUMBER, String drug_name, String start, String end){
		PageHelper.startPage(pageIndex,NUMBER);
		Map<String, Object> map=new HashMap<>();
		map.put("drug_name", drug_name);
		map.put("start", start);
		map.put("end", end);
		return specialDrugMapper.queryAllSpecialSale(map);
	};
	
	public List<Map<String, Object>> queryAllSpecialHave(Integer pageIndex, Integer NUMBER, String drug_name){
		PageHelper.startPage(pageIndex,NUMBER);
		Map<String, Object> map=new HashMap<>();
		map.put("drug_name", drug_name);
		return specialDrugMapper.queryAllSpecialHave(map);
	};
}

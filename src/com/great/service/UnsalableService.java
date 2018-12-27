package com.great.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.bean.Inventory;
import com.great.bean.Unsalable;
import com.great.dao.UnsalableMapper;

@Service
public class UnsalableService {
	@Autowired
	private UnsalableMapper unsalableMapper;
	
	public List<Inventory> getInventorys(){
		return unsalableMapper.getInventorys();
	};
	
	public Unsalable getUnsalableRule() {
		return unsalableMapper.getUnsalableRule();
	};
	
	public Integer getSoldNum(Integer drug_id) {
		return unsalableMapper.getSoldNum(drug_id);
	};
}

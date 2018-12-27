package com.great.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.great.bean.Inventory;
import com.great.bean.Unsalable;

@Repository
public interface UnsalableMapper {

	public List<Inventory> getInventorys();
	
	public Unsalable getUnsalableRule();
	
	public Integer getSoldNum(Integer drug_id);
}

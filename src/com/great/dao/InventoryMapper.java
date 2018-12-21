package com.great.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.great.bean.Drug;
import com.great.bean.Inventory;
@Repository
public interface InventoryMapper {
	
	//===================jyf开始
	public List<Drug> getInventorys();
	
	public List<Inventory> getInventorysByDrugId(Integer drug_id);
	
	public int returnStockRequest(Integer inventory_id);
	
	public List<Inventory> getInventorysforStock();
	
	public int returnStockRequestPass(Integer inventory_id);
	public int returnStockRequestNotPass(Integer inventory_id);
	//===================jyf结束
}

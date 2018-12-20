package com.great.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.bean.Drug;
import com.great.bean.Inventory;
import com.great.dao.InventoryMapper;

@Service
public class InventoryService {

	@Autowired
	private InventoryMapper inventoryMapper;
	
	public List<Drug> getInventorys() {
		return inventoryMapper.getInventorys();
		
	};
	public List<Inventory> getInventorysByDrugId(Integer drug_id){
		return inventoryMapper.getInventorysByDrugId(drug_id);
	};
	public int returnStockRequest(Integer inventory_id) {
		return inventoryMapper.returnStockRequest(inventory_id);
	};
	public List<Inventory> getInventorysforStock(){
		return inventoryMapper.getInventorysforStock();
	};
	
	public int returnStockRequestPass(Integer inventory_id) {
		return inventoryMapper.returnStockRequestPass(inventory_id);
		
	};
	public int returnStockRequestNotPass(Integer inventory_id) {
		return inventoryMapper.returnStockRequestNotPass(inventory_id);
		
	};
}

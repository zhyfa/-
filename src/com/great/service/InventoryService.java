package com.great.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional  
	public int returnStockRequestPass(Inventory inventory) {
		int res = inventoryMapper.returnStockRequestPass(inventory.getInventory_id());
		int res1 = inventoryMapper.pharmacyReturnAdd(inventory);
		return 1;
		
	};
	public int returnStockRequestNotPass(Integer inventory_id) {
		return inventoryMapper.returnStockRequestNotPass(inventory_id);
	};
	//报损申请  
	public int lossRequest(Integer inventory_id) {
		return inventoryMapper.lossRequest(inventory_id);
	};
	public int lossRequestPass(Integer inventory_id) {
		return inventoryMapper.lossRequestPass(inventory_id);
	};
	public int lossRequestNotPass(Integer inventory_id) {
		return inventoryMapper.lossRequestNotPass(inventory_id);
	};
}

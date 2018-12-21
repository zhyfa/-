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
	public List<Inventory> getInventoryssByDrugId(Integer drug_id){
		return inventoryMapper.getInventoryssByDrugId(drug_id);
	};
	public int returnStockRequest(Integer inventory_id) {
		return inventoryMapper.returnStockRequest(inventory_id);
	};
	public List<Inventory> getInventorysforStock(){
		return inventoryMapper.getInventorysforStock();
	};
	public List<Inventory> getInventorysForAdmin(){
		return inventoryMapper.getInventorysForAdmin();
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
	public int badDrugRequest(Integer inventory_id) {
		return inventoryMapper.badDrugRequest(inventory_id);
		
	};
	//报损申请    通过
	public int badDrugPass(Inventory inventory) {
		return inventoryMapper.badDrugPass(inventory.getInventory_id());
		
	};
	//报损申请   不通过
	public int badDrugNotPass(Integer inventory_id) {
		return inventoryMapper.badDrugNotPass(inventory_id);
		
	};
}

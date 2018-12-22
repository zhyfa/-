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
	public List<Inventory> getInventoryssByDrugId(Integer drug_id);
	
	public List<Inventory> getInventorysforStock();
	public List<Inventory> getInventorysForAdmin();
	
	//退库申请
	public int returnStockRequest(Integer inventory_id);
	public int returnStockRequestPass(Integer inventory_id);
	public int pharmacyReturnAdd(Inventory inventory);
	
	public int returnStockRequestNotPass(Integer inventory_id);
	
	//lossRequest  报损申请
	public int badDrugRequest(Integer inventory_id);
	public int badDrugPass(Integer inventory_id);
	public int badDrugNotPass(Integer inventory_id);
	//===================jyf结束
}

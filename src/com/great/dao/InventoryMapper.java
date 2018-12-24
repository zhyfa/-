package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Drug;
import com.great.bean.Inventory;
import com.great.bean.Overdue;
import com.great.bean.SaleNum;
@Repository
public interface InventoryMapper {
	
	//获取药房药品表的信息
	public List<Map<String, Object>> inventoryDrugs(Map<String, Object> map);
	
	
	
	//通过drug_id,birthday,factory_id定位到药房药品表的某一行,看是否存在
	public Map<String, Object> checkRow(Map<String, Object> map);
	//新增一条数据
	public int addRow(Map<String, Object> map);
	//通过drug_id,birthday,factory_id定位到药房药品表的某一行，修改它的值
	public void updateByApply(Map<String, Object> map);
	
	
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
	
	public List<Overdue> getOverdues();//药房 药品 过期检测
	//===================jyf结束
	
	//JYF 12.24 getDrugByIdforChuku
		public Drug getDrugByIdforChuku(Integer drug_id);
		
		//getInventorysByDrugIdForSold
		public List<Inventory>  getInventorysByDrugIdForSold(Integer drug_id);
		
		public int UpdateSaleNum(SaleNum saleNum);
	
}

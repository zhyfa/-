package com.great.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Banned;
import com.great.bean.Drug;
import com.great.bean.Inventory;
import com.great.bean.Overdue;
import com.great.bean.PharmacyReturn;
import com.great.bean.Reimburse;
import com.great.bean.SaleNum;
import com.great.bean.Sold;

@Repository
public interface InventoryMapper {

	// 获取药房药品表的信息
	public List<Map<String, Object>> inventoryDrugs(Map<String, Object> map);

	// 通过drug_id,birthday,factory_id定位到药房药品表的某一行,看是否存在
	public Map<String, Object> checkRow(Map<String, Object> map);

	// 新增一条数据
	public int addRow(Map<String, Object> map);

	// 通过drug_id,birthday,factory_id定位到药房药品表的某一行，修改它的值
	public void updateByApply(Map<String, Object> map);

	// ===================jyf开始
	public List<Drug> getInventorys();

	public List<Inventory> getInventorysByDrugId(Integer drug_id);

	public List<Inventory> getInventoryssByDrugId(Integer drug_id);

//	public List<Inventory> getInventorysforStock();



	// 退库申请
	public int pharmacyReturnAdd(PharmacyReturn pharmacyReturn);
	public int updateInventoryNumReturnStock(PharmacyReturn pharmacyReturn);
	//得到 药房  退库 记录
	public List<PharmacyReturn> getPharmacyReturns(PharmacyReturn pharmacyReturn);
	//撤销  申请 
	public int delPharmacyReturnById(PharmacyReturn pharmacyReturn);
	public int revokePharmacyReturn(PharmacyReturn pharmacyReturn);
	// 审批 通过 申请
	public int returnStockRequestPass(PharmacyReturn pharmacyReturn);
	public int stockAdd(PharmacyReturn pharmacyReturn);
	public Inventory getInventoryByInventoryId(PharmacyReturn pharmacyReturn);


	public int returnStockRequestNotPass(Integer inventory_id);

	// lossRequest 报损申请
	public int badDrugRequest(Reimburse reimburse);
	public int updateBadInventoryNum(Reimburse reimburse);//更新数量
	
	public int badDrugPass(Integer reimburse_id);

	public int badDrugNotPass(Integer reimburse_id);

	public List<Reimburse> getReimburses(Reimburse reimburse);
	
	public int delReimburseById(Reimburse reimburse);
	public int revokeRequest(Reimburse reimburse);
	
	public List<Overdue> getOverdues();// 药房 药品 过期检测
	// ===================jyf结束

	// JYF 12.24 getDrugByIdforChuku
	public Drug getDrugByIdforChuku(Integer drug_id);

	// getInventorysByDrugIdForSold
	public List<Drug> getInventorysByDrugIdForSold(Integer drug_id);

	public int UpdateSaleNum(Sold sold);

	public int soleAdd(Sold sold);

	public List<Map<String, Object>> checkBan(Banned banned);

	public ArrayList<Integer> getBirPrice(Integer drug_id);
}

package com.great.service;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.great.bean.Banned;
import com.great.bean.Drug;
import com.great.bean.ExcelBean;
import com.great.bean.InfoPage;
import com.great.bean.Inventory;
import com.great.bean.Overdue;
import com.great.bean.PharmacyReturn;
import com.great.bean.Reimburse;
import com.great.bean.SaleNum;
import com.great.bean.Sold;
import com.great.dao.InventoryMapper;
import com.great.until.ExcelUtils;

@Service
public class InventoryService {

	@Autowired
	private InventoryMapper inventoryMapper;

	public List<Drug> getInventoryss() {
		List<Drug> inventorys = inventoryMapper.getInventorys();
		return inventorys;

	};

	public List<Map<String, Object>> inventoryDrugs(Integer pageIndex, Integer NUMBER, String drug_name,
			Integer factory_id) {
		PageHelper.startPage(pageIndex, NUMBER);
		Map<String, Object> map = new HashMap<>();
		map.put("drug_name", drug_name);
		map.put("factory_id", factory_id);
		return inventoryMapper.inventoryDrugs(map);
	};

	public List<Drug> getInventorys(Integer pageIndex, Integer NUMBER) {
		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Drug> inventorys = inventoryMapper.getInventorys();
		return inventorys;

	};

	public List<Inventory> getInventorysByDrugId(Integer drug_id) {
		return inventoryMapper.getInventorysByDrugId(drug_id);
	};

	public List<Inventory> getInventoryssByDrugId(Integer drug_id) {
		return inventoryMapper.getInventoryssByDrugId(drug_id);
	};
//  药房退库  申请  
	@Transactional
	public int returnStockRequest(PharmacyReturn pharmacyReturn) {
		int res = inventoryMapper.pharmacyReturnAdd(pharmacyReturn);
		int res1 = inventoryMapper.updateInventoryNumReturnStock(pharmacyReturn);
		return 1;
	};

	// 得到 药房 退库 记录
	public List<PharmacyReturn> getPharmacyReturns(PharmacyReturn pharmacyReturn) {
		return inventoryMapper.getPharmacyReturns(pharmacyReturn);

	};
	//撤销申请
	@Transactional
	public int revokeRequestReturnBack(PharmacyReturn pharmacyReturn) {
		int res = inventoryMapper.delPharmacyReturnById(pharmacyReturn);
		int res1 = inventoryMapper.revokePharmacyReturn(pharmacyReturn);
		return 1;
	};

// 退库 审批同意
	@Transactional
	public int returnStockRequestPass(PharmacyReturn pharmacyReturn) {
		int res = inventoryMapper.returnStockRequestPass(pharmacyReturn);
		int res1 = inventoryMapper.stockAdd(pharmacyReturn);
		return 1;

	};
	public Inventory getInventoryByInventoryId(PharmacyReturn pharmacyReturn) {
		return inventoryMapper.getInventoryByInventoryId(pharmacyReturn);
	};
	//退库 审批驳回	
	@Transactional
	public int returnStockRequestNotPass(PharmacyReturn pharmacyReturn) {
		int res = inventoryMapper.returnStockRequestNotPass(pharmacyReturn);
		int res1 = inventoryMapper.revokePharmacyReturn(pharmacyReturn);
		return 1;
	};

	// 报损申请
	@Transactional
	public int badDrugRequest(Reimburse reimburse) {
		int res = inventoryMapper.badDrugRequest(reimburse);
		int res1 = inventoryMapper.updateBadInventoryNum(reimburse);
		return 1;

	};

	// 得到报损记录
	public List<Reimburse> getReimburses(Reimburse reimburse) {
		return inventoryMapper.getReimburses(reimburse);
	};

	// 撤销申请
	@Transactional
	public int revokeRequest(Reimburse reimburse) {
		int res = inventoryMapper.delReimburseById(reimburse);
		int res1 = inventoryMapper.revokeRequest(reimburse);
		return 1;
	}

	// 报损申请 通过
	public int badDrugPass(Integer reimburse_id) {
		return inventoryMapper.badDrugPass(reimburse_id);

	};

	// 报损申请 不通过
	public int badDrugNotPass(Integer inventory_id) {
		return inventoryMapper.badDrugNotPass(inventory_id);

	};

	public List<Overdue> getOverdues() {// 药房 药品 过期检测
		return inventoryMapper.getOverdues();
	};

	// JYF 12.24 getDrugByIdforChuku
	public Drug getDrugByIdforChuku(Integer drug_id) {
		return inventoryMapper.getDrugByIdforChuku(drug_id);
	};

	public List<Drug> getInventorysByDrugIdForSold(Integer drug_id) {
		return inventoryMapper.getInventorysByDrugIdForSold(drug_id);

	};

	@Transactional
	public int UpdateSaleNum(Sold sold) {
		inventoryMapper.UpdateSaleNum(sold);
		inventoryMapper.soleAdd(sold);
		return 1;
	};

	public List<Map<String, Object>> checkBan(Banned banned) {
		return inventoryMapper.checkBan(banned);
	};

	public ArrayList<Integer> getBirPrice(Integer drug_id) {
		return inventoryMapper.getBirPrice(drug_id);
	}
	
	//~~~~~~~~~~xsm:库存退货表导出Excel输出成Excel~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		public XSSFWorkbook getStocksByinventoryId() throws IllegalArgumentException, IllegalAccessException,
		InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException {
			List<Inventory> InventoryList = inventoryMapper.getStocksByinventoryId();
			List<ExcelBean> ems = new ArrayList<>();
			Map<Integer, List<ExcelBean>> map = new LinkedHashMap<>();
				XSSFWorkbook book = null;
				ems.add(new ExcelBean("药房库存id", "inventory_id", 0));
				ems.add(new ExcelBean("药品名字", "drug_name", 0));
				ems.add(new ExcelBean("生产日期", "production_date", 0));
				ems.add(new ExcelBean("数量", "inventory_number", 0));
				ems.add(new ExcelBean("状态", "parameter_name", 0));
				ems.add(new ExcelBean("创建日期", "cdate", 0));
				map.put(0, ems);
				book = ExcelUtils.createExcelFile(Inventory.class, InventoryList, map, "药房退库表");
				return book;
			}
}

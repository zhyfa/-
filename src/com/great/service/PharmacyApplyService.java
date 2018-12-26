package com.great.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.InventoryMapper;
import com.great.dao.PharmacyApplyMapper;
import com.great.dao.StockMapper;

@Service
public class PharmacyApplyService {
	@Resource
	private PharmacyApplyMapper pharmacyApplyMapper;
	@Resource
	private StockMapper stockMapper;
	@Resource
	private InventoryMapper inventoryMapper;

	// 通过ic值获取drug_id和drug_name
	public List<Map<String, Object>> queryAllDrugNameByIC(int ic) {
		// TODO Auto-generated method stub
		return pharmacyApplyMapper.queryAllDrugNameByIC(ic);
	}

	// 进入state=2的该IC编号的具体申请明细页面
	public List<Map<String, Object>> applyList3ByIc(int ic) {
		return pharmacyApplyMapper.applyList3ByIc(ic);
	};

	// 获取申请药品表中state=2的ic和cdate
	public List<Map<String, Object>> applyList3() {
		return pharmacyApplyMapper.applyList3();
	};

	// 药房人员确认数据一致，确认该领药流程结束
	/*
	 * 1、通过ic获取药品请领表中每一行的drug_id,birthday,factory_id,drug_number;
	 * 2、把数据填充进药房库存表
	 * 3、把获取的值通过drug_id,birthday,factory_id获取药库的stock_id和stock_number的列表集合stocks;
	 * 4、循环stocks，，获取每一个
	 */
	@Transactional()
	public int affirmApply(int ic, int admin_id) {
		List<Map<String, Object>> applyList = pharmacyApplyMapper.applyList2ByIc(ic);
		for (int i = 0; i < applyList.size(); i++) {
			Map<String, Object> map = applyList.get(i);
			//获取这一条数据要更改的drug_number
			int drug_number=Integer.parseInt(map.get("DRUG_NUMBER").toString());
			//根据drug_id,birthday,factory_id获取药库的stock_id和stock_number的列表集合stocks;
			String birthday=map.get("BIRTHDAY").toString(); 
			int drug_id=Integer.parseInt(map.get("DRUG_ID").toString());
			int factory_id=Integer.parseInt(map.get("FACTORY_ID").toString());
			Map<String, Object> temp=new HashMap<>();
			temp.put("birthday",birthday );
			temp.put("drug_id", drug_id);
			temp.put("factory_id",factory_id );
			List<Map<String, Object>> stocks=stockMapper.getIDs(temp);
			
			
			for (int j = 0; j < stocks.size(); j++) {
				Map<String, Object> stock = stocks.get(j);
				Map<String, Object> updateCondition = new HashMap<>();
				int stock_number=Integer.parseInt(stock.get("STOCK_NUMBER").toString());
				int stock_id=Integer.parseInt(stock.get("STOCK_ID").toString());
				updateCondition.put("stock_id",stock_id);
				updateCondition.put("drug_number",drug_number);
				//库存量>申请量
				if(stock_number>=drug_number) {
					stockMapper.updateByApply(updateCondition);
				}else {
					//删除一行，并且把drug_number减少stock_number的量
					drug_number-=stock_number;
					stockMapper.delRow(stock_id);
				}
			}
			
			
			map.put("newadmin_id", admin_id);
			inventoryMapper.addRow(map);//新增药房的库存（直接新增数据）
		}
		return pharmacyApplyMapper.affirmApply(ic);
	};

	// 进入state=2的该IC编号的具体申请明细页面
	public List<Map<String, Object>> applyList2ByIc(int ic) {
		return pharmacyApplyMapper.applyList2ByIc(ic);
	};

	// 获取申请药品表中state=2的ic和cdate
	public List<Map<String, Object>> applyList2() {
		return pharmacyApplyMapper.applyList2();
	};

	// 药库向添加一张药库申请药品表
	@Transactional()
	public int realAddPharmacyApply(ArrayList<Map> list, int ic) {
		delAllIc(ic);
		Map<String, Object> map = new HashMap<>();
		int result = 0;
		for (int i = 0; i < list.size(); i++) {
			map = list.get(i);
			result = pharmacyApplyMapper.realAddPharmacyApply(map);
		}
		return result;
	};

	// 通过ic值获取admin_id1(药房申请人员)的值
	public int getAdmin_id1(int ic) {
		return pharmacyApplyMapper.getAdmin_id1(ic);
	};

	// 通过ic值删除全部该IC的信息
	public int delAllIc(int ic) {
		return pharmacyApplyMapper.delAllIc(ic);
	};

	// 药房向添加一张药库申请药品表
	@Transactional()
	public int addPharmacyApply(ArrayList<Map> list) {
		Map<String, Object> map = new HashMap<>();
		int result = 0;
		for (int i = 0; i < list.size(); i++) {
			map = list.get(i);
			result = pharmacyApplyMapper.addPharmacyApply(map);
		}
		return result;
	};

	// 从系统表中获取字段IC的值
	public int creatIC() {
		return pharmacyApplyMapper.creatIC();
	}

	// 获取申请药品表中的ic和cdate
	public List<Map<String, Object>> applyList() {
		return pharmacyApplyMapper.applyList();
	}

	public List<Map<String, Object>> applyListByIc(int ic) {
		// TODO Auto-generated method stub
		return pharmacyApplyMapper.applyListByIc(ic);
	}

}

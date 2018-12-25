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

	// 进入state=2的该IC编号的具体申请明细页面
	public List<Map<String, Object>> applyList3ByIc(int ic) {
		return pharmacyApplyMapper.applyList3ByIc(ic);
	};

	// 获取申请药品表中state=2的ic和cdate
	public List<Map<String, Object>> applyList3() {
		return pharmacyApplyMapper.applyList3();
	};

	// 药房人员确认数据一致，确认该领药流程结束
	/*1、通过ic获取药品请领表中每一行的drug_id,birthday,factory_id,drug_number;
	 * 2、把获取的值通过drug_id,birthday,factory_id定位到药库药品表的某一行的值减少drug_number数量
	 * 3、把获取的值通过drug_id,birthday,factory_id定位到药房药品表的某一行的值增加drug_number数量(如果存在就是更改，不存在就是新增)
	 * 3.1先判断这是否存在该行字段
	 * */
	@Transactional()
	public int affirmApply(int ic,int admin_id) {
		List<Map<String, Object>> applyList = pharmacyApplyMapper.applyList2ByIc(ic);
		for (int i = 0; i < applyList.size(); i++) {
			Map<String, Object> map=applyList.get(i);
			stockMapper.updateByApply(map);//修改药库的库存
//			Map<String, Object> temp=inventoryMapper.checkRow(map);
//			if(temp==null) {//为空就新增
//				map.put("newadmin_id", admin_id);
//				inventoryMapper.addRow(map);
//			}else {//不为空就修改
//				inventoryMapper.updateByApply(map);
//			}
			map.put("newadmin_id", admin_id);
			inventoryMapper.addRow(map);
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

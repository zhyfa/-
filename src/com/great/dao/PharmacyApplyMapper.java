package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.Detaile1;
import com.great.bean.Detaile2;
import com.great.bean.Detaile3;

public interface PharmacyApplyMapper {
	
	// 通过ic值获取drug_id和drug_name
	public List<Map<String, Object>> queryAllDrugNameByIC(int ic);
	
	
	// 药房人员确认数据一致，确认该领药流程结束,state=3
	public int affirmApply(int ic);

	// 进入state=3的该IC编号的具体申请明细页面
	public List<Map<String, Object>> applyList3ByIc(int ic);

	// 进入state=2的该IC编号的具体申请明细页面
	public List<Map<String, Object>> applyList2ByIc(int ic);

	// 获取申请药品表中state=3的ic和cdate
	public List<Map<String, Object>> applyList3();

	// 获取申请药品表中state=2的ic和cdate
	public List<Map<String, Object>> applyList2();

	// 药库向药库申请药品表中添加数据
	public int realAddPharmacyApply(Map<String, Object> map);

	// 通过ic值获取admin_id1(药房申请人员)的值
	public int getAdmin_id1(int ic);

	// 通过ic值删除全部该IC的信息
	public int delAllIc(int ic);

	// 药房向药库申请药品表中添加数据
	public int addPharmacyApply(Map<String, Object> map);

	// 从系统表中获取字段IC的值
	public int creatIC();

	// 获取申请药品表中state=1的ic和cdate
	public List<Map<String, Object>> applyList();

	// 进入该IC编号的具体申请明细页面
	public List<Map<String, Object>> applyListByIc(int ic);
	//~~~~~~~~~~~~~~~~~~~~~~~打印专用~~~~~~~~~~~~~~~~~~~~~~~~~~~
		public List<Detaile1> queryDetaile1(int ic);
		public List<Detaile2> queryDetaile2(int ic);
		public List<Detaile3> queryDetaile3(int ic);

}

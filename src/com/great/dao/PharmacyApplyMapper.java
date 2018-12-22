package com.great.dao;

import java.util.List;
import java.util.Map;


public interface PharmacyApplyMapper {
	//向药库申请药品表中添加一条数据
	public int addPharmacyApply(Map<String, Object> map);
	//从系统表中获取字段IC的值
	public int creatIC();
	//获取申请药品表中state=1的ic和cdate
	public List<Map<String, Object>> applyList();
	// 进入该IC编号的具体申请明细页面
	public List<Map<String, Object>> applyListByIc(int ic);
}

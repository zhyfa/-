package com.great.dao;

import java.util.Map;

public interface PharmacyApplyMapper {
	//向药库申请药品表中添加一条数据
	public int addPharmacyApply(Map<String, Object> map);
	//从系统表中获取字段IC的值
	public int creatIC();
}

package com.great.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.PharmacyApplyMapper;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

@Service
public class PharmacyApplyService {
	@Resource
	private PharmacyApplyMapper pharmacyApplyMapper;
	//添加一张药库申请药品表
	@Transactional()
	public int addPharmacyApply(ArrayList<Map> list) {
		Map<String, Object> map=new HashMap<>();
		int result = 0;
		for (int i = 0; i < list.size(); i++) {
			map=list.get(i);
			result=pharmacyApplyMapper.addPharmacyApply(map);
		}
		return result;
	};
	
	//从系统表中获取字段IC的值
	public int creatIC() {
		return pharmacyApplyMapper.creatIC();
	};
	
}

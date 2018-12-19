package com.great.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.great.bean.Drug;
import com.great.dao.DrugMapper;

@Service
public class DrugService {

	@Autowired
	private DrugMapper drugMapper;

	// 获取药品表的全部信息
	public List<Map<String, Object>> queryAll(){
		return drugMapper.queryAll();
	}

	// 通过药品ID获取药品表的一条信息
	public Map<String, Object> queryById(int drug_id){
		return drugMapper.queryById(drug_id);
	}

	// 添加一个药品
	public int addDrug(Drug drug) {
		return drugMapper.addDrug(drug);
	}

	// 修改一个药品
	public int updateDrug(Drug drug) {
		return drugMapper.updateDrug(drug);
	}

	// 删除一个药品
	public int delDrug(int drug_id) {
		return drugMapper.delDrug(drug_id);
	}

	public List<Map<String, Object>> queryAllByCondition(Integer pageIndex,Integer NUMBER,String drug_name,Integer smalltype_id,String illustrate) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageIndex,NUMBER);
		Map<String, Object> map=new HashMap<>();
		map.put("drug_name", drug_name);
		map.put("smalltype_id", smalltype_id);
		map.put("illustrate", illustrate);
		return drugMapper.queryAllByCondition(map);
	}
	/**
	 * jyf
	 * @param 
	 * @return Drugs
	 */
	public List<Drug> getDrugs(Integer pageIndex,Integer NUMBER) {
		PageHelper.startPage(pageIndex, NUMBER);
		return drugMapper.getDrugs();
	}
	/**
	 * jyf
	 * @param drug_id
	 * @return Drug
	 */
	public Drug getDrugByDrudId(Integer drug_id) {
		return drugMapper.getDrugByDrudId(drug_id);
	};
	/**
	 * jyf
	 * 更改药库最低量库存
	 * @param drug
	 * @return int
	 */
	public int updateStockMin(Drug drug) {
		return drugMapper.updateStockMin(drug);
	}

}

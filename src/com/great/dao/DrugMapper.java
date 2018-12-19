package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Drug;

@Repository
public interface DrugMapper {
	// 获取药品表的全部信息
	public List<Map<String, Object>> queryAll();

	// 通过药品ID获取药品表的一条信息
	public Map<String, Object> queryById(int drug_id);

	// 添加一个药品
	public int addDrug(Drug drug);

	// 修改一个药品
	public int updateDrug(Drug drug);

	// 删除一个药品
	public int delDrug(int drug_id);

	//通过条件查询所有的药品信息
	public List<Map<String, Object>> queryAllByCondition(Map<String, Object> map);
	/**
	 * jyf
	 * @param drug_id
	 * @return Drugs
	 */
	public List<Drug> getDrugs();
	/**
	 * jyf
	 * @param drug_id
	 * @return Drug
	 */
	public Drug getDrugByDrudId(Integer drug_id);
	/**
	 * jyf
	 * 更改药库最低量库存
	 * @param drug
	 * @return int
	 */
	public int updateStockMin(Drug drug);
}

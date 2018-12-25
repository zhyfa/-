package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Drug;

@Repository
public interface DrugMapper {

	// 检查新增的药名是否可用
	public Integer checkDrugName(String drug_name);

	// 通过药品名字获取id
	public int getDrugId(String drug_name);

	// 获取药品表的全部信息
	public List<Map<String, Object>> queryAll();

	// 通过药品ID获取药品表的一条信息
	public Map<String, Object> queryById(int drug_id);

	// 通过药品名称获取药品表的一条信息
	public List<Map<String, Object>> queryByName(String drug_name);

	// 添加一个药品
	public int addDrug(Drug drug);

	// 修改一个药品
	public int updateDrug(Drug drug);

	// 删除一个药品
	public int delDrug(int drug_id);

	// 通过条件查询所有的药品信息
	public List<Map<String, Object>> queryAllByCondition(Map<String, Object> map);

	/**
	 * jyf
	 * 
	 * @param drug_id
	 * @return Drugs
	 */
	public List<Drug> getDrugs();

	/**
	 * jyf
	 * 
	 * @param drug_id
	 * @return Drug
	 */
	public Drug getDrugByDrudId(Integer drug_id);

	/**
	 * jyf 更改药库最低量库存
	 * 
	 * @param drug
	 * @return int
	 */
	public int updateStockMin(Drug drug);

	public int updateInventoryMin(Drug drug);

	// 查询所有药品
	public List<Map<String, Object>> getalldrug();

	// 二次查询
	public List<Map<String, Object>> querybannedDrug(int drugid);

	// 查询总数
	public int queryCountdrug(Map<String, Object> map);

	// 模糊查询
	public List<Map<String, Object>> querypagedrug(Map<String, Object> map);

	// 修改售价
	public int updateDrugprice(Drug drug);

	public int queryCount(Map<String, Object> map);

	public List<Map<String, Object>> querypagedrugbyid(Map<String, Object> map);

	// 禁用药品
	public int updateDrugstate(Drug drug);

}

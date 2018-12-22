package com.great.dao;

import java.util.List;
import java.util.Map;

public interface SpecialDrugMapper {
	//特殊药入库明细(查询请领表中状态为3而且psychotropics属性是“是”的药品信息)
	public List<Map<String, Object>> queryAll(Map<String, Object> map);
	//查询销售表中特殊药的销售明细
	public List<Map<String, Object>> queryAllSpecialSale(Map<String, Object> map);
	//特殊药库存明细
	public List<Map<String, Object>> queryAllSpecialHave(Map<String, Object> map);
}

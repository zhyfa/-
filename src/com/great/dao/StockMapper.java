package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Drug;
import com.great.bean.Inventory;
import com.great.bean.ReturnGood;
import com.great.bean.Stock;

@Repository
public interface StockMapper {
	//通过drug_id,birthday,factory_id定位到药库药品表拥有该三个字段的stock_id和stock_number的集合
	public List<Map<String, Object>> getIDs(Map<String, Object> map);
	//删除stock_number=0的这一行
	public int delRow(int stock_id);
	//通过stock_id定位到药库药品表的某一行的值减少drug_number数量
	//药房申请药品成功，药库相对应的药品库存发生该表
	public int updateByApply(Map<String, Object> map);
	
	// 通过drug_id，factory_id查询药库库存表中该药品的生产日期和库存总量
	public List<Map<String, Object>> getByDrugIdAndFactoryId(Map<String, Object> map);

	// 通过drug_id，factory_id,birthday查询药库库存表中该药品的库存总量
	public Map<String, Object> getDrugNum(Map<String, Object> map);

	// 查询药库的全部药品名称
	public List<Map<String, Object>> getAllDrugName();

	// 通过drug_id查询药库库存表中该ID的库存量
	public Integer drugNumById(int drug_id);

	// 通过drug_id查询药库库存表中该药品ID生产厂家
	public List<Map<String, Object>> getMegByDrugId(int drug_id);

	// 获取近半年的采购药品名字及数量
	public List<Map<String, Object>> getHalfYear();

	// 获取这一周的采购药品名字及数量
	public List<Map<String, Object>> getWeek();

	// 获取这一个月的采购药品名字及数量
	public List<Map<String, Object>> getMonth();

	// 获取时间段内的采购药品名字及数量
	public List<Map<String, Object>> getOrdersByTime(Map<String, Object> map);
	//增加药品库存数量
	public int addStockNum(Stock stock);
	/**
	 * jyf
	 * 
	 * @return
	 */
	public List<Drug> getStocks();

	/**
	 * jyf
	 * 
	 * @return
	 */
	public List<Stock> checkStockNum();

	/**
	 * jyf
	 * 
	 * @return
	 */
	public List<Inventory> checkInventoryNum();

	/**
	 * jyf
	 * 
	 * @return
	 */
	public List<Stock> getStocksByDrugId(Integer drug_id);

	/**
	 * jyf
	 * 
	 * @return
	 */
	public int returnGoodAdd(ReturnGood returnGood);

	/**
	 * jyf
	 * 
	 * @return
	 */
	public int deleteStateByStockId(ReturnGood returnGood);
	public List<ReturnGood> getReturns(ReturnGood returnGood);
	
	//撤回退货
	public int revokeReturnGood (ReturnGood returnGood);
	public int revokeReturnGood1 (ReturnGood returnGood);
	//admin 同意
	public int ReturnGoodPass (ReturnGood returnGood);
	//admin 驳回
	public int ReturnGoodNotPass (ReturnGood returnGood);
	
	//~~~~~~~~~~~~~~~~~~~~xsm：库存退货表导出Excel~~~~~~~~~~~~~~
		public List<Stock> getStocksBystockId(int stock_id);

		public List<ReturnGood> getStock();
}

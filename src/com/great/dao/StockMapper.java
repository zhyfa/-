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

	
	

	// 获取近半年的采购药品名字及数量
	public List<Map<String, Object>> getHalfYear();

	// 获取这一周的采购药品名字及数量
	public List<Map<String, Object>> getWeek();

	// 获取这一个月的采购药品名字及数量
	public List<Map<String, Object>> getMonth();

	// 获取时间段内的采购药品名字及数量
	public List<Map<String, Object>> getOrdersByTime(Map<String, Object> map);
	/**
	 * jyf
	 * @return
	 */
	public List<Drug> getStocks();
	/**
	 * jyf
	 * @return
	 */
	public List<Stock> checkStockNum();
	/**
	 * jyf
	 * @return
	 */
	public List<Inventory> checkInventoryNum();
	/**
	 * jyf
	 * @return
	 */
	public List<Stock> getStocksByDrugId(Integer drug_id);
	/**
	 * jyf
	 * @return
	 */
	public int returnGoodAdd(ReturnGood returnGood);
	/**
	 * jyf
	 * @return
	 */
	public int updateStateByStockId(Integer stock_id);
}

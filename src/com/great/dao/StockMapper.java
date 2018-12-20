package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Stock;

@Repository
public interface StockMapper {

	public List<Stock> getStocks();

	/**
	 * jyf
	 * 
	 * @return
	 */
	public List<Stock> checkStockNum();

	// 获取近半年的采购药品名字及数量
	public List<Map<String, Object>> getHalfYear();

	// 获取这一周的采购药品名字及数量
	public List<Map<String, Object>> getWeek();

	// 获取这一个月的采购药品名字及数量
	public List<Map<String, Object>> getMonth();

	// 获取时间段内的采购药品名字及数量
	public List<Map<String, Object>> getOrdersByTime(Map<String, Object> map);
}

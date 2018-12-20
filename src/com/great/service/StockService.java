package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.bean.Stock;
import com.great.dao.StockMapper;
@Service
public class StockService {
	@Autowired
	private StockMapper stockMapper;
	public List<Stock> getStocks() {
		return stockMapper.getStocks();
	};
	
	/**
	 * jyf
	 * @return
	 */
	public List<Stock> checkStockNum() {
		return stockMapper.checkStockNum();
	};
	
	// 获取近半年的采购药品名字及数量
		public List<Map<String, Object>> getHalfYear() {
			return stockMapper.getHalfYear();
		};

		// 获取这一周的采购药品名字及数量
		public List<Map<String, Object>> getWeek() {
			return stockMapper.getWeek();
		};

		// 获取这一个月的采购药品名字及数量
		public List<Map<String, Object>> getMonth() {
			return stockMapper.getMonth();
		};

		// 获取近半年的采购药品名字及数量
		public List<Map<String, Object>> getOrdersByTime(Map<String, Object> map) {
			return stockMapper.getOrdersByTime(map);
		};
}

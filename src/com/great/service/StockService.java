package com.great.service;

import java.util.List;

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
}

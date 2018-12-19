package com.great.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.great.bean.Stock;
@Repository
public interface StockMapper {

	public List<Stock> getStocks();
	/**
	 * jyf
	 * @return
	 */
	public List<Stock> checkStockNum();
}

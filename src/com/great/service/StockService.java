package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.great.bean.Drug;
import com.great.bean.Inventory;
import com.great.bean.ReturnGood;
import com.great.bean.Stock;
import com.great.dao.StockMapper;

@Service
public class StockService {
	@Autowired
	private StockMapper stockMapper;

	// 通过药库的全部药品名称
	public List<Map<String, Object>> getAllDrugName() {
		return stockMapper.getAllDrugName();
	};

	// 通过drug_id查询药库库存表中该ID的库存量
	public int drugNumById(int drug_id) {
		// TODO Auto-generated method stub
		return stockMapper.drugNumById(drug_id);
	};

	// 通过drug_id查询药库库存表中该药品ID的生产日期，厂家还有相对应的库存量
	public List<Map<String, Object>> getMegByDrugId(int drug_id) {
		// TODO Auto-generated method stub
		return stockMapper.getMegByDrugId(drug_id);
	}

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

	/**
	 * jyf
	 * 
	 * @return
	 */
	public List<Drug> getStocks(Integer pageIndex, Integer pageSize) {
		PageHelper.startPage(pageIndex, pageSize);
		List<Drug> stocks = stockMapper.getStocks();
		return stocks;
	};

	/**
	 * jyf
	 * 
	 * @return
	 */
	public List<Stock> checkStockNum() {
		return stockMapper.checkStockNum();
	};

	/**
	 * jyf
	 * 
	 * @return
	 */
	public List<Inventory> checkInventoryNum() {
		return stockMapper.checkInventoryNum();
	};

	/**
	 * jyf
	 * 
	 * @return
	 */
	public List<Stock> getStocksByDrugId(Integer drug_id) {

		return stockMapper.getStocksByDrugId(drug_id);
	};

	/**
	 * jyf
	 * 
	 * @return
	 */
	@Transactional
	public int returnGoodAdd(ReturnGood returnGood) {
		int res = stockMapper.updateStateByStockId(returnGood.getStock_id());
		int res1 = stockMapper.returnGoodAdd(returnGood);
		return 1;

	};
}

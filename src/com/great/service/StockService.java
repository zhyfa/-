package com.great.service;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.great.bean.Detaile3;
import com.great.bean.Drug;
import com.great.bean.ExcelBean;
import com.great.bean.Inventory;
import com.great.bean.ReturnGood;
import com.great.bean.Stock;
import com.great.dao.StockMapper;
import com.great.until.ExcelUtils;

@Service
public class StockService {
	@Autowired
	private StockMapper stockMapper;

	// 通过drug_id，factory_id,birthday查询药库库存表中该药品的库存总量
	public Map<String, Object> getDrugNum(Map<String, Object> map) {
		return stockMapper.getDrugNum(map);
	};

	// 通过drug_id，factory_id查询药库库存表中该药品的生产日期和库存总量
	public List<Map<String, Object>> getByDrugIdAndFactoryId(Map<String, Object> map) {
		return stockMapper.getByDrugIdAndFactoryId(map);
	};

	// 通过药库的全部药品名称
	public List<Map<String, Object>> getAllDrugName() {
		return stockMapper.getAllDrugName();
	};

	// 通过drug_id查询药库库存表中该ID的库存量
	public Integer drugNumById(Integer drug_id) {
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
		int res = stockMapper.deleteStateByStockId(returnGood);
		int res1 = stockMapper.returnGoodAdd(returnGood);
		return 1;

	};

	public List<ReturnGood> getReturns(ReturnGood returnGood) {
		return stockMapper.getReturns(returnGood);
	};

	// 撤回退药
	@Transactional
	public int revokeReturnGood(ReturnGood returnGood) {
		stockMapper.revokeReturnGood(returnGood);
		stockMapper.revokeReturnGood1(returnGood);
		return 1;
	};

	// admin 同意
	public int ReturnGoodPass(ReturnGood returnGood) {
		return stockMapper.ReturnGoodPass(returnGood);

	};

	// admin 驳回
	public int ReturnGoodNotPass(ReturnGood returnGood) {
		return stockMapper.ReturnGoodNotPass(returnGood);

	};

	public int addStockNum(Stock stock) {
		return stockMapper.addStockNum(stock);
	}

	// ~~~~~~~~~~xsm:库存退货表导出Excel输出成Excel~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	public XSSFWorkbook getStocksBystockId(int stock_id) throws IllegalArgumentException, IllegalAccessException,
			InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException {
		List<Stock> InventoryList = stockMapper.getStocksBystockId(stock_id);
		List<ExcelBean> ems = new ArrayList<>();
		Map<Integer, List<ExcelBean>> map = new LinkedHashMap<>();
		XSSFWorkbook book = null;
		ems.add(new ExcelBean("药品名称", "drug_name", 0));
		ems.add(new ExcelBean("数量", "stock_number", 0));
		ems.add(new ExcelBean("生产日期", "cdate", 0));
		ems.add(new ExcelBean("采购人", "admin_name", 0));
		ems.add(new ExcelBean("供应商", "factory_name", 0));
		ems.add(new ExcelBean("状态", "parameter_name", 0));
		map.put(0, ems);
		book = ExcelUtils.createExcelFile(Stock.class, InventoryList, map, "药库退还厂家明细表");
		return book;
	}

	public XSSFWorkbook getStock() throws IllegalArgumentException, IllegalAccessException, InvocationTargetException,
			ClassNotFoundException, IntrospectionException, ParseException {
		List<ReturnGood> InventoryList = stockMapper.getStock();
		List<ExcelBean> ems = new ArrayList<>();
		Map<Integer, List<ExcelBean>> map = new LinkedHashMap<>();
		XSSFWorkbook book = null;
		ems.add(new ExcelBean("库存ID", "stock_id", 0));
		ems.add(new ExcelBean("药品ID", "drug_id", 0));
		ems.add(new ExcelBean("药品名称", "drug_name", 0));
		ems.add(new ExcelBean("入库人员", "admin_name", 0));
		ems.add(new ExcelBean("生产日期", "birthday", 0));
		ems.add(new ExcelBean("入库日期", "cdate", 0));
		ems.add(new ExcelBean("退还日期", "return_date", 0));
		ems.add(new ExcelBean("退还数量", "stock_number", 0));
		ems.add(new ExcelBean("供应商", "factory_name", 0));
		map.put(0, ems);
		book = ExcelUtils.createExcelFile(ReturnGood.class, InventoryList, map, "药库退还厂家明细表");
		return book;
	}

}

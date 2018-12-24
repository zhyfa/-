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

import com.great.bean.ExcelBean;
import com.great.bean.Inventory;
import com.great.bean.LossReport;
import com.great.dao.LossReportMapper;
import com.great.until.ExcelUtils;

@Service
public class LossReportService {
	@Autowired
	private LossReportMapper lossReportMapper;

	public int queryCount() {
		// TODO Auto-generated method stub
		return lossReportMapper.queryCount();
	}

	public List<Map<String, Object>> queryListbypage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return lossReportMapper.queryListbypage(map);
	}
	
	public XSSFWorkbook queryallList() throws IllegalArgumentException, IllegalAccessException,
	InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException {
		List<LossReport> InventoryList = lossReportMapper.queryallList();
		System.out.println("InventoryList:"+InventoryList);
		List<ExcelBean> ems = new ArrayList<>();
		Map<Integer, List<ExcelBean>> map = new LinkedHashMap<>();
		XSSFWorkbook book = null;
		ems.add(new ExcelBean("报损序号", "REIMBURSE_ID", 0));
		ems.add(new ExcelBean("库存ID", "INVENTORY_ID", 0));
		ems.add(new ExcelBean("药品名称", "DRUG_NAME", 0));
		ems.add(new ExcelBean("操作人员姓名", "ADMIN_NAME", 0));
		ems.add(new ExcelBean("报损数量", "REIMBURSE_NUM", 0));
		ems.add(new ExcelBean("报损说明", "ILLUSTRATE", 0));
		ems.add(new ExcelBean("药品状态", "PARAMETER_NAME", 0));
		ems.add(new ExcelBean("日期", "CDATA", 0));
		map.put(0, ems);
		book = ExcelUtils.createExcelFile(LossReport.class, InventoryList, map, "破损统计表");
		return book;
}
	
	
	
}

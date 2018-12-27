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

import com.great.bean.AuditsDetail;
import com.great.bean.Detaile1;
import com.great.bean.ExcelBean;
import com.great.dao.AuditsDetailMapper;
import com.great.until.ExcelUtils;

@Service
public class AuditsDetailService {
	@Autowired 
	private AuditsDetailMapper detailDao;
	public int addDetail(Map<String,Object> orders) {
		return detailDao.addDetail(orders);
	}; 
	public int updateDetail(String auditsdetail_id){
		return detailDao.updateDetail(auditsdetail_id);
	}
	public List<Map<String,Object>> queryDetail(String auditsdetail_id){
		return detailDao.queryDetail(auditsdetail_id);
	}
	public String getTotalPrice(String auditsdetail_id) {
		return detailDao.getTotalPrice(auditsdetail_id);
	};
	public int getTotalDrug(String auditsdetail_id) {
		return detailDao.getTotalDrug(auditsdetail_id);
	};
	public int deleteDetail(String auditsdetail_id) {
		return detailDao.deleteDetail(auditsdetail_id);
	}
	public int passDetail(String auditsdetail_id) {
		return detailDao.passDetail(auditsdetail_id);
	}
	public int returnDetail(String auditsdetail_id) {
		return detailDao.returnDetail(auditsdetail_id);
	}
	public int updateStock(AuditsDetail auditsDetail) {
		return detailDao.updateStock(auditsDetail);
	}
	public Map<String,Object> queryByDrugId(int drug_id){
		return detailDao.queryByDrugId(drug_id);
	}
	public List<Map<String,Object>> getdetail(AuditsDetail auditsDetail){
		return detailDao.getdetail(auditsDetail);
	}
	public Map<String,Object> getdetailInfo(AuditsDetail auditsDetail){
		return detailDao.getdetailInfo(auditsDetail);
	}
	
	//~~~~~~~~~~~~~xsm：打印表格~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	public XSSFWorkbook queryaudits() throws IllegalArgumentException, IllegalAccessException,
	InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException {
		List<AuditsDetail> InventoryList = detailDao.queryaudits();
		List<ExcelBean> ems = new ArrayList<>();
		Map<Integer, List<ExcelBean>> map = new LinkedHashMap<>();
		XSSFWorkbook book = null;
		ems.add(new ExcelBean("明细ID", "auditsdetail_id", 0));
		ems.add(new ExcelBean("药品名称", "drug_name", 0));
		ems.add(new ExcelBean("是否为特殊药", "psycho", 0));
		ems.add(new ExcelBean("药品类型", "drug_type", 0));
		ems.add(new ExcelBean("包装类型", "spec", 0));
		ems.add(new ExcelBean("使用类型", "drug_unit", 0));
		ems.add(new ExcelBean("规格", "per_piece", 0));
		ems.add(new ExcelBean("单价", "price", 0));
		ems.add(new ExcelBean("是否为精神药品", "sicks", 0));
		ems.add(new ExcelBean("工厂", "factory", 0));
		ems.add(new ExcelBean("数量", "total", 0));
		ems.add(new ExcelBean("保质期", "irradiated", 0));
		ems.add(new ExcelBean("总价", "total_price", 0));
		ems.add(new ExcelBean("申请成员", "admin_name", 0));
		ems.add(new ExcelBean("申请日期", "cdate", 0));
		map.put(0, ems);
		book = ExcelUtils.createExcelFile(AuditsDetail.class, InventoryList, map, "采购明细表");
		return book;
	}
}

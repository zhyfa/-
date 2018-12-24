package com.great.service;

import java.beans.IntrospectionException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.great.bean.AuditsDetail;
import com.great.bean.Check;
import com.great.bean.ExcelBean;
import com.great.bean.Factory;
import com.great.bean.Inventory;
import com.great.bean.Medical;
import com.great.bean.Page;
import com.great.dao.ExcelMapper;
import com.great.until.ExcelUtils;

@Service
public class ExcelService {

	@Autowired
	private ExcelMapper excelMapper;

	public XSSFWorkbook queryFactory() throws IllegalArgumentException, IllegalAccessException,
			InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException {
		List<Factory> factoryList = excelMapper.queryFactory();
		List<ExcelBean> ems = new ArrayList<>();
		Map<Integer, List<ExcelBean>> map = new LinkedHashMap<>();
		XSSFWorkbook book = null;
		ems.add(new ExcelBean("供应商名称", "factory_name", 0));
		ems.add(new ExcelBean("供应商ID", "factory_id", 0));
		map.put(0, ems);
		book = ExcelUtils.createExcelFile(Factory.class, factoryList, map, "工厂信息");
		return book;
	}

	public void uploadPayerCreditInfoExcel(InputStream in, MultipartFile file) throws Exception {
		List<List<Object>> listob = ExcelUtils.getBankListByExcel(in, file.getOriginalFilename());
		List<AuditsDetail> creditInfoList = new ArrayList<AuditsDetail>();
		for (int i = 0; i < listob.size(); i++) {
			List<Object> ob = listob.get(i);
			AuditsDetail auditsDetail = new AuditsDetail();
			auditsDetail.setDrug_name(String.valueOf(ob.get(0)));
			auditsDetail.setTotal(Integer.valueOf((String)ob.get(1)));
			auditsDetail.setPer_piece(Integer.valueOf((String) ob.get(2)));
//	            BigDecimal bd=new BigDecimal(String.valueOf(ob.get(3)));   
			auditsDetail.setTotal_price(String.valueOf(ob.get(3)));
			auditsDetail.setFactory(String.valueOf(ob.get(4)));
			creditInfoList.add(auditsDetail);
		}
		for (int i = 0; i < creditInfoList.size(); i++) {
			excelMapper.addCgTail(creditInfoList.get(i));
		}
	}

	public XSSFWorkbook queryDaily() throws IllegalArgumentException, IllegalAccessException,
			InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException {
		List<Inventory> InventoryList = excelMapper.queryDaily();
		List<ExcelBean> ems = new ArrayList<>();
		Map<Integer, List<ExcelBean>> map = new LinkedHashMap<>();
		XSSFWorkbook book = null;
		ems.add(new ExcelBean("药品名称", "drug_name", 0));
		ems.add(new ExcelBean("系统数量", "inventory_number", 0));
		ems.add(new ExcelBean("生产批号", "production_date", 0));
		ems.add(new ExcelBean("实际数量", "shiji", 0));
		ems.add(new ExcelBean("差额", "beizhu", 0));
		map.put(0, ems);
		book = ExcelUtils.createExcelFile(Inventory.class, InventoryList, map, "药房 盘点表");
		return book;
	}
	
	public void checkexcel(InputStream in, MultipartFile file) throws Exception {
		List<List<Object>> listob = ExcelUtils.getBankListByExcel(in, file.getOriginalFilename());
		List<Check> checkList = new ArrayList<Check>();
		for (int i = 0; i < listob.size(); i++) {
			List<Object> ob = listob.get(i);
			Check check = new Check();
			check.setDrug_name(String.valueOf(ob.get(0)));
			check.setSystem_quantity(Integer.valueOf((String) ob.get(1)));
			check.setProduction_date(String.valueOf(ob.get(2)));
			check.setReal_quantity(Integer.valueOf((String) ob.get(3)));
			check.setDifference(Integer.valueOf((String) ob.get(4)));
			checkList.add(check);
		}
		for (int i = 0; i < checkList.size(); i++) {
			excelMapper.addCheck(checkList.get(i));
		}
	}
	
	public List<Check> checkDaily(Page page){
		return excelMapper.checkDaily(page);
	}
	
	public int queryCount() {
		return excelMapper.queryCount();
	}
	//事务操作
	@Transactional
	public void medicalexcel(InputStream in, MultipartFile file) throws Exception {
		List<List<Object>> listob = ExcelUtils.getBankListByExcel(in, file.getOriginalFilename());
		List<Medical> medicalList = new ArrayList<Medical>();
		for (int i = 0; i < listob.size(); i++) {
			List<Object> ob = listob.get(i);
			Medical medical = new Medical();
			medical.setMedical_city(String.valueOf(ob.get(0)));
			medical.setMedical_id(Integer.valueOf((String) ob.get(1)));
			medical.setDrug_name(String.valueOf(ob.get(2)));
			medicalList.add(medical);
		}
		    excelMapper.deleteMedical();
		for (int i = 0; i < medicalList.size(); i++) {
			excelMapper.medicalexcel(medicalList.get(i));
		}
	}
	
	public int queryCountOne() {
		return excelMapper.queryCountOne();
	}
	
	public List<Medical> medicalList(Page page){
		return excelMapper.medicalList(page);
	}
	
	public int updateMedical() {
		return excelMapper.updateMedical();
	}
}

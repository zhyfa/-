package com.great.service;

import java.beans.IntrospectionException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.great.bean.AuditsDetail;
import com.great.bean.ExcelBean;
import com.great.bean.Factory;
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
		List<List<Object>> listob = ExcelUtils.getBankListByExcel(in,file.getOriginalFilename());  
		List<AuditsDetail> creditInfoList=new ArrayList<AuditsDetail>();
		for (int i = 0; i < listob.size(); i++) {  
	            List<Object> ob = listob.get(i);  
	            AuditsDetail auditsDetail = new AuditsDetail();
	            auditsDetail.setDrug_name(String.valueOf(ob.get(0)));
	            auditsDetail.setTotal(String.valueOf(ob.get(1)));
	            auditsDetail.setPer_piece(Integer.valueOf((String)ob.get(2)));
//	            BigDecimal bd=new BigDecimal(String.valueOf(ob.get(3)));   
	            auditsDetail.setTotal_price(String.valueOf(ob.get(3)));
	            auditsDetail.setFactory(String.valueOf(ob.get(4)));
	            creditInfoList.add(auditsDetail);
	        }  
		for(int i=0;i<creditInfoList.size();i++) {
			excelMapper.addCgTail(creditInfoList.get(i));
        }
	}
}

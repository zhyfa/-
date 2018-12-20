package com.great.action;

import java.beans.IntrospectionException;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.great.service.ExcelService;
@Controller
@RequestMapping("/creditInfo")
public class ExcelAction {
	@Resource
	private ExcelService excelService;
	@RequestMapping(value = "/excel.action")
	public void queryFactory(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssms");
		String dateStr = sdf.format(new Date());
		int companyId = 1;
		Map<String, Object> map = new HashMap<String, Object>();
		// 指定下载的文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + dateStr + ".xlsx");
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		XSSFWorkbook workbook = null;
		
			// 导出Excel对象
			workbook = excelService.queryFactory();
		
		OutputStream output;
		try {
			output = response.getOutputStream();

			BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
			bufferedOutPut.flush();
			workbook.write(bufferedOutPut);
			bufferedOutPut.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value = "/upexcel.action")
	public void uploadPayerCreditInfoExcel(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {  
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
        MultipartFile file = multipartRequest.getFile("upfile");  
        if(file.isEmpty()){  
            throw new Exception("文件不存在！");  
        }  
        
        InputStream in = file.getInputStream();
        excelService.uploadPayerCreditInfoExcel(in,file);
        in.close();
        PrintWriter out = null;  
        response.setCharacterEncoding("utf-8");  //防止ajax接受到的中文信息乱码  
        out = response.getWriter();  
        out.print("文件导入成功！");  
        out.flush();  
        out.close();  
    }
}

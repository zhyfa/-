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
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.Check;
import com.great.bean.Page;
import com.great.service.ExcelService;
import com.great.service.InventoryService;
@Controller
@RequestMapping("/creditInfo")
public class ExcelAction {
	@Resource
	private ExcelService excelService;
	
	@Resource
	private InventoryService inventoryService;
	/**
	 * cc 导出工厂列表测试
	 */
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
	/**
	 * cc 上传采购申请表测试
	 */
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
	/**
	 * cc 导出药品盘点表
	 */
	@RequestMapping(value = "/dailyexcel.action")
	public void queryDaily(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssms");
		String dateStr = sdf.format(new Date());
		Map<String, Object> map = new HashMap<String, Object>();
		// 指定下载的文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + dateStr + ".xlsx");
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		XSSFWorkbook workbook = null;
		
			// 导出Excel对象
			workbook = excelService.queryDaily();
		
		OutputStream output;
		try {
			output = response.getOutputStream();
			BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
			bufferedOutPut.flush();
			workbook.write(bufferedOutPut);
			bufferedOutPut.close();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			toaddRoleJSP();
		}

	}
	
	public ModelAndView toaddRoleJSP() {
		ModelAndView andView = new ModelAndView();
		andView.setViewName("manage/role_add");
		return andView;
	}
	/**
	 * cc 导入药品盘点表
	 */
	@RequestMapping(value = "/checkexcel.action")
	public void checkexcel(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {  
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
        MultipartFile file = multipartRequest.getFile("upfile");  
        if(file.isEmpty()){  
            throw new Exception("文件不存在！");  
        }  
        
        InputStream in = file.getInputStream();
        excelService.checkexcel(in,file);
        in.close();
        PrintWriter out = null;  
        response.setCharacterEncoding("utf-8");  //防止ajax接受到的中文信息乱码  
        out = response.getWriter();  
        out.print("文件导入成功！");  
        out.flush();  
        out.close();  
    }
	/**
	 * cc 显示盘点明细列表
	 */
	@RequestMapping(value = "/checkDaily.action")
	public ModelAndView checkDaily(int dqPage,int pageTwo) {
		ModelAndView mav=new ModelAndView();
		Page page=new Page();
		page.setPageTwo(pageTwo);
		page.setPage(dqPage);
		page.setTotal(excelService.queryCount());
		page.csh();
		List<Check> checkList=excelService.checkDaily(page);
		page.setQueryCheck(checkList);
		mav.addObject("page", page);
		mav.setViewName("drugLibrary/checkList");
		return mav;
	}
	
}

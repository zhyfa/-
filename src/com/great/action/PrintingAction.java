package com.great.action;
import java.beans.IntrospectionException;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.great.service.AuditsDetailService;
import com.great.service.InventoryService;
import com.great.service.PharmacyApplyService;
import com.great.service.StockService;

@Controller
@RequestMapping("/Printing")
public class PrintingAction {
	@Resource
	private PharmacyApplyService pharmacyApplyService;
	@Resource
	private StockService stockService;
	@Resource
	private InventoryService inventoryService;
	@Resource
	private AuditsDetailService auditsDetailService;
//	~~~~~~~~~~~~~~~~~~~~~~~~申请明细~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// 进入该IC编号的具体申请明细页面state=3
	@RequestMapping("/detaile3.action")
	public void detaile3(int ic, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException,
			IntrospectionException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssms");
		String dateStr = sdf.format(new Date());
		// 指定下载的文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + dateStr + ".xlsx");
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		XSSFWorkbook workbook = null;
		// 导出Excel对象
		workbook = pharmacyApplyService.queryDetaile3(ic);
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

	// 进入该IC编号的具体申请明细页面
	@RequestMapping("/detaile2.action")
	public void detaile2(int ic, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException,
			IntrospectionException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssms");
		String dateStr = sdf.format(new Date());
		// 指定下载的文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + dateStr + ".xlsx");
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		XSSFWorkbook workbook = null;
		// 导出Excel对象
		workbook = pharmacyApplyService.queryDetaile2(ic);
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
	// 进入该IC编号的具体申请明细页面
	@RequestMapping("/detaile1.action")
	public void queryFactory(int ic, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException,
			IntrospectionException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssms");
		String dateStr = sdf.format(new Date());
		// 指定下载的文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + dateStr + ".xlsx");
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		XSSFWorkbook workbook = null;

		// 导出Excel对象
		workbook = pharmacyApplyService.queryDetaile1(ic);
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
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~申请结束~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	//~~~~~~~~~~~~~~~~~~~~··药库退货到厂家的退货表开始~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	@RequestMapping("/returnGoodForm.action")
	public void returnGoodForm(int stock_id, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException,
			IntrospectionException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssms");
		String dateStr = sdf.format(new Date());
		// 指定下载的文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + dateStr + ".xlsx");
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		XSSFWorkbook workbook = null;

		// 导出Excel对象
		workbook = stockService.getStocksBystockId(stock_id);
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
	

	@RequestMapping("/returnGoodForms.action")
	public void returnGoodForms( HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException,
			IntrospectionException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssms");
		String dateStr = sdf.format(new Date());
		// 指定下载的文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + dateStr + ".xlsx");
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		XSSFWorkbook workbook = null;

		// 导出Excel对象
		workbook = stockService.getStock();
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
	//~~~~~~~~~~~~~~~~~~~~~~~~~~药房到药库的退货表~~~~~~~~~~~~~~~~~~~~~~~~~~~
	@RequestMapping("/createReturnBackForm.action")
	public void createReturnBackForm( HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException,
			IntrospectionException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssms");
		String dateStr = sdf.format(new Date());
		// 指定下载的文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + dateStr + ".xlsx");
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		XSSFWorkbook workbook = null;

		// 导出Excel对象
		workbook = inventoryService.getStocksByinventoryId();
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
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~药品采购输出表~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~·
	@RequestMapping("/submitexcel.action")
	public void submitexcel( HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException,
			IntrospectionException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssms");
		String dateStr = sdf.format(new Date());
		// 指定下载的文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + dateStr + ".xlsx");
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		XSSFWorkbook workbook = null;

		// 导出Excel对象
		workbook = auditsDetailService.queryaudits();
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
}

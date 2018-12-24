package com.great.action;

import java.beans.IntrospectionException;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.Page;
import com.great.service.LossReportService;

@Controller
@RequestMapping("/roomReport")
public class RoomReportAction {
	private Page page;
	
	@Resource
	private LossReportService LossReportService;
	
	@RequestMapping(value = "/lossReport.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	 public ModelAndView toHomepage(HttpServletRequest request,Integer dqPage,Integer pageTwo ) {
		if(dqPage==null) {
			dqPage=1;
		}
		if(pageTwo==null) {
			pageTwo=1;
		}
		ModelAndView mav=new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		page=new Page();
		page.setPage(dqPage);
		page.setPageTwo(pageTwo);
		int i=LossReportService.queryCount();
		page.setTotal(i);
		page.csh();
		map.put("StartCount", page.getStartCount());
		map.put("endCount", page.getEndCount());
		List<Map<String,Object>> list=LossReportService.queryListbypage(map);
		page.setQueryList(list);
		System.err.println("List:"+list);
		mav.addObject("page",page);
		mav.setViewName("manage/LossReport");
		return mav;
	}
	
	@RequestMapping(value = "/toexls.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
		public void toexl(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException {
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
				workbook = LossReportService.queryallList();
			
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
				this.toHomepage(request, 1, 1);
			}


	}
	
	
}

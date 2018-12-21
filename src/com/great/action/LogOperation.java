package com.great.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.Page;
import com.great.service.LogService;
@Controller
@RequestMapping("/log")
public class LogOperation {
	@Autowired
	private LogService logService;
	private Page page;
	
	@RequestMapping("/logList.action")
	public ModelAndView getadlllog() {
		ModelAndView mav=new ModelAndView();
		page=new Page();
		page.setPageTwo(1);
		page.setPage(1);
		page.setTotal(logService.queryCountLog());
		page.csh();
		List<Map<String, Object>> list=logService.getallLog(page);
		page.setQueryList(list);
		mav.addObject("page",page);
		mav.setViewName("manage/LogList");
		return mav;
		
	}
}

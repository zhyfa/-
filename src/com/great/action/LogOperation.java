package com.great.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.Page;
import com.great.service.LogService;
@Controller
@RequestMapping("/log")
public class LogOperation {
	@Autowired
	private LogService logService;
	private Page page;
	//初始化
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
	//模糊搜索
	@RequestMapping(value = "/quryLogbysome.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody Page quryLogbysome(String adminname,int dqpage,int pageTwo,String startdata, String enddata, String operation) {
		Map<String, Object> map=new HashMap<>();
		map.put("adminname", adminname);
		map.put("startdata", startdata);
		map.put("enddata", enddata);
		map.put("operation", operation);
		page=new Page();
		page.setPageTwo(pageTwo);
		page.setPage(dqpage);
		page.setTotal(logService.queryCountbysome(map));
		page.csh();
		map.put("StartCount", page.getStartCount());
		map.put("endCount", page.getEndCount());
		List<Map<String, Object>> list=logService.queryLogbysome(map);
		page.setQueryList(list);
		return page;
	}
	
}

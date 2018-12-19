package com.great.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.MyLog;
import com.great.bean.Page;
import com.great.service.LogService;

@Controller
public class LogAction {
	@Autowired
	private LogService logService;
	private Page page;
	
	public int addLog(MyLog myLog) {
		int flag=0;
		flag=logService.addLog(myLog);
		return flag;
	}
	public ModelAndView getadlllog(int dqPage,int pageTwo) {
		ModelAndView mav=new ModelAndView();
		page=new Page();
		page.setPageTwo(pageTwo);
		page.setPage(dqPage);
		page.setTotal(logService.queryCountLog());
		page.csh();
		List<Map<String,Object>> map=logService.getallLog(page);
		return null;
		
	}
}

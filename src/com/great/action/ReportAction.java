package com.great.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.great.service.ReportService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/report")
public class ReportAction {
	@Autowired
	private ReportService reportService;
	@RequestMapping("outstock.action")
	public ModelAndView outstock() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_statistics");
		List<Map<String, Object>> inList=reportService.queryIn();
		List<Map<String, Object>> outList=reportService.queryOut();
		JSONArray json = JSONArray.fromObject(inList);   
		JSONArray json1 = JSONArray.fromObject(outList);
		mav.addObject("inList", json);
		mav.addObject("outList", json1);
		return mav;
		
	}
	
	@RequestMapping("instock.action")
	public ModelAndView instock() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_price");
		List<Map<String, Object>> priceList=reportService.queryPrice();
		JSONArray json1 = JSONArray.fromObject(priceList);
		mav.addObject("outList", json1);
		return mav;
		
	}
}

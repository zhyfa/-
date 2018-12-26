package com.great.action;

import java.util.HashMap;
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
	public ModelAndView outstock(String from,String to) {
		Map<String, Object> map=new HashMap<>();
		map.put("startDate", from);
		map.put("endDate", to);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_statistics");
		List<Map<String, Object>> inList=reportService.queryIn(map);
		List<Map<String, Object>> outList=reportService.queryOut(map);
		JSONArray json = JSONArray.fromObject(inList);   
		JSONArray json1 = JSONArray.fromObject(outList);
		mav.addObject("inList", json);
		mav.addObject("outList", json1);
		mav.addObject("startDate", from);
		mav.addObject("endDate", to);
		return mav;
		
	}
	
	@RequestMapping("instock.action")
	public ModelAndView instock(String from,String to) {
		Map<String, Object> map=new HashMap<>();
		map.put("startDate", from);
		map.put("endDate", to);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_price");
		List<Map<String, Object>> priceList=reportService.queryPrice(map);
		JSONArray json1 = JSONArray.fromObject(priceList);
		mav.addObject("outList", json1);
		mav.addObject("startDate", from);
		mav.addObject("endDate", to);
		return mav;
		
	}
	
	@RequestMapping("opurchase.action")
	public ModelAndView queryProfit(String from,String to) {
		Map<String, Object> map=new HashMap<>();
		map.put("startDate", from);
		map.put("endDate", to);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_profit");
		List<Map<String, Object>> priceList=reportService.queryPrice(map);
		JSONArray json1 = JSONArray.fromObject(priceList);
		List<Map<String, Object>> profitList=reportService.queryProfit(map);
		JSONArray json = JSONArray.fromObject(profitList);
		mav.addObject("profitList", json);
		mav.addObject("priceList", json1);
		mav.addObject("startDate", from);
		mav.addObject("endDate", to);
		return mav;
		
	}
}

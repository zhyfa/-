package com.great.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.service.SaleService;

@Controller
@RequestMapping("/sale")
public class SaleAction {
	@Resource
	private SaleService saleService;

	@RequestMapping(value = "/goPharmacyChartJSP.action")
	public ModelAndView goPharmacyChartJSP() {
		ModelAndView andView = new ModelAndView();
		andView.setViewName("pharmacy/pharmacy_sale_chart");
		return andView;
	}

	// 获取本周的每天的营业额
	@RequestMapping(value = "/getWeekMoney.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Map<String, Object>> getWeek() {
		List<Map<String, Object>> lists = saleService.getWeekMoney();
		return lists;
	}

	// 获取本月的每周的营业额
	@RequestMapping(value = "/getMonthMoney.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Map<String, Object>> getMonthMoney() {
		List<Map<String, Object>> lists = saleService.getMonthMoney();
		return lists;
	}
}

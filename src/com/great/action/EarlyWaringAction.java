package com.great.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.great.bean.Drug;
import com.great.bean.InfoPage;
import com.great.bean.Overdue;
import com.great.service.DrugService;
import com.great.service.InventoryService;

@Controller
@RequestMapping("/earlyWaring") 
public class EarlyWaringAction {
	@Autowired
	private DrugService drugService;
	@Autowired
	private InventoryService inventoryService;
	/**
	 * jyf药房设置药品最底限量  预警用的
	 */

	@RequestMapping("/min.action") 
	public ModelAndView min(Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		ModelAndView andView = new ModelAndView();
		List<Drug> drugs = drugService.getDrugs(pageIndex, InfoPage.NUMBER);
		InfoPage page = new InfoPage(drugs);
		andView.addObject("page", page);
		andView.addObject("drugs", drugs);
		andView.setViewName("pharmacy/pharmacy_minList");
		return andView;
	}
	@RequestMapping("/updatePharmacyMinBefore.action") //updatePharmacyMinBefore
	public ModelAndView updatePharmacyMinBefore(Integer drug_id) {
		Drug drug = drugService.getDrugByDrudId(drug_id);
		ModelAndView andView = new ModelAndView();
		andView.addObject("drug", drug);
		andView.setViewName("pharmacy/pharmacy_min_before");
		return andView;
	}
	@RequestMapping(value = "/updatePharmaryMin.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int updatePharmaryMin(Drug drug) {
		int res = drugService.updateInventoryMin(drug);
		if(res==1) {
			return 1;
		}else {
			return 2;
		}
	}
	/**
	 * 预警  过期
	 */
	@RequestMapping("/overdue.action") 
	public ModelAndView overdue(Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        Date date = new Date();//df.format(new Date());// new Date()为获取当前系统时间
        
       // PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Overdue> overdues = inventoryService.getOverdues();
		//InfoPage page = new InfoPage(overdues);
		for(Overdue overdue:overdues) {
			if(overdue.getNowDate().getTime()<=date.getTime()) {
				overdue.setMsg("过期了");
			}
		}
		ModelAndView andView = new ModelAndView();
		andView.setViewName("pharmacy/pharmacy_overdue");
		andView.addObject("overdues", overdues);
		//andView.addObject("page", page);
		return andView;
	}
}

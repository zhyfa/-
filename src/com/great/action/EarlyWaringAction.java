package com.great.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
import com.great.bean.Inventory;
import com.great.bean.Overdue;
import com.great.bean.Unsalable;
import com.great.service.DrugService;
import com.great.service.InventoryService;
import com.great.service.UnsalableService;

@Controller
@RequestMapping("/earlyWaring") 
public class EarlyWaringAction {
	@Autowired
	private DrugService drugService;
	@Autowired
	private InventoryService inventoryService;
	@Autowired
	private UnsalableService unsalableService;
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
	/**
	 * 滞销 
	 * @throws ParseException 
	 */
	//unsalable.action
	@RequestMapping("/unsalable.action") 
	public ModelAndView unsalable(Integer pageIndex) throws ParseException {
		if(pageIndex==null) {
			pageIndex=1;
		}
//		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Inventory> inventorys = unsalableService.getInventorys();
		
		Unsalable unsalable = unsalableService.getUnsalableRule();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置 日期格式
		Date now = new Date();//获取当前时间
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(now);
		rightNow.add(Calendar.DAY_OF_YEAR,-unsalable.getUnsalable_day());//日期-规则天数天
		Date now1=rightNow.getTime(); // 得到 当前时间  -  滞销时间    判断药品插入时间小于这个时间的卖出了多少规格药
	   
		List<Inventory> inventoryss = new ArrayList();
		for(int i =0;i<inventorys.size();i++) {
			Inventory inventory = inventorys.get(i);
			Integer drug_id = inventory.getDrug_id();
			String cdate = inventory.getCdate();
			Date parse = sdf.parse(cdate);//获取所有 的 记录的 插入时间
			if(parse.before(now1)) {
				Integer soldNum = unsalableService.getSoldNum(inventory.getDrug_id());
				if(soldNum<unsalable.getUnsalable_number()) {
					inventory.setMsg("滞销了");
				}
				inventoryss.add(inventory);
			}
		}
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventoryss);
		andView.setViewName("pharmacy/pharmacy_unsalable");
		return andView;
	}
}

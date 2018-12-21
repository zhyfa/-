package com.great.action;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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
import com.great.bean.Parameter;
import com.great.service.InventoryService;

@Controller
@RequestMapping("/daily")
public class DailyAction {
	@Autowired
	private InventoryService inventoryService;
	/**
	 * jyf 药房退库
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("/returnBack.action")
	public ModelAndView returnBack(Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Drug> inventorys = inventoryService.getInventorys();
		InfoPage page = new InfoPage(inventorys); 
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
		andView.addObject("page", page);
		andView.setViewName("pharmacy/inventory_returnBack");
		return andView;
	}
	
	//getInventorys
	/**
	 * jyf 药房退库
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("/getInventorys.action")
	public ModelAndView getInventorys(@Param(value = "drug_id") Integer drug_id) {
		
		List<Inventory> inventorys = inventoryService .getInventorysByDrugId(drug_id);
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
		andView.setViewName("pharmacy/inventory_returnToStock");
		return andView;
	}
	/**
	 * @RequestMapping(value = "/returnBackToStock.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	 *	public @ResponseBody String parameterAdd(Parameter parameter) {
	 * returnBackToStock.action
	 */
	@RequestMapping(value = "/returnBackToStockRequest.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody int returnBackToStock(Integer inventory_id) {
		int res = inventoryService.returnStockRequest(inventory_id);
		return res;
	}
	
	//药库端  审核  returnStockReview.action
	@RequestMapping("/returnStockReviewList.action")
	public ModelAndView returnStockReview(Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Inventory> inventorys = inventoryService.getInventorysforStock();
		InfoPage page = new InfoPage(inventorys); 
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
		andView.addObject("page", page);
		andView.setViewName("drugLibrary/stock_returnStockReviewList");
		return andView;
	}
	@RequestMapping(value = "/returnBackToStockPass.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody int returnBackToStockPass(Integer inventory_id) {
		int res = inventoryService.returnStockRequestPass(inventory_id);
		if(res==1) {
			return 1;
		}else {
			return 2;
		}
	}
	@RequestMapping(value = "/returnBackToStockNotPass.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody int returnBackToStockNotPass(Integer inventory_id) {
		int res = inventoryService.returnStockRequestNotPass(inventory_id);
		if(res==1) {
			return 1;
		}else {
			return 2;
		}
	}
}

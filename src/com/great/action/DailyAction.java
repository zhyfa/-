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
		//PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Drug> inventorys = inventoryService.getInventorys(pageIndex,InfoPage.NUMBER);
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
	public @ResponseBody int returnBackToStockPass(Inventory inventory) {
		int res = inventoryService.returnStockRequestPass(inventory);
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
	//药房药品报损开始=====================================================================
	@RequestMapping("/badDrug.action")
	public ModelAndView badDrug(Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		//PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Drug> inventorys = inventoryService.getInventorys(pageIndex,InfoPage.NUMBER);
		InfoPage page = new InfoPage(inventorys);
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
		andView.addObject("page", page);
		andView.setViewName("pharmacy/pharmacy_badDrug");
		return andView;
	}
	//badDrugRequestBefore
	@RequestMapping("/badDrugRequestBefore.action")
	public ModelAndView badDrugRequestBefore(Integer drug_id) {
		List<Inventory> inventorys = inventoryService.getInventoryssByDrugId(drug_id);
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
		andView.setViewName("pharmacy/pharmacy_badDrugRequestBefore");
		return andView;
	}
	
	
	@RequestMapping(value = "/badDrugRequest.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public int badDrugRequest(Integer inventory_id) {
		int res = inventoryService.badDrugRequest(inventory_id);
		if(res==1) {
			return 1;
		}else {
			return 2;
		}
	}
	//badDrugCheck  admin           报损审批
	@RequestMapping("/badDrugCheck.action")
	public ModelAndView badDrugCheck(Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Inventory> inventorys = inventoryService.getInventorysForAdmin();
		InfoPage page = new InfoPage(inventorys);
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
		andView.addObject("page", page);
		andView.setViewName("manage/admin_badDrugCheck");
		return andView;
	}
	//badDrugPass.action  badDrugNotPass.action
	@RequestMapping(value = "/badDrugPass.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public int badDrugPass(Inventory inventory) {
		int res = inventoryService.badDrugPass(inventory);
		if(res==1) {
			return 1;
		}else {
			return 2;
		}
	}
	@RequestMapping(value = "/badDrugNotPass.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public int badDrugNotPass(Integer inventory_id) {
		int res = inventoryService.badDrugNotPass(inventory_id);
		if(res==1) {
			return 1;
		}else {
			return 2;
		}
	}
	//=====================药品报损   流程  结束
	/**
	 * cc 药品盘点
	 * 
	 */
	@RequestMapping(value = "/check.action")
	public ModelAndView checkDaily() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("drugLibrary/checkDaily");
		return mav;
	}
	
}

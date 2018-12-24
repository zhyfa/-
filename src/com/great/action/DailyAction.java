package com.great.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.great.bean.Page;
import com.great.bean.SaleNum;
import com.great.service.DrugService;
import com.great.service.InventoryService;

@Controller
@RequestMapping("/daily")
public class DailyAction {
	public ArrayList<SaleNum> orders = new ArrayList<>();
	@Autowired
	private InventoryService inventoryService;
	@Autowired
	private DrugService drugService;

	/**
	 * jyf 药房退库
	 * 
	 * @param pageIndex
	 * @return
	 */
	
	@RequestMapping("/returnBack.action")
	public ModelAndView returnBack(Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		// PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Drug> inventorys = inventoryService.getInventorys(pageIndex, InfoPage.NUMBER);
		InfoPage page = new InfoPage(inventorys);
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
		andView.addObject("page", page);
		andView.setViewName("pharmacy/inventory_returnBack");
		return andView;
	}

	// getInventorys
	/**
	 * jyf 药房退库
	 * 
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("/getInventorys.action")
	public ModelAndView getInventorys(@Param(value = "drug_id") Integer drug_id) {

		List<Inventory> inventorys = inventoryService.getInventorysByDrugId(drug_id);
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
		andView.setViewName("pharmacy/inventory_returnToStock");
		return andView;
	}

	/**
	 * @RequestMapping(value =
	 *                       "/returnBackToStock.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	 *                       public @ResponseBody String parameterAdd(Parameter
	 *                       parameter) { returnBackToStock.action
	 */
	@RequestMapping(value = "/returnBackToStockRequest.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int returnBackToStock(Integer inventory_id) {
		int res = inventoryService.returnStockRequest(inventory_id);
		return res;
	}

	// 药库端 审核 returnStockReview.action
	@RequestMapping("/returnStockReviewList.action")
	public ModelAndView returnStockReview(Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
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

	@RequestMapping(value = "/returnBackToStockPass.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int returnBackToStockPass(Inventory inventory) {
		int res = inventoryService.returnStockRequestPass(inventory);
		if (res == 1) {
			return 1;
		} else {
			return 2;
		}
	}

	@RequestMapping(value = "/returnBackToStockNotPass.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int returnBackToStockNotPass(Integer inventory_id) {
		int res = inventoryService.returnStockRequestNotPass(inventory_id);
		if (res == 1) {
			return 1;
		} else {
			return 2;
		}
	}

	// 药房药品报损开始=====================================================================
	@RequestMapping("/badDrug.action")
	public ModelAndView badDrug(Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		// PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Drug> inventorys = inventoryService.getInventorys(pageIndex, InfoPage.NUMBER);
		InfoPage page = new InfoPage(inventorys);
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
		andView.addObject("page", page);
		andView.setViewName("pharmacy/pharmacy_badDrug");
		return andView;
	}

	// badDrugRequestBefore
	@RequestMapping("/badDrugRequestBefore.action")
	public ModelAndView badDrugRequestBefore(Integer drug_id) {
		List<Inventory> inventorys = inventoryService.getInventoryssByDrugId(drug_id);
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
		andView.setViewName("pharmacy/pharmacy_badDrugRequestBefore");
		return andView;
	}

	@RequestMapping(value = "/badDrugRequest.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public int badDrugRequest(Integer inventory_id) {
		int res = inventoryService.badDrugRequest(inventory_id);
		if (res == 1) {
			return 1;
		} else {
			return 2;
		}
	}

	// badDrugCheck admin 报损审批
	@RequestMapping("/badDrugCheck.action")
	public ModelAndView badDrugCheck(Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
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

	// badDrugPass.action badDrugNotPass.action
	@RequestMapping(value = "/badDrugPass.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public int badDrugPass(Inventory inventory) {
		int res = inventoryService.badDrugPass(inventory);
		if (res == 1) {
			return 1;
		} else {
			return 2;
		}
	}

	@RequestMapping(value = "/badDrugNotPass.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public int badDrugNotPass(Integer inventory_id) {
		int res = inventoryService.badDrugNotPass(inventory_id);
		if (res == 1) {
			return 1;
		} else {
			return 2;
		}
	}

	// =====================药品报损 流程 结束
	/**
	 * cc 药品盘点
	 * 
	 */
	@RequestMapping(value = "/check.action")
	public ModelAndView checkDaily() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("drugLibrary/checkDaily");
		return mav;
	}

	// ~~~~~~~~~~~~~~~~~~xusm~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// ~~~~~~~~药品调价~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// 药品调价
	@RequestMapping("/readjust.action")
	public ModelAndView updapricebefore() {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> List = drugService.getalldrug();
		andView.addObject("drugs", List);
		andView.setViewName("drugLibrary/drug_updaprice");
		return andView;
	}

	// 查找该药品的信息
	@RequestMapping(value = "/qurydrugbyid.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody Map qurydrugbyid(Integer drugid) {
		Map<String, Object> List = drugService.queryById(drugid);
		return List;
	}

	// 修改售价
	@RequestMapping(value = "/updateDrugprice.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String updateDrugprice(Drug drug) {
		int i = drugService.updateDrugprice(drug);
		if (i > 0) {
			return "1";
		} else {
			return "0";
		}
	}

	// ~~~~~~~~~~~~~~~~调价结束~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// ~~~~~~~~~~~~~~~状态改变~~~~~~~~~~~~~~~~~~~~~~
	@RequestMapping("/blockUp.action")
	public ModelAndView updastatebefore() {
		ModelAndView andView = new ModelAndView();
		Page page = new Page();
		Map<String, Object> map = new HashMap<>();
		map.put("drugId", 0);
		page = new Page();
		page.setPageTwo(1);
		page.setPage(1);
		page.setTotal(drugService.queryCount(map));
		page.csh();
		map.put("StartCount", page.getStartCount());
		map.put("endCount", page.getEndCount());
		List<Map<String, Object>> list = drugService.querypagedrugbyid(map);
		page.setQueryList(list);
		andView.addObject("page", page);
		andView.setViewName("drugLibrary/drug_updastate");
		return andView;
	}

	// 禁用的模糊查询
	@RequestMapping(value = "/qurypagedrugbyid.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody Page qurypagedrugbyid(Integer drugid, int dqpage, int pageTwo) {
		Page page = new Page();
		Map<String, Object> map = new HashMap<>();
		map.put("drugId", drugid);
		page = new Page();
		page.setPageTwo(pageTwo);
		page.setPage(dqpage);
		page.setTotal(drugService.queryCount(map));
		page.csh();
		map.put("StartCount", page.getStartCount());
		map.put("endCount", page.getEndCount());
		List<Map<String, Object>> list = drugService.querypagedrugbyid(map);
		page.setQueryList(list);
		return page;
	}

	// 禁用的执行。。。
	@RequestMapping(value = "/updateDrugstate.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String updateDrugstate(Drug drug) {
		int i = drugService.updateDrugstate(drug);
		if (i > 0) {
			return "1";
		} else {
			return "0";
		}
	}

	// ==============================jyf 药房 发药 daily/dispensing.action
	@RequestMapping("/dispensing.action")
	public ModelAndView dispensing() {
		List<Drug> inventoryss = inventoryService.getInventoryss();
		ModelAndView andView = new ModelAndView();
		andView.setViewName("pharmacy/pharmacy_dispensing");
		andView.addObject("inventoryss", inventoryss);
		return andView;
	}

	// getDrug
	@RequestMapping(value = "/getInventoryByIdForSold.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Inventory> getDrug(Integer drug_id) {
		List<Inventory> inventorys = inventoryService.getInventorysByDrugIdForSold(drug_id);
		return inventorys;
	}

	// soldDrug
	@RequestMapping(value = "/soldDrug.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody Integer soldDrug(Integer inventory_id, Integer saleNum) {
		SaleNum saleNums = new SaleNum();
		saleNums.setInventory_id(inventory_id);
		saleNums.setSaleNum(saleNum);
		orders.add(saleNums);
		return saleNum;
	}

	@RequestMapping(value = "/soldOrder.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody Integer soldOrder() {
		for (int i = 0; i < orders.size(); i++) {
			SaleNum saleNum = orders.get(i);
			inventoryService.UpdateSaleNum(saleNum);
		}
		return 1;
	}
}

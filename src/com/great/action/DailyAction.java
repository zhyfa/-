package com.great.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.great.bean.Admin;
import com.great.bean.Banned;
import com.great.bean.Drug;
import com.great.bean.InfoPage;
import com.great.bean.Inventory;
import com.great.bean.Page;
import com.great.bean.PharmacyReturn;
import com.great.bean.Reimburse;
import com.great.bean.SaleNum;
import com.great.bean.Sold;
import com.great.service.DrugService;
import com.great.service.InventoryService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/daily")
public class DailyAction {
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
//		if(pageIndex==null) {
//			pageIndex=1;
//		}
//		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Inventory> inventorys = inventoryService.getInventorysByDrugId(drug_id);
//		InfoPage page = new InfoPage(inventorys);
		ModelAndView andView = new ModelAndView();
		andView.addObject("inventorys", inventorys);
//		andView.addObject("page", page);
//		andView.addObject("drug_id1", drug_id);
		andView.setViewName("pharmacy/inventory_returnToStock");
		return andView;
	}

	/**
	 * jyf 退库申请
	 */
	@RequestMapping(value = "/returnBackToStockRequest.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int returnBackToStock(HttpServletRequest request ,PharmacyReturn pharmacyReturn) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		pharmacyReturn.setAdmin_id(admin.getAdmin_id());
		int res = inventoryService.returnStockRequest(pharmacyReturn);
		return 1;
	}
	//returnBackList
	@RequestMapping("/returnBackList.action")
	public ModelAndView returnBackList(Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<PharmacyReturn> pharmacyReturns = inventoryService.getPharmacyReturns(null);
		InfoPage page = new InfoPage(pharmacyReturns);
		ModelAndView andView = new ModelAndView();
		andView.addObject("pharmacyReturns", pharmacyReturns);
		andView.addObject("page", page);
		andView.setViewName("pharmacy/inventory_pharmacyReturnList");
		return andView;
	}
	//revokeRequestReturnBack  //撤销  申请  退库
	@RequestMapping(value = "/revokeRequestReturnBack.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int revokeRequestReturnBack(PharmacyReturn pharmacyReturn) {
		int res = inventoryService.revokeRequestReturnBack(pharmacyReturn);
		return 1;
	}
	// 药库端 审核 returnStockReview.action
	@RequestMapping("/returnStockReviewList.action")
	public ModelAndView returnStockReview(Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<PharmacyReturn> pharmacyReturns = inventoryService.getPharmacyReturns(null);
		InfoPage page = new InfoPage(pharmacyReturns);
		ModelAndView andView = new ModelAndView();
		andView.addObject("pharmacyReturns", pharmacyReturns);
		andView.addObject("page", page);
		andView.setViewName("drugLibrary/stock_returnStockReviewList");
		return andView;
	}

	@RequestMapping(value = "/returnBackToStockPass.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int returnBackToStockPass(PharmacyReturn pharmacyReturn) {
		Inventory inventory = inventoryService.getInventoryByInventoryId(pharmacyReturn);
		pharmacyReturn.setDrug_id(inventory.getDrug_id());
		int res = inventoryService.returnStockRequestPass(pharmacyReturn);
		if (res==1) {
			return 1;
		} else {
			return 2;
		}
	}

	@RequestMapping(value = "/returnBackToStockNotPass.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int returnBackToStockNotPass(PharmacyReturn pharmacyReturn) {
		int res = inventoryService.returnStockRequestNotPass(pharmacyReturn);
		if (true) {
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
	public int badDrugRequest(HttpServletRequest request , Reimburse reimburse) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		reimburse.setAdmin_id(admin.getAdmin_id());
		int res = inventoryService.badDrugRequest(reimburse);
		return res;
	}
	//badDrugList  报损详情
	@RequestMapping("/badDrugList.action")
	public ModelAndView badDrugList(Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Reimburse> reimburses = inventoryService.getReimburses(null);
		InfoPage page = new InfoPage(reimburses);
		ModelAndView andView = new ModelAndView();
		andView.addObject("reimburses", reimburses);
		andView.addObject("page", page);
		andView.setViewName("pharmacy/pharmacy_reimburse");
		return andView;
	}
	
	//revokeRequest 撤销报损
	@RequestMapping(value = "/revokeRequest.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public int revokeRequest( Reimburse reimburse) {
		int res = inventoryService.revokeRequest(reimburse);
		return res;
	}
	// badDrugCheck admin 报损审批
	@RequestMapping("/badDrugCheck.action")
	public ModelAndView badDrugCheck(Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
//		List<Inventory> inventorys = inventoryService.getInventorysForAdmin();
		List<Reimburse> reimburses = inventoryService.getReimburses(null);
		InfoPage page = new InfoPage(reimburses);
		ModelAndView andView = new ModelAndView();
		andView.addObject("reimburses", reimburses);
		andView.addObject("page", page);
		andView.setViewName("manage/admin_badDrugCheck");
		return andView;
	}

	// badDrugPass.action badDrugNotPass.action     dmin 报损审批   同意
	@RequestMapping(value = "/badDrugPass.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public int badDrugPass(Integer reimburse_id) {
		int res = inventoryService.badDrugPass(reimburse_id);
		if (res == 1) {
			return 1;
		} else {
			return 2;
		}
	}
//dmin 报损审批   不同意
	@RequestMapping(value = "/badDrugNotPass.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public int badDrugNotPass(Integer reimburse_id) {
		int res = inventoryService.badDrugNotPass(reimburse_id);
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

	// getInventoryByIdForSold
	@RequestMapping(value = "/getInventoryByIdForSold.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Drug> getDrug(Integer drug_id) {
		List<Drug> inventorys = inventoryService.getInventorysByDrugIdForSold(drug_id);
		return inventorys;
	}
	// 效验 禁忌 药
	@RequestMapping(value = "/checkBanned.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int checkBanned(@RequestParam String  data) {
		JSONArray ja = JSONArray.fromObject(data); 
		List<Map<String,String>> list=new ArrayList();
		for(Object jstr:ja){
	        list.add((Map<String, String>) jstr);
	    }
		for(int i=0;i<list.size();i++) {
			Integer drug_id =Integer.valueOf(list.get(i).get("drug_id"));
			for(int j=0;j<list.size();j++) {
				Integer drug_id1 =Integer.valueOf(list.get(j).get("drug_id"));
				Banned banned = new Banned();
				banned.setPharmacy_id(drug_id);
				banned.setPharmacy_id1(drug_id1);
				List<Map<String, Object>> checkBan = inventoryService.checkBan(banned);
				if(checkBan.size()>0) {
					return 2; //禁忌药
				}
			}
		}
		return 1;
	}


	@RequestMapping(value = "/soldOrder.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody Integer soldOrder(HttpServletRequest request,  @RequestParam String data) {
		Admin admin = (Admin)request.getSession().getAttribute("admin");
		
		JSONArray ja = JSONArray.fromObject(data); 
		List<Map<String,String>> list=new ArrayList();
		for(Object jstr:ja){
	        list.add((Map<String, String>) jstr);
	    }
		int j = 0;
		Sold sold = new Sold();
		for(int i=0;i<list.size();i++) {
			Integer inventory_id = Integer.valueOf(list.get(i).get("inventory_id"));
			Integer saleNum = Integer.valueOf(list.get(i).get("saleNum"));
			Integer drug_id = Integer.valueOf(list.get(i).get("drug_id"));
			Drug drug = drugService.getDrugByDrudId(drug_id);
			ArrayList<Integer> birPrices = inventoryService.getBirPrice(drug_id);
			
			sold.setBir_price(birPrices.get(0));
			sold.setSold_num(saleNum);
			sold.setInventory_id(inventory_id);
			sold.setDrug_id(drug_id);
			sold.setAdmin_id(admin.getAdmin_id());
			sold.setPrice(drug.getPrice()*drug.getDiscount()/100);
			sold.setPerson("购药人");
			sold.setPurpose(drug.getPsychotropics());
			j+=inventoryService.UpdateSaleNum(sold);
		}
		if(j<list.size()) {
			 return 2;
		}
		return 1;
	}
}

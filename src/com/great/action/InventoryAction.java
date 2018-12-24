package com.great.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.InfoPage;
import com.great.service.FactoryService;
import com.great.service.InventoryService;

@Controller
@RequestMapping("/inventory")
public class InventoryAction {
	@Resource
	private InventoryService inventoryService;//药房服务层
	@Resource
	private FactoryService factoryService;
	//进入药房药品列表页
	@RequestMapping(value = "/toInventoryJSP.action")
	public ModelAndView toInventoryJSP(Integer pageIndex, String drug_name,Integer factory_id) {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> factorys=factoryService.factoris();
		
		
		if (pageIndex == null) {
			pageIndex = 1;
		}
		
		System.out.println("drug_name="+drug_name);
		System.out.println("factroy_id="+factory_id);
		
		
		List<Map<String, Object>> drugs =inventoryService.inventoryDrugs(pageIndex, InfoPage.NUMBER,drug_name,factory_id);
		InfoPage page = new InfoPage(drugs);
		andView.addObject("page", page);
		
		andView.addObject("drug_name", drug_name);
		andView.addObject("factory_id", factory_id);
		
		andView.addObject("drugs", drugs);
		andView.addObject("factorys", factorys);
		andView.setViewName("pharmacy/inventory_drug");
		return andView;
	}
}

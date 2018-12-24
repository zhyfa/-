package com.great.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.InfoPage;
import com.great.service.SpecialDrugService;

@Controller
@RequestMapping("/specialDrugs")
public class SpecialDrugAction {
	@Resource
	private SpecialDrugService specialDrugService;
	// 特殊药品入库记录
	@RequestMapping("/warehousing.action")
	public ModelAndView toSpecialDrugJSP(Integer pageIndex, String drug_name, String start, String end) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> specialDruges = specialDrugService.queryAllByCondition(pageIndex, InfoPage.NUMBER,
				drug_name, start, end); 
		// 回填
		andView.addObject("start", start);
		andView.addObject("end", end);
		andView.addObject("drug_name", drug_name);

		System.out.println("start="+start);
		System.out.println("end="+end);
		
		
		InfoPage page = new InfoPage(specialDruges);
		andView.addObject("page", page);

		andView.addObject("specialDruges", specialDruges);
		andView.setViewName("pharmacy/special_drug_add");
		return andView;
	}



//	// 特殊药品销售明细
//	@RequestMapping("/registration.action")
//	public ModelAndView toSaleSpecialDrugJSP() {
//		ModelAndView andView = new ModelAndView();
//		List<Map<String, Object>> specialDruges = specialDrugService.queryAllSpecialSale();
//		andView.addObject("specialDruges", specialDruges);
//		andView.setViewName("pharmacy/special_drug_sale");
//		return andView;
//	}
	
	// 特殊药品销售明细
	@RequestMapping("/registration.action")
	public ModelAndView toSaleSpecialDrugJSP(Integer pageIndex, String drug_name, String start, String end) {
		if (pageIndex == null) {
			pageIndex = 1;
		}

		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> specialDruges = specialDrugService.queryAllSpecialSale(pageIndex, InfoPage.NUMBER,
				drug_name, start, end); 
		// 回填
		andView.addObject("start", start);
		andView.addObject("end", end);
		andView.addObject("drug_name", drug_name);

		System.out.println("start="+start);
		System.out.println("end="+end);
		
		
		InfoPage page = new InfoPage(specialDruges);
		andView.addObject("page", page);

		andView.addObject("specialDruges", specialDruges);
		andView.setViewName("pharmacy/special_drug_sale");
		return andView;
	}


	// 特殊药品药房库存明细
	@RequestMapping("/inventory.action")
	public ModelAndView toSpecialDrugHaveJSP(Integer pageIndex, String drug_name) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> specialDruges = specialDrugService.queryAllSpecialHave(pageIndex, InfoPage.NUMBER,
				drug_name);

		// 回填
		andView.addObject("drug_name", drug_name);

		InfoPage page = new InfoPage(specialDruges);
		andView.addObject("page", page);
		andView.addObject("specialDruges", specialDruges);
		andView.setViewName("pharmacy/special_drug_stock");
		return andView;
	}
}

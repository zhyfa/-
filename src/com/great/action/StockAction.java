package com.great.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.great.bean.Admin;
import com.great.bean.Drug;
import com.great.bean.InfoPage;
import com.great.bean.ReturnGood;
import com.great.bean.Stock;
import com.great.service.StockService;

@Controller
@RequestMapping("/stock")
public class StockAction {
	@Autowired
	private StockService stockService;
/**
 * jyf
 * @return
 *     登陆后 效验 药库 库存是否 低于最低限量 
 */
	// stockList.action  
	@RequestMapping(value = "/stockList.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public List<Stock> getStocks(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if(admin.getRole_id()!=2) {
			return null;
		};
		List<Stock> stocks = stockService.checkStockNum();
		for(Stock stock:stocks) {
			if(stock.getStock_number()<=stock.getStock_min()) {
				stock.setMsg("不足！");
			}
		}
		return stocks;
	}
	/**
	 * jyf
	 * 返回药库库存表记录
	 * @return
	 */
	@RequestMapping("/return.action")
	public ModelAndView returnDrug(Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		List<Drug> drugs = stockService.getStocks(pageIndex,InfoPage.NUMBER);
		InfoPage page = new InfoPage(drugs);
		ModelAndView andView = new ModelAndView();
		andView.addObject("drugs", drugs);
		andView.addObject("page", page);
		andView.setViewName("drugLibrary/stock_return_list");
		return andView;
	}
	/**
	 *  蒋亚福
	 * @param drug_id
	 * @return
	 */
	//returnGoodsBefore.action
	@RequestMapping("/returnGoodsBefore.action")
	public ModelAndView returnGoodsBefore(Integer drug_id) {
		List<Stock> stocks = stockService.getStocksByDrugId(drug_id);
		ModelAndView andView = new ModelAndView();
		andView.addObject("stocks", stocks);
		andView.setViewName("drugLibrary/stock_returnGood");
		return andView;
	};
	/**
	 *  蒋亚福
	 * @param stock_id
	 * @return
	 */
	//returnGood.action
	@RequestMapping(value = "/returnGood.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody int returnGood(ReturnGood returnGood) {
		int result = stockService.returnGoodAdd(returnGood);
		if(result==1) {
			return 1;
		}else {
			return 0;
		}
	
	}
}

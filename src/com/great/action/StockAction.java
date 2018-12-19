package com.great.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.Admin;
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
	public ModelAndView returnDrug() {
		ModelAndView andView = new ModelAndView();
		List<Stock> stocks = stockService.getStocks();
		andView.addObject("stocks", stocks);
		andView.setViewName("drugLibrary/stock_list");
		return andView;
	}
}

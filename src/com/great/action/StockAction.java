package com.great.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.DateFormat;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
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
import com.great.bean.Inventory;
import com.great.bean.Overdue;
import com.great.bean.ReturnGood;
import com.great.bean.Stock;
import com.great.bean.Unsalable;
import com.great.service.InventoryService;
import com.great.service.PharmacyApplyService;
import com.great.service.StockService;
import com.great.service.UnsalableService;

@Controller
@RequestMapping("/stock")
public class StockAction {
	@Autowired
	private StockService stockService;
	@Autowired
	private UnsalableService unsalableService;
	@Autowired
	private InventoryService inventoryService;
	@Autowired
	private PharmacyApplyService pharmacyApplyService;
	// 通过drug_id，factory_id,birthday查询药库库存表中该药品的库存总量
	@RequestMapping(value = "/getDrugNum.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody Map<String, Object> getDrugNum(int factory_id,int drug_id,String birthday) {
		Map<String, Object> map=new HashMap<>();
		map.put("drug_id", drug_id);
		map.put("factory_id", factory_id);
		map.put("birthday", birthday);
		Map<String, Object> result = stockService.getDrugNum(map);
		if(result.size()>0) {
			return result;
		}
		System.out.println(result);
		result.put("STOCK_NUMBER", 0);
		return result;
	}
	
	
	// 通过drug_id，factory_id查询药库库存表中该药品的生产日期和库存总量
	@RequestMapping(value = "/getByDrugIdAndFactoryId.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Map<String, Object>> getByDrugIdAndFactoryId(int factory_id,int drug_id) {
		Map<String, Object> map=new HashMap<>();
		map.put("drug_id", drug_id);
		map.put("factory_id", factory_id);
		List<Map<String, Object>> result = stockService.getByDrugIdAndFactoryId(map);
		return result;
	}

	// 进入药房药品审核页面
	@RequestMapping("/auditing.action")
	public ModelAndView toPharmacyApplyJSP() {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> applyList = pharmacyApplyService.applyList();
		andView.addObject("applyList", applyList);
		andView.setViewName("drugLibrary/pharmacy_apply_add");
		return andView;
	}

	// 通过drug_id查询药库库存表中该ID的库存量
	@RequestMapping(value = "/drugNumById.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int drugNumById(int drug_id) {
		Integer result = stockService.drugNumById(drug_id);
		if(result==null) {
			result=0;
		}
		return result;
	}

	// 通过drug_id查询药库库存表中该药品ID的生产厂家
	@RequestMapping(value = "/getMegByDrugId.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Map<String, Object>> getMegByDrugId(int drug_id) {
		List<Map<String, Object>> meg = stockService.getMegByDrugId(drug_id);
		return meg;
	}
	
	
	
	/**
	 * jyf
	 * 
	 * @return 登陆后 效验 药库 库存是否 低于最低限量
	 * @throws ParseException 
	 */
	// stockList.action
	@RequestMapping(value = "/stockList.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String,Object> getStocks(HttpSession session) throws ParseException {
		Map<String,Object> map = new HashMap<>();
		
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin.getRole_id() == 2) {
//判断   是否低于最低限量====================================================================
			List<Stock> stocks = stockService.checkStockNum();
			for (Stock stock : stocks) {
				if (stock.getStock_number() == null) {
					stock.setStock_number(0);
				}
				if (stock.getStock_number() <= stock.getStock_min()) {
					stock.setMsg("不足！");
				}
			}
			map.put("stocks", stocks);

			
		} else if (admin.getRole_id() == 3) {
			List<Inventory> inventorys = stockService.checkInventoryNum();
			for(Inventory inventory:inventorys) {
				if(inventory.getInventory_number()==null) {
					inventory.setInventory_number(0);
				}
				if(inventory.getInventory_number()<=inventory.getInventory_min()) {
					inventory.setMsg("不足！");
				}
			}
			map.put("stocks", inventorys);
//判断   是否  滞销=========================================================================
			List<Inventory> ainventorys = unsalableService.getInventorys();
			Unsalable unsalable = unsalableService.getUnsalableRule();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置 日期格式
			Date now = new Date();//获取当前时间
			Calendar rightNow = Calendar.getInstance();
			rightNow.setTime(now);
			rightNow.add(Calendar.DAY_OF_YEAR,-unsalable.getUnsalable_day());//日期-规则天数天
			Date now1=rightNow.getTime(); // 得到 当前时间  -  滞销时间    判断药品插入时间小于这个时间的卖出了多少规格药
		   
			List<Inventory> inventoryss = new ArrayList();
			for(int i =0;i<ainventorys.size();i++) {
				Inventory inventory = ainventorys.get(i);
				Integer drug_id = inventory.getDrug_id();
				String cdate = inventory.getCdate();
				Date parse = sdf.parse(cdate);//获取所有 的 记录的 插入时间
				if(parse.before(now1)) {
					Integer soldNum = unsalableService.getSoldNum(inventory.getDrug_id());
					if(soldNum==null) {
						soldNum=0;
					}
					if(soldNum<unsalable.getUnsalable_number()) {
						inventory.setMsg("滞销了");
					}
					inventoryss.add(inventory);
				}
			}
			map.put("unsalables", inventoryss);
//判断是否过期=================================================================================================
			DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
	        Date date = new Date();//df.format(new Date());// new Date()为获取当前系统时间
	        
	       // PageHelper.startPage(pageIndex, InfoPage.NUMBER);
			List<Overdue> overdues = inventoryService.getOverdues();
			//InfoPage page = new InfoPage(overdues);
			List<Overdue> overduess = new ArrayList<>();
			for(Overdue overdue:overdues) {
				if(overdue.getNowDate().getTime()<=date.getTime()) {
					overdue.setMsg("过期了");
					overduess.add(overdue);
				}
			}
			map.put("overdues", overduess);
			
		}
		return map;
	}

	/**
	 * jyf 返回药库库存表记录
	 * 
	 * @return
	 */
	@RequestMapping("/return.action")
	public ModelAndView returnDrug(Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		List<Drug> drugs = stockService.getStocks(pageIndex, InfoPage.NUMBER);
		InfoPage page = new InfoPage(drugs);
		ModelAndView andView = new ModelAndView();
		andView.addObject("drugs", drugs);
		andView.addObject("page", page);
		andView.setViewName("drugLibrary/stock_return_list");
		return andView;
	}

	/**
	 * 蒋亚福
	 * 
	 * @param drug_id
	 * @return
	 */
	// returnGoodsBefore.action
	@RequestMapping("/returnGoodsBefore.action")
	public ModelAndView returnGoodsBefore(Integer drug_id) {
		List<Stock> stocks = stockService.getStocksByDrugId(drug_id);
		ModelAndView andView = new ModelAndView();
		andView.addObject("stocks", stocks);
		andView.setViewName("drugLibrary/stock_returnGood");
		return andView;
	};

	/**
	 * 蒋亚福
	 * 
	 * @param stock_id
	 * @return
	 */
	// returnGood.action
	@RequestMapping(value = "/returnGood.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int returnGood(ReturnGood returnGood) {
		int result = stockService.returnGoodAdd(returnGood);
		if (result == 1) {
			return 1;
		} else {
			return 0;
		}

	}
}

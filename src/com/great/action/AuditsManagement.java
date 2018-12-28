package com.great.action;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.great.aop.Log;
import com.great.bean.AuditsDetail;
import com.great.bean.InfoPage;
import com.great.bean.Purchase;
import com.great.service.AuditsDetailService;
import com.great.service.DrugService;
import com.great.service.DrugTypeService;
import com.great.service.FactoryService;
import com.great.service.PurchaseService;
import com.great.service.StockService;
import com.great.until.creatImage;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Controller
@RequestMapping("/stock")
public class AuditsManagement {
	public ArrayList<Map> orders=new ArrayList<>();
	public String cgdSy="";
	@Autowired
	private DrugService drugService;
	@Resource
	private DrugTypeService drugTypeService;
	@Resource
	private FactoryService factoryService;
	@Resource
	private StockService stockService;
	@Resource
	private AuditsDetailService auditsDetailService;
	@Resource
	private PurchaseService purchaseService;
	//菜单进入审批单填写页
		@RequestMapping(value = "/purchase.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
		 public ModelAndView toHomepage(HttpServletRequest request) {
			List<Map<String, Object>> secondType = drugTypeService.secondType();
			request.setAttribute("secondType", secondType);
			List<Map<String, Object>> factoris = factoryService.factoris();
			request.setAttribute("factoris", factoris);
			List<Map<String, Object>>  drugList = drugService.queryAll();
			request.setAttribute("drugList", drugList);
		 	ModelAndView mav = new ModelAndView();
		 	mav.setViewName("drugLibrary/storge_add");
			return mav;
		}
		//提交审批单
		@Log(thing = "提交审批单")
		@Transactional
		@RequestMapping(value = "/submitAudits.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody String submitAudits(String auditsdetail_id, int admin_id) {
			Purchase purchase = new Purchase();
			String pharmary_total = auditsDetailService.getTotalPrice(auditsdetail_id);
			purchase.setPharmary_total(pharmary_total);
			purchase.setAdmin_id(admin_id);
			int pharmary_number = auditsDetailService.getTotalDrug(auditsdetail_id);
			purchase.setAuditsdetail_id(auditsdetail_id);
			purchase.setPharmary_number(pharmary_number);
			int result = purchaseService.addPruchase(purchase);
			int result1 = auditsDetailService.updateDetail(auditsdetail_id);
			String str = result > 0 ? "0" : "1";
			return str;
		}
		//根据药名显示药品信息
		@RequestMapping(value = "/showDrugId.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody List<Map<String,Object>> showDrugId(String drug_name) throws UnsupportedEncodingException  {
			List<Map<String, Object>> drugList = drugService.queryByName(drug_name);
			return drugList;
		}
		//根据药品id显示药品信息
		@RequestMapping(value = "/showDrugDetail.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody Map<String,Object> showDrugDetail(int drug_id) throws UnsupportedEncodingException  {
			Map<String, Object> drug = drugService.queryById(drug_id);
			return drug;
		}
		//添加明细
		@Transactional
		@RequestMapping(value = "/addOrder.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody ArrayList<Map> addOrder(@RequestBody String order) throws UnsupportedEncodingException {
			//AuditsDetail
			order=URLDecoder.decode(order, "UTF-8");
			order = order.substring(0,order.length() - 1);
			String[] temp=order.split(" ");
			JSONArray jsonArray=JSONArray.fromObject(temp);
			JSONObject  myJson = JSONObject.fromObject(order);
			Map m=myJson;
			String auditsdetail_id = (String) m.get("auditsdetail_id");
			
			int count = auditsDetailService.addDetail(m);
			orders.add(m);
			System.out.println("orders.size()="+orders.size());
			System.out.println(orders);
			return orders;
		}
		//菜单进入审批明细列表
		@RequestMapping(value = "/purchaseDetail.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
		 public ModelAndView PurchaseDetail(HttpServletRequest request,Integer pageIndex,String auditsdetail_id) {
			if(pageIndex==null) {
				pageIndex=1;
			}
			PageHelper.startPage(pageIndex, InfoPage.NUMBER);
			List<Map<String,Object>> aditDeatilList = auditsDetailService.queryDetail(auditsdetail_id);
			Map<String,Object> purchase = purchaseService.queryPurchaseById(auditsdetail_id);
			InfoPage page = new InfoPage(aditDeatilList);
		 	ModelAndView mav = new ModelAndView();
		 	mav.addObject("aditDeatilList", aditDeatilList);
		 	mav.addObject("purchase", purchase);
		 	mav.addObject("page", page);
		 	mav.setViewName("manage/audit_detail");
			return mav;
		}
		
		//同意采购审批
		@Transactional
		@RequestMapping(value = "/passPurchase.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody String passPurchase(String auditsdetail_id) {
			int result = purchaseService.passPurchase(auditsdetail_id);
			int result2 = auditsDetailService.passDetail(auditsdetail_id);
			String str = result > 0 ? "0" : "1";
			return str;
		}
		//驳回采购审批
		@Transactional
		@RequestMapping(value = "/returnPurchase.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody String returnPurchase(String auditsdetail_id) {
			int result = purchaseService.returnPurchase(auditsdetail_id);
			int result2 = auditsDetailService.returnDetail(auditsdetail_id);
			String str = result > 0 ? "0" : "1";
			return str;
		}
		
		//菜单进入审批列表
		@RequestMapping(value = "/apurchaseUpdate.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
		public ModelAndView apurchaseUpdate(HttpServletRequest request,Integer pageIndex) {
			if(pageIndex==null) {
				pageIndex=1;
			}
			PageHelper.startPage(pageIndex, InfoPage.NUMBER);
			List<Map<String,Object>> purchaseList = purchaseService.queryPurchase();
			InfoPage page = new InfoPage(purchaseList);
			ModelAndView mav = new ModelAndView();
			mav.addObject("purchaseList", purchaseList);
			mav.addObject("page", page);
			mav.setViewName("manage/audits_check");
			return mav;
		}
		
		
	@RequestMapping("/creatImage.action")
	public ModelAndView creatImage(String sy) {
		cgdSy=sy;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("drugLibrary/image_cgd");
		return mav;
	}
	
	@RequestMapping("/cgd.action")
	public void cgd(HttpServletResponse response,HttpServletRequest request) throws IOException {
		if(orders!=null) {
			String[] contents = new String[orders.size()+2];
			contents[0]= "采购单";
			contents[1]="药品名称    单价    数量    总价    生产厂家";
			for(int i=0;i<orders.size();i++) {
				contents[i+2]=(String) orders.get(i).get("drug_name")+"      "+(String) orders.get(i).get("price")+"      "+(String) orders.get(i).get("total")+"      "+(String) orders.get(i).get("total_price")+"       "+(String) orders.get(i).get("factory");
			}
			int[] sizes = new int[24];
	    	sizes[0] = 6;
	    	sizes[1] = 11;
	    	sizes[2] = 5;
	    	sizes[3] = 5;
			try {
				creatImage.createImage(contents, sizes,
						"E:/MyEclipseWorkSpace/CreditTraffic/WebRoot",
						"C:/Users/user/Desktop/1.jpg");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			BufferedImage buff=creatImage.markImageByText(cgdSy,"C:/Users/user/Desktop/1.jpg","C:/Users/user/Desktop/2.jpg",90);
			response.setContentType("image/jpg");
	        OutputStream os = response.getOutputStream();
	        ImageIO.write(buff, "jpg", os);
	        os.close();
		}
	}
	
	// 进入采购图形统计页面
		@RequestMapping(value = "/goStockChartJSP.action")
		public ModelAndView goStockChartJSP() {
			ModelAndView andView = new ModelAndView();
			andView.setViewName("manage/stock_chart");
			return andView;
		}

		// 获取这半年的采购药品名字及数量
		@RequestMapping(value = "/getHalfYear.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
		public @ResponseBody List<Map<String, Object>> getHalfYear() {
			List<Map<String, Object>> lists = stockService.getHalfYear();
			return lists;
		}

		// 获取这个月的采购药品名字及数量
		@RequestMapping(value = "/getMonth.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
		public @ResponseBody List<Map<String, Object>> getMonth() {
			List<Map<String, Object>> lists = stockService.getMonth();
			return lists;
		}

		// 获取这周的采购药品名字及数量
		@RequestMapping(value = "/getWeek.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
		public @ResponseBody List<Map<String, Object>> getWeek() {
			List<Map<String, Object>> lists = stockService.getWeek();
			return lists;
		}

		// 获取时间段内采购药品名字及数量
		@RequestMapping(value = "/getOrdersByTime.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
		public @ResponseBody List<Map<String, Object>> getOrdersByTime(String start, String end) {
			System.out.println("start=" + start);
			System.out.println("end=" + end);
			Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			List<Map<String, Object>> lists = stockService.getOrdersByTime(map);
			return lists;
		}
}



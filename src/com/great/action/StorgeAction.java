package com.great.action;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.great.bean.AuditsDetail;
import com.great.bean.InfoPage;
import com.great.bean.Purchase;
import com.great.bean.Stock;
import com.great.bean.Storge;
import com.great.bean.StorgeApply;
import com.great.service.AuditsDetailService;
import com.great.service.DrugService;
import com.great.service.DrugTypeService;
import com.great.service.FactoryService;
import com.great.service.PurchaseService;
import com.great.service.StockService;
import com.great.service.StorgeApplyService;
import com.great.service.StorgeService;
import com.great.until.creatImage;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/storge")
public class StorgeAction {
	public ArrayList<Map> storges=new ArrayList<>();
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
	@Resource
	private StorgeService storgeService;
	@Resource
	private StorgeApplyService storgeApplyService;
	//菜单进入入库申请汇总表
	@RequestMapping(value = "drugStorge.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	public ModelAndView drugStorge(HttpServletRequest request,Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Map<String,Object>> StorgeApplyList = storgeApplyService.queryStorgeApply();
		InfoPage page = new InfoPage(StorgeApplyList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("StorgeApplyList", StorgeApplyList);
	 	mav.addObject("page", page);
		mav.setViewName("drugLibrary/stock_add_check");
		return mav;
	}
			
	//菜单进入入库单填写页
		@RequestMapping(value = "storgeApply.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
		 public ModelAndView storgeApply(HttpServletRequest request) {
			List<Map<String, Object>> factoris = factoryService.factoris();
			request.setAttribute("factoris", factoris);
			/*List<Map<String, Object>>  drugList = drugService.queryAll();
			request.setAttribute("drugList", drugList);*/
			List<Map<String,Object>> purchaseList = purchaseService.getUnfinishedPurchase();
			request.setAttribute("purchaseList", purchaseList);
		 	ModelAndView mav = new ModelAndView();
		 	mav.setViewName("drugLibrary/stock_add_apply");
			return mav;
		}
		//根据审批单id显示药品名称
		@RequestMapping(value = "/showDrugName.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody List<Map> showDrugName(String auditsdetail_id) throws UnsupportedEncodingException  {
			List<Map> detailList = auditsDetailService.queryDetail(auditsdetail_id);
			System.out.println("detailList="+detailList);
			return detailList;
		}
		//根据药名显示药品信息
		@RequestMapping(value ="/showDrugId.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody List<Map<String,Object>> showDrugId(String drug_name,String auditsdetail_id) throws UnsupportedEncodingException  {
			AuditsDetail auditsDetail = new AuditsDetail();
			auditsDetail.setAuditsdetail_id(auditsdetail_id);
			auditsDetail.setDrug_name(drug_name);
			List<Map<String,Object>> drugList = auditsDetailService.getdetail(auditsDetail);
			return drugList;
			
		}
		//根据药品id显示药品信息
		@RequestMapping(value = "/showDrugDetail.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody Map<String,Object> showDrugDetail(int drug_id) throws UnsupportedEncodingException  {
		Map<String,Object> detail = auditsDetailService.queryByDrugId(drug_id);
		return detail;
					
		}
		
		
		//添加明细
		@RequestMapping(value ="/addStorge.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody ArrayList<Map> addStorgeApply(@RequestBody String storge) throws UnsupportedEncodingException {
			storge=URLDecoder.decode(storge, "UTF-8");
			storge = storge.substring(0,storge.length() - 1);
			String[] temp=storge.split(" ");
			JSONArray jsonArray=JSONArray.fromObject(temp);
			JSONObject  myJson = JSONObject.fromObject(storge);
			Map m=myJson;
			String storge_id = (String) m.get("storge_id");
			int count = storgeService.addStorge(m);
			storges.add(m);
			System.out.println("storges.size()="+storges.size());
			System.out.println(storges);
			return storges;
		}
		//提交审批单
		@Transactional
		@RequestMapping(value = "/submitStorge.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody String submitStorge(String storge_id, int admin_id) {
			int storge_total = storgeService.getStorgeTotal(storge_id);
			int type_total = storgeService.getDrugtypeTotal(storge_id);
			StorgeApply storgeApply = new StorgeApply();
			storgeApply.setStorge_id(storge_id);
			storgeApply.setAdmin_id(admin_id);
			storgeApply.setStorge_total(storge_total);
			storgeApply.setType_total(type_total);
			int result = storgeApplyService.addStorgeApply(storgeApply);
			Storge storge = new Storge();
			storge.setStat(2);
			storge.setStorge_id(storge_id);
			int result2 = storgeService.submitStorgeApply(storge);
			String str = result > 0 ? "0" : "1";
			return str;
		}
		
		//进入入库单明细表
		@RequestMapping(value = "storgeApplyDetail.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
		public ModelAndView storgeApplyDetail(HttpServletRequest request,Integer pageIndex,String storge_id) {
			if(pageIndex==null) {
				pageIndex=1;
			}
			PageHelper.startPage(pageIndex, InfoPage.NUMBER);
			Map<String,Object> storgeApply = storgeApplyService.queryApplyDetail(storge_id);
			List<Map<String,Object>> detailList = storgeService.queryStorge(storge_id);
			System.out.println("detailList="+detailList);
			System.out.println("storgeApply="+storgeApply);
			InfoPage page = new InfoPage(detailList);
			ModelAndView mav = new ModelAndView();
			mav.addObject("detailList", detailList);
		 	mav.addObject("storgeApply", storgeApply);
		 	mav.addObject("page", page);
			mav.setViewName("drugLibrary/stock_apply_detail");
			return mav;
		}
		
		//核对入库
		@Transactional
		@RequestMapping(value = "/checkAndStorge.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody String checkAndStorge(int storgedetail_id,int real_storgeno,String reasonfor_varity, String notes,int real_storgetotal,int real_storgetype) {
			Storge storge = new Storge();
			storge.setStorgedetail_id(storgedetail_id);
			storge.setReal_storgeno(real_storgeno);
			storge.setReasonfor_varity(reasonfor_varity);
			storge.setNotes(notes);
			storge.setStat(4);
		//更新入库明细状态
		int result = storgeService.updateStorge(storge);
		//根据明细id查询明细信息
		Map<String,Object> mStorge = storgeService.getDetailById(storgedetail_id);
		System.out.println("mStorge="+mStorge);
		String storge_id =  (String) mStorge.get("STORGE_ID");
		String auditsdetail_id = (String) mStorge.get("AUDITSDETAIL_ID");
		BigDecimal bDrug_id = (BigDecimal) mStorge.get("DRUG_ID");
		Timestamp production_date = (Timestamp) mStorge.get("PRODUCTION_DATE");
		String sBirthday = production_date.toString();
		String[] b=sBirthday.split("\\.");
		String a=b[0];
		System.out.println(a);
		String factory_name = (String) mStorge.get("FACTORY_NAME");
		int drug_id = bDrug_id.intValue();
		//根据入库单编号查询入库单信息
		Map<String,Object> mStorgeApply = storgeApplyService.queryApplyDetail(storge_id);
		System.out.println("mStorgeApply="+mStorgeApply);
		BigDecimal bType_total = (BigDecimal) mStorgeApply.get("TYPE_TOTAL");
		int type_total = bType_total.intValue();
		
		int realStorgetotal = real_storgetotal+real_storgeno;
		int realStorgeType = real_storgetype+1;
		System.out.println("realStorgeType="+realStorgeType);
		StorgeApply storgeApply = new StorgeApply();
		storgeApply.setStorge_id(storge_id);
		storgeApply.setReal_storgetotal(realStorgetotal);
		storgeApply.setReal_storgetype(realStorgeType);
		Purchase purchase = new Purchase();
		purchase.setAuditsdetail_id(auditsdetail_id);
		if(realStorgeType==type_total){
			storgeApply.setStat(4);
			purchase.setStat(5);
		}else {
			storgeApply.setStat(3);
			purchase.setStat(4);
		}
		int result2 = storgeApplyService.updateStorgeApply(storgeApply);
		int result3 = purchaseService.updateStock(purchase);
		AuditsDetail auditsDetail = new AuditsDetail();
		auditsDetail.setAuditsdetail_id(auditsdetail_id);
		auditsDetail.setDrug_id(drug_id);
		//根据明细id和药品id查询明细
		Map<String,Object> detail = auditsDetailService.getdetailInfo(auditsDetail);
		System.out.println("detail="+detail);
		BigDecimal bTotal = (BigDecimal) detail.get("TOTAL");
		int total = bTotal.intValue();
		BigDecimal bStockNum = (BigDecimal) detail.get("STOCK_NUM");
		BigDecimal bAdminId = (BigDecimal) detail.get("ADMIN_ID");
		int admin_id = bAdminId.intValue();
		int stock_num = bStockNum.intValue();
		int stockNum= real_storgeno+stock_num;
		auditsDetail.setStock_num(stockNum);
		if(stockNum>=total) {
			auditsDetail.setStat(5);
		}else {
			auditsDetail.setStat(4);
		}
		int result4 = auditsDetailService.updateStock(auditsDetail);
		//添加库存表实际库存
		int factory_id = factoryService.getFactoryId(factory_name);
		Stock stock = new Stock();
		
		stock.setAdmin_id(admin_id);
		stock.setDrug_id(drug_id);
		stock.setFactory_id(factory_id);
		stock.setBirthday(a);
		stock.setStock_number(real_storgeno);
		int result5 = stockService.addStockNum(stock);
		
		String str = result4 > 0 ? "0" : "1";
		return str;
		}
	
		//驳回核对入库
		@Transactional
		@RequestMapping(value = "/checkAndReturn.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody String checkAndReturn(int storgedetail_id,int real_storgeno,String reasonfor_varity, String notes) {
			Storge storge = new Storge();
			storge.setStorgedetail_id(storgedetail_id);
			storge.setReal_storgeno(real_storgeno);
			storge.setReasonfor_varity(reasonfor_varity);
			storge.setNotes(notes);
			storge.setStat(6);
			int result = storgeService.updateStorge(storge);
			String str = result > 0 ? "0" : "1";
			return str;
			}
		//审核入库申请
		@Transactional
		@RequestMapping(value = "/passStorgeApply.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody String passPurchase(String storge_id) {
			StorgeApply StorgeApply = new StorgeApply();
			StorgeApply.setStorge_id(storge_id);
			StorgeApply.setStat(4);
		int result = storgeApplyService.updateStorgeApply(StorgeApply);
		Storge storge = new Storge();
		storge.setStorge_id(storge_id);
		storge.setStat(4);
		int result2 = storgeService.updateStorge(storge);
		String str = result > 0 ? "0" : "1";
		return str;
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
			if(storges!=null) {
				String[] contents = new String[storges.size()+2];
				contents[0]= "入库单";
				contents[1]="药品名称    采购单编号    生产厂家    生产日期      生产批号       数量     ";
				for(int i=0;i<storges.size();i++) {
					contents[i+2]=(String) storges.get(i).get("drug_name")+"      "+(String) storges.get(i).get("auditsdetail_id")+"      "+(String) storges.get(i).get("factory")+"      "+(String) storges.get(i).get("production_date")+"       "+(String) storges.get(i).get("production_id")+"       "+(String) storges.get(i).get("storge_number");
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
}

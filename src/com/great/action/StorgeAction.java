package com.great.action;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
	
	//菜单进入入库单填写页
	@RequestMapping(value = "drugStorge.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	public ModelAndView drugStorge(HttpServletRequest request,Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		PageHelper.startPage(pageIndex, InfoPage.NUMBER);
		List<Map<String,Object>> StorgeApplyList = storgeApplyService.queryStorgeApply();
		InfoPage page = new InfoPage(StorgeApplyList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("purchaseList", StorgeApplyList);
	 	mav.addObject("page", page);
		mav.setViewName("drugLibrary/stock_add_check");
		return mav;
	}
			
	//菜单进入入库单填写页
		@RequestMapping(value = "storgeApply.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
		 public ModelAndView storgeApply(HttpServletRequest request) {
			List<Map<String, Object>> factoris = factoryService.factoris();
			request.setAttribute("factoris", factoris);
			List<Map<String, Object>>  drugList = drugService.queryAll();
			request.setAttribute("drugList", drugList);
			List<Map<String,Object>> purchaseList = purchaseService.getUnfinishedPurchase();
			request.setAttribute("purchaseList", purchaseList);
		 	ModelAndView mav = new ModelAndView();
		 	mav.setViewName("drugLibrary/stock_add_apply");
			return mav;
		}
		//根据药名显示药品信息
		@RequestMapping(value = "/showDrugId.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody List<Map<String,Object>> showDrugId(String drug_name) throws UnsupportedEncodingException  {
			List<Map<String, Object>> drugList = drugService.queryByName(drug_name);
			return drugList;
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
			/*List<Map<String,Object>> detail = storgeService.queryStorge(storge_id);
			if(detail!=null) {
				storgeService.deleteStorge(storge_id);
			}*/
			int count = storgeService.addStorge(m);
			storges.add(m);
//			int count = storgeService.addStorge(storges);
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
			int result2 = storgeService.updateStorge(storge);
			String str = result > 0 ? "0" : "1";
			return str;
		}
		
		//审核入库申请
		@Transactional
		@RequestMapping(value = "/passStorgeApply.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody String passPurchase(String auditsdetail_id) {
		int result = purchaseService.passPurchase(auditsdetail_id);
		int result2 = auditsDetailService.passDetail(auditsdetail_id);
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

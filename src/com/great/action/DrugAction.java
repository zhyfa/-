package com.great.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.Banned;
import com.great.bean.Drug;
import com.great.bean.InfoPage;
import com.great.bean.Page;
import com.great.service.BannedService;
import com.great.service.DrugService;
import com.great.service.DrugTypeService;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/drug")
public class DrugAction {

	@Autowired
	private DrugService drugService;
	@Resource
	private DrugTypeService drugTypeService;
	@Resource
	private BannedService bannedservice;
	
	Page page;

	@RequestMapping("/toDrugJSP.action")
	public ModelAndView toDrugJSP(Integer pageIndex, String drug_name, Integer smalltype_id, String illustrate) {
		if (pageIndex == null) {
			pageIndex = 1;
		}

		List<Map<String, Object>> secondType = drugTypeService.secondType();// 填充小类别

		System.err.println("smalltype_id=" + smalltype_id);

		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> druges = drugService.queryAllByCondition(pageIndex, InfoPage.NUMBER, drug_name,
				smalltype_id, illustrate);
		// 回填
		andView.addObject("smalltype_id", smalltype_id);
		andView.addObject("drug_name", drug_name);
		andView.addObject("illustrate", illustrate);

		InfoPage page = new InfoPage(druges);
		andView.addObject("page", page);

		andView.addObject("druges", druges);
		andView.addObject("secondType", secondType);
		andView.setViewName("drugLibrary/drug");
		return andView;
	}

	// 进入添加一个药品界面
	/*
	 * 1、填充小类别
	 */
	@RequestMapping("/toAddDrugJSP.action")
	public ModelAndView toAddDrugJSP() {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> firstType = drugTypeService.firstType();// 填充大类别
		List<Map<String, Object>> secondType = drugTypeService.secondType();// 填充小类别
		andView.addObject("firstType", firstType);
		andView.addObject("secondType", secondType);
		andView.setViewName("drugLibrary/drug_add");
		return andView;
	}

	/*
	 * 1、进入修改药品信息界面 2、通过药品Id获取该药品的信息 3、填充小类别
	 */
	@RequestMapping("/toUpdateDrugJSP.action")
	public ModelAndView toUpdateDrugJSP(int drug_id) {
		System.out.println("drug_id=" + drug_id);
		ModelAndView andView = new ModelAndView();
		Map<String, Object> drug = drugService.queryById(drug_id);
		List<Map<String, Object>> secondType = drugTypeService.secondType();// 填充小类别
		andView.addObject("drug", drug);
		andView.addObject("secondType", secondType);
		andView.setViewName("drugLibrary/drug_update");
		return andView;
	}

	// 添加药品
	@RequestMapping(value = "/addDrug.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String addDrug(@RequestBody Drug drug) {
		int result = drugService.addDrug(drug);
		String str = result > 0 ? "0" : "1";
		return str;
	}

	// 通过drug_id获取该药品的信息
	@RequestMapping("/searchById.action")
	public @ResponseBody Map<String, Object> searchById(int drug_id) {
		System.out.println("drug_id=" + drug_id);
		Map<String, Object> drug = drugService.queryById(drug_id);
		return drug;
	}

	// 删除药品
	// 未完成，ajax返回不了数据回去
	@RequestMapping(value = "/delDrug.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String delDrug(@Param(value = "drug_id") int drug_id) {
		int result = drugService.delDrug(drug_id);
		String str = result > 0 ? "0" : "1";
		return str;
	}
//	@RequestMapping("/delDrug.action")
//	public ModelAndView delDrug(int drug_id) {
//		ModelAndView andView = new ModelAndView();
//		int result = drugService.delDrug(drug_id);//先删除
//		List<Map<String, Object>> druges = drugService.queryAll();// 查询全部的药品信息
//		andView.addObject("druges", druges);
//		andView.setViewName("drugLibrary/drug");
//		return andView;
//	}

	// 修改药品信息
	@RequestMapping(value = "/updateDrug.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String updateDrug(@RequestBody Drug drug) {
		System.out.println("drug=" + drug.toString());
		int result = drugService.updateDrug(drug);
		String str = result > 0 ? "0" : "1";
		return str;
	}

///////////////////////////设置最低量开始////////////////////
//stock_min.action
	@RequestMapping("/stock_min.action")
	public ModelAndView stock_min(Integer pageIndex, Integer NUMBER) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		ModelAndView andView = new ModelAndView();
		List<Drug> drugs = drugService.getDrugs(pageIndex, InfoPage.NUMBER);
		InfoPage page = new InfoPage(drugs);
		andView.addObject("page", page);
		andView.addObject("drugs", drugs);
		andView.setViewName("drugLibrary/stock_min");
		return andView;
	};

//updateStockMinBefore
	@RequestMapping("/updateStockMinBefore.action")
	public ModelAndView updateStockMinBefore(Integer drug_id) {
		Drug drug = drugService.getDrugByDrudId(drug_id);
		ModelAndView andView = new ModelAndView();
		andView.addObject("drug", drug);
		andView.setViewName("drugLibrary/stock_min_update");
		return andView;
	}

//drug/updateStockMin.action
	@RequestMapping(value = "/updateStockMin.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int updateParameter(Drug drug) {
		int result = drugService.updateStockMin(drug);
		if (result == 1) {
			return 1;
		} else {
			return 2;
		}

	}
///////////////////////////设置最低量结束////////////////////
	//-----------------------------------xsm------------
		//初始化
				@RequestMapping("/banned.action")
				public ModelAndView bannedbefor() {
					Map<String, Object> map=new HashMap<>();
					map.put("drugId", 0);
					page=new Page();
					page.setPageTwo(1);
					page.setPage(1);
					page.setTotal(drugService.queryCount(map));
					page.csh();
					map.put("StartCount", page.getStartCount());
					map.put("endCount", page.getEndCount());
					List<Map<String, Object>> list=drugService.querypagedrug(map);
					page.setQueryList(list);
					ModelAndView andView = new ModelAndView();
					List<Map<String,Object>> lists= drugService.getalldrug();
//					List<Map<String,Object>> banedlist=bannedservice.queryall();
					andView.addObject("drugs", lists);
					andView.addObject("page", page);
					andView.setViewName("manage/Banned");
					return andView;
				}
				
				//A查询还没匹配的药品
				@RequestMapping(value = "/qurydrugbyid.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
				public @ResponseBody List<Map<String,Object>> querybannedDrug(int drugid) {
					List<Map<String,Object>> result = drugService.querybannedDrug(drugid);
					return result;
				}
				
				//增加禁忌
				@RequestMapping(value = "/addbanned.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
				public @ResponseBody String addbanned(@RequestParam String data, Object HashMap) {
//					List<Map<String,Object>> result = drugService.querybannedDrug(drugid);
					System.err.println(data);
					 JSONArray ja = JSONArray.fromObject(data); 
					 System.err.println("??????:"+ja);
					 List<Map<String,String>> list=new ArrayList();
					 for(Object jstr:ja){
				            list.add((Map<String, String>) jstr);
				            }
				     System.out.println(list);    
					 System.out.println("List:"+list);
					 System.out.println("List:"+list.get(0));
					 Banned banned=new Banned();
					 int j=0;
					 for(int i=0;i<list.size();i++) {
						 banned.setPharmacy_id(Integer.valueOf(list.get(i).get("roiName")));
						 banned.setPharmacy_id1(Integer.valueOf(list.get(i).get("roiInfo")));
						 j+=bannedservice.addBanned(banned);
					 }
					 if(j<list.size()) {
						 return "2";
					 }
					 
					 System.out.println("List内容:"+list.get(0).get("roiName"));
					return "1";
				}
				//模糊查询禁忌药品
				@RequestMapping(value = "/qurybannedbydrug.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
				public @ResponseBody Page qurybannedbydrug(int drugid,int dqpage,int pageTwo) {
					Map<String, Object> map=new HashMap<>();
					map.put("drugId", drugid);
					page=new Page();
					page.setPageTwo(pageTwo);
					page.setPage(dqpage);
					page.setTotal(drugService.queryCountdrug(map));
					page.csh();
					map.put("StartCount", page.getStartCount());
					map.put("endCount", page.getEndCount());
					List<Map<String, Object>> list=drugService.querypagedrug(map);
					page.setQueryList(list);
					return page;
				}
				
				@RequestMapping(value = "/delebanbed.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
				public @ResponseBody String delebanbed(int drugid,int drugid1) {
					Banned banned=new Banned();
					banned.setPharmacy_id(drugid);
					banned.setPharmacy_id1(drugid1);
					int i=bannedservice.delBanned(banned);
					if(i>0) {
					return "1";}
					else {
						return"2";
					}
				}
				
				//跳转配置医保药品界面
				@RequestMapping("medical.action")
				public ModelAndView medical() {
					ModelAndView mav=new ModelAndView();
					mav.setViewName("drugLibrary/medical");
					return mav;
				}
				
				
}

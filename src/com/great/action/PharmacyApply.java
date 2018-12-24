package com.great.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.Admin;
import com.great.service.DrugService;
import com.great.service.DrugTypeService;
import com.great.service.FactoryService;
import com.great.service.PharmacyApplyService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/pharmacyApply")
public class PharmacyApply {
	@Resource
	private PharmacyApplyService pharmacyApplyService;
	@Resource
	private DrugService drugService;
	@Resource
	private DrugTypeService drugTypeService;
	@Resource
	private FactoryService factoryService;

	// 进入药房同意申请药品列表页，按照IC排序state=3
	// 获取申请药品表中的ic和cdate
	@RequestMapping(value = "/pharmacy_apply_list3.action")
	public ModelAndView pharmacy_apply_list3() {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> applyList = pharmacyApplyService.applyList3();
		andView.addObject("applyList", applyList);
		andView.setViewName("pharmacy/pharmacy_apply_list3");
		return andView;
	}

	// 进入该IC编号的具体申请明细页面state=3
	@RequestMapping(value = "/pharmacy_apply_detaile3.action")
	public ModelAndView pharmacy_apply_detaile3(int ic) {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> applyList = pharmacyApplyService.applyList3ByIc(ic);
		andView.addObject("applyList", applyList);
		andView.addObject("ic", ic);
		andView.setViewName("pharmacy/pharmacy_apply_detaile3");
		return andView;
	}

	// 药房人员确认数据一致，确认该领药流程结束把state的值更改为3
	@RequestMapping(value = "/affirmApply.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String affirmApply(int ic, HttpServletRequest request) {
		// 获取session中的药库人员ID(admin_id2的值)
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		int admin_id = admin.getAdmin_id();
		int result = pharmacyApplyService.affirmApply(ic, admin_id);
		String str = result > 0 ? "0" : "1";
		return str;
	}

	// 进入药房同意申请药品列表页，按照IC排序state=2
	// 获取申请药品表中的ic和cdate
	@RequestMapping(value = "/pharmacy_apply_list2.action")
	public ModelAndView pharmacy_apply_list2() {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> applyList = pharmacyApplyService.applyList2();
		andView.addObject("applyList", applyList);
		andView.setViewName("pharmacy/pharmacy_apply_list2");
		return andView;
	}

	// 进入该IC编号的具体申请明细页面
	@RequestMapping(value = "/pharmacy_apply_detaile2.action")
	public ModelAndView pharmacy_apply_detaile2(int ic) {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> applyList = pharmacyApplyService.applyList2ByIc(ic);
		andView.addObject("applyList", applyList);
		andView.addObject("ic", ic);
		andView.setViewName("pharmacy/pharmacy_apply_detaile2");
		return andView;
	}

	// 获取药库端上传的数据，并把它解析成一个个map
	@RequestMapping(value = "/realPharmacyApply.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String realPharmacyApply(String JSONtext, int ic, HttpServletRequest request) {
		// 获取session中的药库人员ID(admin_id2的值)
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		int admin_id2 = admin.getAdmin_id();
		// 通过ic值获取admin_id1的值
		int admin_id1 = pharmacyApplyService.getAdmin_id1(ic);
		ArrayList<Map> list = new ArrayList<>();
		System.out.println("JSONtext=" + JSONtext);
		String[] temp = JSONtext.split("]");
		// 把字符串数组转化成json字符串
		for (int i = 1; i < temp.length; i++) {
			JSONObject myJson = JSONObject.fromObject(temp[i]);
			Map m = myJson;
			// 取出drug_name的值，获取drug_id
			int drug_id = drugService.getDrugId(m.get("drug_name").toString());
			// 取出factory_name的值，获取factory_id
			int factory_id = factoryService.getFactoryId(m.get("factory_name").toString());

			m.put("admin_id1", admin_id1);
			m.put("admin_id2", admin_id2);
			m.put("drug_id", drug_id);
			m.put("factory_id", factory_id);
			m.put("ic", ic);
			if (m.get("total").toString() == "") {
				m.put("total", 0);
			}
			System.out.println("map=" + m);

			list.add(m);
		}
		int result = pharmacyApplyService.realAddPharmacyApply(list, ic);
		String str = result > 0 ? "0" : "1";
		return str;
	}

	// 进入药房药品申请界面
	@RequestMapping(value = "/toPharmacyApplyJSP.action")
	public ModelAndView toPharmacyApplyJSP() {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> secondType = drugTypeService.secondType();
		List<Map<String, Object>> drugList = drugService.queryAll();
		andView.addObject("secondType", secondType);
		andView.addObject("drugList", drugList);
		andView.setViewName("pharmacy/pharmacy_apply_add");
		return andView;
	}

	@RequestMapping(value = "/addPharmacyApply.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String addPharmacyApply(String JSONtext, HttpServletRequest request) {
		// 获取session中的药房人员ID
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		int admin_id1 = admin.getAdmin_id();

		// 获取要加入的数据的IC字段的值
		int ic = pharmacyApplyService.creatIC();

		ArrayList<Map> list = new ArrayList<>();
		System.out.println("JSONtext=" + JSONtext);
		String[] temp = JSONtext.split("]");
		// 把字符串数组转化成json字符串
		for (int i = 1; i < temp.length; i++) {
			JSONObject myJson = JSONObject.fromObject(temp[i]);
			Map m = myJson;

			m.put("admin_id1", admin_id1);
			m.put("ic", ic);

			list.add(m);
		}
		int result = pharmacyApplyService.addPharmacyApply(list);
		// list.clear();
		String str = result > 0 ? "0" : "1";
		return str;
	}

	// 进入申请药品列表页，按照IC排序state=1
	// 获取申请药品表中的ic和cdate
	@RequestMapping(value = "/pharmacy_apply_list.action")
	public ModelAndView pharmacy_apply_list() {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> applyList = pharmacyApplyService.applyList();
		andView.addObject("applyList", applyList);
		andView.setViewName("pharmacy/pharmacy_apply_list");
		return andView;
	}

	// 进入该IC编号的具体申请明细页面
	@RequestMapping(value = "/pharmacy_apply_detaile.action")
	public ModelAndView pharmacy_apply_detaile(int ic) {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> applyList = pharmacyApplyService.applyListByIc(ic);
		andView.addObject("applyList", applyList);
		andView.setViewName("pharmacy/pharmacy_apply_detaile");
		return andView;
	}

}

package com.great.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

	// 进入药房药品申请界面
	@RequestMapping(value = "/toPharmacyApplyJSP.action")
	public ModelAndView toPharmacyApplyJSP() {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> secondType = drugTypeService.secondType();
		List<Map<String, Object>> drugList = drugService.queryAll();
		andView.addObject("secondType", secondType);
		andView.addObject("drugList", drugList);
		andView.setViewName("pharmacy/pharmacy_apply");
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
}

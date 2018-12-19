package com.great.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.service.DrugTypeService;

@Controller
@RequestMapping("/drugType")
public class DrugTypeAction {
	@Resource
	private DrugTypeService drugTypeService;

	// 进入药品种类页面
	@RequestMapping("/toJSP.action")
	public ModelAndView toDrugMenuJSP() {
		ModelAndView andView = new ModelAndView();
		andView.setViewName("drugLibrary/drug_type");
		return andView;
	}

	// 另一个页面（测试）
	@RequestMapping("/toOtherJsp.action")
	public ModelAndView toOtherJsp() {
		ModelAndView andView = new ModelAndView();
		andView.setViewName("drugLibrary/drug_type2");
		return andView;
	}

	// 1、查询药品的大类别
	@RequestMapping(value = "/firstType.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Map<String, Object>> firstType() {
		List<Map<String, Object>> firstType = drugTypeService.firstType();
		return firstType;
	}

	// 查询父id为father_id下的所有小类别
	@RequestMapping(value = "/secondTypeById.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Map<String, Object>> secondTypeById(int father_id) {
		List<Map<String, Object>> secondTypeById = drugTypeService.secondTypeById(father_id);
		return secondTypeById;
	}

	// 修改一个一级目录的名称
	@RequestMapping(value = "/updateFirstType.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String updateFirstType(int bigtypeId, String bigtypeName) {
		Map<String, Object> map = new HashMap<>();
		map.put("bigtypeName", bigtypeName);
		map.put("bigtypeId", bigtypeId);
		int result = drugTypeService.updateFirstType(map);
		String str = result > 0 ? "0" : "1";
		return str;
	}

	// 查询二级目录
	@RequestMapping(value = "/secondType.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Map<String, Object>> secondType() {
		List<Map<String, Object>> secondType = drugTypeService.secondType();
		return secondType;
	}

	// 修改一个二级目录之前
	@RequestMapping(value = "/updateJsp.action")
	public ModelAndView updateJsp(int smallTypeId) {
		ModelAndView andView = new ModelAndView();
		Map<String, Object> drugType = drugTypeService.typeById(smallTypeId);
		List<Map<String, Object>> firstType = drugTypeService.firstType();
		andView.addObject("firstMenu", firstType);
		andView.addObject("drugType", drugType);
		andView.setViewName("drugLibrary/drug_type_update");
		return andView;
	}

	// 修改一个二级目录
	@RequestMapping(value = "/updateSecondDrugType.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String updateSecondDrugType(int samlltypeId, int fatherId, String smalltypeName) {
		Map<String, Object> map = new HashMap<>();
		map.put("samlltypeId", samlltypeId);
		map.put("fatherId", fatherId);
		map.put("smalltypeName", smalltypeName);
		int result = drugTypeService.updateSecondType(map);
		String str = result > 0 ? "0" : "1";
		return str;
	}

	// 删除一个二级目录之前（一般是不用的，先写着，不要再删了）
	@RequestMapping(value = "/delSecondTypeById.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String delSecondTypeById(int smallTypeId) {
		int result = drugTypeService.delSecondTypeById(smallTypeId);
		String str = result > 0 ? "0" : "1";
		return str;
	}

	// 添加一个一级目录之前
	@RequestMapping(value = "/addFirstTypeBefor.action")
	public ModelAndView addFirstTypeBefor() {
		ModelAndView andView = new ModelAndView();
		andView.setViewName("drugLibrary/drug_type_addfirst");
		return andView;
	}

	// 添加一个一级目录
	@RequestMapping(value = "/addFirstType.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String addFirstType(String bigTypeName) {
		int result = drugTypeService.addFirstType(bigTypeName);
		String str = result > 0 ? "0" : "1";
		return str;

	}

	// 添加一个二级目录之前
	@RequestMapping(value = "/addSecondTypeBefor.action")
	public ModelAndView addSecondTypeBefor() {
		ModelAndView andView = new ModelAndView();
		List<Map<String, Object>> firstType = drugTypeService.firstType();
		andView.addObject("firstMenu", firstType);
		andView.setViewName("drugLibrary/drug_type_addsecond");
		return andView;
	}

	// 添加一个二级目录
	@RequestMapping(value = "/addSecondType.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String addSecondType(String smalltype_name, int father_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("smalltype_name", smalltype_name);
		map.put("father_id", father_id);
		int result = drugTypeService.addSecondType(map);
		String str = result > 0 ? "0" : "1";
		return str;

	}

//	//查询类别的id为SMALLTYPE_ID下的所有药品信息
//	@RequestMapping(value = "/queryById.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
//	public @ResponseBody List<Map<String, Object>> queryById(int smallTypeId) {
//		List<Map<String, Object>> roles = drugService.queryById(smallTypeId);
//		return null;
//	}
}

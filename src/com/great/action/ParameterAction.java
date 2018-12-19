package com.great.action;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.InfoPage;
import com.great.bean.Parameter;
import com.great.service.ParameterService;
//		http://localhost:8080/ssm/parameter/parameterList.action
/**
 * 参数的 增 删 改
 * @author 蒋亚福
 * 2018-12-14
 */
@Controller
@RequestMapping("/parameter") 
public class ParameterAction {
	
	//===============================================================jyf开始=============================
	@Autowired
	private ParameterService parameterService;
	
	//参数列表
	@RequestMapping("/parameterList.action")
	public ModelAndView parameterList( Parameter parameter,Integer pageIndex) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		List parameters = parameterService.getParameters(parameter,pageIndex,InfoPage.NUMBER);
		InfoPage page = new InfoPage(parameters);
		ModelAndView andView = new ModelAndView();
		andView.addObject("parameters", parameters);
		andView.addObject("page", page);
		andView.setViewName("manage/admin_parameter_list");
		return andView;
	}
	
	//进入增加 参数页面 intoAddjsp
	@RequestMapping("/intoAddjsp.action")
	public ModelAndView intoAddjsp() {
		ModelAndView andView = new ModelAndView();
		andView.setViewName("manage/admin_parameter_add");
		return andView;
	}
	
	//增加参数
	@RequestMapping(value = "/parameterAdd.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody String parameterAdd(Parameter parameter) {
		Parameter checkParameter = parameterService.checkParameter(parameter);
		if(checkParameter!=null) {
			return "3";
		}
		int res = parameterService.parameterAdd(parameter);
		if(res==1) {
			return "1";
		}else {
			return "2";
		}
	}
	//删除参数
	@RequestMapping(value = "/delParameter.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody int delParameter(int parameter_id) {
		int result = parameterService.delParameter(parameter_id);
		if(result==1) {
			return 1;
		}else{
			return 2;
		}
	} 
	//更改参数之前
	@RequestMapping("/updateParatemerBefore.action")
	public ModelAndView updateParatemer(int parameter_id) {
		ModelAndView andView = new ModelAndView();
		Parameter parameter = parameterService.getParameterById(parameter_id);
		andView.addObject("parameter", parameter);
		andView.setViewName("manage/admin_parameter_update");
		return andView;
	}
	
	//更改参数
	@RequestMapping(value = "/updateParameter.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody String updateParameter(Parameter parameter) {
		int result = parameterService.updateParameter(parameter);
		if(result==1) {
			return "1";
		}else {
			return "2";
		}
	};
	//===============================================================jyf结束==============================
}

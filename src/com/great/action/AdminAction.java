package com.great.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.Admin;
import com.great.bean.Page;
import com.great.service.AdminService;
import com.great.service.ParameterService;
import com.great.service.RoleService;

@Controller
@RequestMapping("/admin")
public class AdminAction {
	//分页的类
	private Page page;
	@Resource // @AutoWired setUserService()
	private AdminService adminservice;
	@Resource
	private RoleService roleservice;
	@Resource
	private ParameterService parameterservice;
	
	//校验姓名
		@RequestMapping(value = "/checkname.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody String checkname(String adminname) {
			System.out.println(adminname);
			//查询数据库
			Map<String, Object> a=adminservice.checkname(adminname);
			//赋值进去
			if(a==null||a.size()<=0) {
				return "1";
				
			}else {
				return"2";
			}
			//返回显示
		}
	//删除admin成员
	@RequestMapping(value = "/admindelete.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody String deleteadmin(int adminid) {
		//查询数据库
		System.out.println(adminid);
		int a=adminservice.deleteadmin(adminid);
		//赋值进去
		if(a>0) {
			return "1";
			
		}else {
			return"2";
		}
		//返回显示
	}
	//添加成员前的操作
	@RequestMapping("/addadminbefore.action")
	public ModelAndView addadminbefore() {
		ModelAndView andView = new ModelAndView();
		//查询角色数据库
		List<Map<String, Object>> rolelist =roleservice.queryAll();
		List<Map<String, Object>> parameterlist =parameterservice.querybyadmin();
		andView.addObject("parameterlist",parameterlist);//赋值
		//赋值
		andView.addObject("rolelist",rolelist);
		andView.setViewName("manage/addadmin");
		//返回
		return andView;
	}
	
	//添加admin成员
		@RequestMapping(value ="/addadmin.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
		public @ResponseBody String addadmin(Admin admin) {
			//查询数据库
			int a=adminservice.addadmin(admin);
			//赋值进去
			if(a>0) {
				return "1";
				
			}else {
				return"2";
			}
			//返回显示
		}
		
		//修改成员信息前的操作
		@RequestMapping("/updaadminbefore.action")
		public ModelAndView updaadminbefore(int adminid,HttpServletRequest request) {
			ModelAndView andView = new ModelAndView();
			//查询角色数据库
			List<Map<String, Object>> rolelist =roleservice.queryAll();
			//查询数据库
			Map<String, Object> queryalladmin = adminservice.queryadminbyid(adminid);
			//赋值
			List<Map<String, Object>> parameterlist =parameterservice.querybyadmin();
			andView.addObject("parameterlist",parameterlist);//赋值
			andView.addObject("rolelist",rolelist);
			request.setAttribute("admin", queryalladmin);
			andView.setViewName("manage/updateadmin");
			//返回
			return andView;
		}
		
		//修改admin成员
			@RequestMapping(value ="/updateadmin.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
			public @ResponseBody String updateadmin(Admin admin) {
				//查询数据库
				int a=adminservice.updateadmin(admin);
				//赋值进去
				if(a>0) {
					return "1";
					
				}else {
					return"2";
				}
				//返回显示
			}
	//根据ID查询成员
	@RequestMapping("/queryadminbyid.action")
	public ModelAndView queryadminbyid(int adminid) {
		ModelAndView andView = new ModelAndView();
		
		//查询数据库
	Map<String, Object> queryalladmin = adminservice.queryadminbyid(adminid);
		//赋值
		andView.addObject("admin", queryalladmin);
		andView.setViewName("manage/admin");
		//返回
		return andView;
	}
	
	//查询所有成员
	@RequestMapping("/adminList.action")
	public ModelAndView queryUserAdmin(int dqPage,int pageTwo){
		page=new Page();
		page.setPageTwo(pageTwo);
		page.setPage(dqPage);
		page.setTotal(adminservice.queryCountAdmin());
		page.csh();
		List<Map<String, Object>> list=adminservice.queryadmin(page);
		page.setQueryList(list);
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, Object>> rolelist =roleservice.queryAll();
		List<Map<String, Object>> parameterlist =parameterservice.querybyadmin();
		mav.addObject("parameterlist",parameterlist);//赋值
		mav.addObject("page",page);
		mav.addObject("rolelist",rolelist);
		mav.setViewName("manage/adminList");
		return mav;
	}
	
	//模糊搜索admin成员
	@RequestMapping(value ="/queryadmin.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody Page queryadmin(Admin admin,int dqpage,int pageTwo) {
		Map<String, Object> map=new HashMap<>();
		map.put("adminName", admin.getAdmin_name());
		map.put("roleId", admin.getRole_id());
		map.put("adminState", admin.getAdmin_state());
		page=new Page();
		page.setPageTwo(pageTwo);
		page.setPage(dqpage);
		int i=adminservice.queryCountAdminbysome(map);
		page.setTotal(i);
		page.csh();
		map.put("StartCount", page.getStartCount());
		map.put("endCount", page.getEndCount());
		List<Map<String,Object>> list=adminservice.queryadminbysome(map);
		page.setQueryList(list);
		return page;
	}
}

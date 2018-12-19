package com.great.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.great.bean.Drug;
import com.great.bean.InfoPage;
import com.great.service.RoleAndMenuService;
import com.great.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleAction {
	//jj
	@Resource
	private RoleService roleService;
	@Resource
	private RoleAndMenuService roleAndMenuService;

	// 角色更新之前
	@RequestMapping(value = "/updateRoleBefore.action")
	public ModelAndView updateRoleBefore(int roleId) {
		ModelAndView andView = new ModelAndView();
		String roleName = roleService.queryById(roleId);
		andView.addObject("roleName", roleName);
		andView.addObject("roleId", roleId);
		andView.setViewName("manage/role_update");
		return andView;
	}

	// 角色更新
	@RequestMapping(value = "/updateRole.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String updateRole(int roleId, String roleName) {
		Map<String, Object> map = new HashMap<>();
		map.put("roleName", roleName);
		map.put("roleId", roleId);
		int result = roleService.updateRole(map);
		String str = result > 0 ? "0" : "1";
		return str;
	}

	// 进入角色管理的JSP页面
	// 查询角色表的全部信息
//	@RequestMapping("/toJSP.action")
//	public ModelAndView toRoleJSP() {
//		ModelAndView andView = new ModelAndView();
//		List<Map<String, Object>> roles = roleService.queryAll();
//		andView.addObject("roles", roles);
//		andView.setViewName("manage/role_list");
//		return andView;
//	}
	// 进入角色管理的JSP页面
	@RequestMapping(value="/toJSP.action")
	public ModelAndView toRoleJSP(Integer pageIndex,String roleName) {
		if(pageIndex==null) {
			pageIndex=1;
		}
		List<Map<String,Object>> roles=roleService.queryAllByRoleName(roleName,pageIndex,InfoPage.NUMBER);
		InfoPage page = new InfoPage(roles);
		ModelAndView andView = new ModelAndView();
		andView.addObject("roles", roles);
		andView.addObject("page", page);
		andView.addObject("roleName", roleName);
		andView.setViewName("manage/role_list");
		return andView;
		
		
	}
	
	
	
	
	

	// 进入新增角色页面
	@RequestMapping("/addRoleBefore.action")
	public ModelAndView toaddRoleJSP() {
		ModelAndView andView = new ModelAndView();
		andView.setViewName("manage/role_add");
		return andView;
	}

	// 查询角色表的全部信息(注意，查询回来的数据字段我使用了别名，你要进RoleMapper.xml的id=queryAll语句中查看具体的键的名称)
	@RequestMapping(value = "/queryAllRole.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Map<String, Object>> queryAll() {
		List<Map<String, Object>> roles = roleService.queryAll();
		return roles;
	}

	// 添加角色
	@RequestMapping(value = "/addRole.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String addRole(String roleName, String menus) {
		int result = 0;
		String str = "";
		if (menus.equals("")) {
			str = "3";
			return str;
		} else {
			String[] menusID = menus.split(",");
			int[] menusIds = new int[menusID.length];
			for (int i = 0; i < menusID.length; i++) {
				menusIds[i] = Integer.parseInt(menusID[i]);
			}

			result = roleService.addRole(roleName, menusIds);
		}
		str = result > 0 ? "0" : "1";
		return str;
	}
}

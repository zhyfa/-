package com.great.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.service.MenuService;
import com.great.service.RoleAndMenuService;

@Controller
@RequestMapping("/roleAndMeun")
public class RoleAndMenuAction {
	@Resource 
    private  RoleAndMenuService  roleAndMenuService;
	@Resource 
    private  MenuService  menuService;
	/*1、查询该角色所拥有的权限（t_role_menu表）
	 * 2、查询权限表中所有的权限（t_menu表）
	 * 3、把该角色ID所有的权限增加一个键值对"MENU_STATUS", "true"
	 * */
	@RequestMapping(value="/quaryByID.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Map<String, Object>> quaryByID(HttpServletRequest request,int roleId) {
		List<Map<String, Object>> roleMenu=roleAndMenuService.quaryByID(roleId);
		List<Map<String, Object>> menus=menuService.quaryAll();
		for (int i = 0; i < menus.size(); i++) {
			for (int j = 0; j < roleMenu.size(); j++) {
				if(roleMenu.get(j).get("MENU_ID").equals(menus.get(i).get("MENU_ID"))){
					Map<String, Object> map=menus.get(i);
					map.put("MENU_STATUS", "true");
				}
			}
		}
		request.setAttribute("roleId", roleId);
		return menus;
	}
	/*1、获取更改后的该角色的新的权限
	 * 2、删除中间表中该角色ID的全部权限（真删除）
	 * 3、把获取到的新的权限添加进中间表
	 * 返回的字符串说明：0：修改成功，1：失败，3：角色权限不能为空
	 * */
	
	@RequestMapping(value="/changeRoleMenu.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody String changeRoleMenu(int roleId,String menus ) {
		int result=0;
		String str="" ;
		if(menus.equals("")) {
			//result=roleAndMenuService.delRoleMenu(roleId);
			str="3";
			return str;
		}else {
			String [] menusID=menus.split(",");
			int[] menusIds=new int[menusID.length];
			for (int i = 0; i < menusID.length; i++) {
				menusIds[i]=Integer.parseInt(menusID[i]);
			}
			int[][] data=new int[menusIds.length][2];
			for(int i=0;i<menusIds.length;i++){
				data[i][0]=roleId;
				data[i][1]=menusIds[i];
			}
			result=roleAndMenuService.updateRole(data);
		}
		str = result>0 ? "0" : "1";
		return str;
	}
	
	
	@RequestMapping(value="/quaryAllMenu.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody List<Map<String, Object>> quaryAllMenu(HttpServletRequest request) {
		List<Map<String, Object>> menus=menuService.quaryAll();
		return menus;
	}
	
	
	
	
}

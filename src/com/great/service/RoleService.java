package com.great.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.great.bean.Role;
import com.great.dao.RoleAndMenuMapper;
import com.great.dao.RoleMapper;

@Service
public class RoleService {
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private RoleAndMenuMapper roleAndMenuMapper;

	// 查询全部角色
	public List<Map<String, Object>> queryAll() {
		// TODO Auto-generated method stub
		return roleMapper.queryAll();
	}
	public List<Map<String, Object>> queryAllByRoleName(String roleName,Integer pageIndex,Integer NUMBER){
		PageHelper.startPage(pageIndex,NUMBER);
		return roleMapper.queryAllByRoleName(roleName);
	}

	/*
	 * 增加角色步骤： 1、获取系统表中下一个角色的id 2、把这个id和传入的roleName放入map，调用roleMapper.addRole(map)
	 * 3、获取选中的菜单，把这个id和选中的菜单的值填入中间表
	 */
	@Transactional
	public int addRole(String roleName, int[] menusIds) {
		int result1 = 0;
		int roleId = roleMapper.creatRoleID();
		Map<String, Object> map = new HashMap<>();
		map.put("roleName", roleName);
		map.put("roleId", roleId);
		int result2 = roleMapper.addRole(map);

		int[][] data = new int[menusIds.length][2];
		for (int i = 0; i < menusIds.length; i++) {
			data[i][0] = roleId;
			data[i][1] = menusIds[i];
		}

		for (int i = 0; i < data.length; i++) {
			result1 = roleAndMenuMapper.addRoleMenu(data[i][0], data[i][1]);
		}
		if (result1 > 0 && result2 > 0) {
			return 1;
		}
		return 0;
	};

	// 删除角色，通过角色ID,同时删除中间表中该角色ID的信息（事务）
	@Transactional
	public int delRole(int roleId) {
		int j = roleMapper.delRole(roleId);
		int i = roleAndMenuMapper.delRoleMenu(roleId);
		if (i > 0 && j > 0) {
			return 1;
		}
		return 0;
	}

	// 修改角色名称，通过角色ID
	public int updateRole(Map<String, Object> map) {
		return roleMapper.updateRole(map);
	}

	public String queryById(int roleId) {
		// TODO Auto-generated method stub
		return roleMapper.queryById(roleId);
	}
}

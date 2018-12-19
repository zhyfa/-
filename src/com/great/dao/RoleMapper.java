package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Role;

public interface RoleMapper {
	// 查询全部角色
	public List<Map<String, Object>> queryAll();
	
	// 查询符合条件的全部角色
	public List<Map<String, Object>> queryAllByRoleName(String roleName);

	// 增加角色
	public int addRole(Map<String, Object> map);

	// 删除角色，通过角色ID
	public int delRole(int roleId);

	// 修改角色名称，通过角色ID
	public int updateRole(Map<String, Object> map);

	// 从系统表中获取新增角色的ID
	public int creatRoleID();

	// 通过ID查询角色名
	public String queryById(int roleId);

}

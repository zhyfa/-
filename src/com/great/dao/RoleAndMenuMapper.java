package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


public interface RoleAndMenuMapper {
	//通过ID查询该角色在中间表中的数据
	public List<Map<String, Object>> quaryByID(int roleId);
	//删除该ID的信息
	public int delRoleMenu(int roleId);
	//添加一条中间表信息
	public int addRoleMenu(int roleId,int menuId);
}

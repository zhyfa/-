package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.RoleAndMenuMapper;
@Service
public class RoleAndMenuService {
	@Autowired
	private RoleAndMenuMapper roleAndMenuMapper;
	//通过ID查询该角色在中间表中的数据
	public List<Map<String, Object>> quaryByID(int roleId) {
		// TODO Auto-generated method stub
		return roleAndMenuMapper.quaryByID(roleId);
	}
	
	/*1、删除中间表中该ID的所有信息
	 * 2、循环整形数据的每一行，把每一行第一列的值当做roleId，每一行第二列的值当做menuId添加进中间表
	 * 3、这两步动作当做事务处理
	 * @Transactional(rollbackFor={Exception.class})
	 * */
	@Transactional()
	public int updateRole(int[][] data) {
		// TODO Auto-generated method stub
		int result=0;
		roleAndMenuMapper.delRoleMenu(data[0][0]);
		for (int i = 0; i < data.length; i++) {
			result=roleAndMenuMapper.addRoleMenu(data[i][0],data[i][1]);
		}
		return result;
	}
	//删除该ID的信息
	public int delRoleMenu(int roleId) {
		return roleAndMenuMapper.delRoleMenu(roleId);
	}

}

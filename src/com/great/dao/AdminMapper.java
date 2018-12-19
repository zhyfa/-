package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Admin;
import com.great.bean.Page;
@Repository
public interface AdminMapper {
	//用户登录
	public Admin adminLogin(Admin admin);
	//登录用户修改密码
	public int alterPwd(Admin admin);
	
	//查找所有管理员
	public List<Map<String,Object>> queryalladmin();
	//根据ID查找管理员
	public Map<String,Object> queryadminbyid(int adminid);
	//返回所有的成员的总数
	public int queryCountAdmin();
	//分页查询所有成员
	public List<Map<String,Object>> queryadmin(Page page);
	//更改管理员
	//删除管理员
	public int deleteadmin(int adminid);
	//添加管理员
	public int addadmin(Admin admin);
	//修改管理员
	public int updateadmin(Admin admin);
	//校验名字
	public Map<String,Object> checkname(String adminname);
	
	public List<Map<String, Object>> queryadminbysome(Map<String, Object> map);
	//妯＄硦鎼滅储鍒嗛〉
	public int queryCountAdminbysome(Map<String, Object> map);
}

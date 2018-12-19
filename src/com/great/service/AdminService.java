package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.bean.Admin;
import com.great.bean.Page;
import com.great.dao.AdminMapper;

@Service  
@Transactional //事务
public class AdminService{
	@Autowired
	private AdminMapper adminMapper;

	//登录
	public Admin adminLogin(Admin admin) {
		return adminMapper.adminLogin(admin);
	}
	//修改密码
	public int alterPwd(Admin admin) {
		return adminMapper.alterPwd(admin);
	}
	//查询所有成员
		public List<Map<String, Object>> queryalladmin() {
			// TODO Auto-generated method stub
			return adminMapper.queryalladmin();
		}
		//根据ID查询成员
		public Map<String, Object> queryadminbyid(int adminid) {
			return adminMapper.queryadminbyid(adminid);
		}

		//查询总人数
		public int queryCountAdmin() {
			return adminMapper.queryCountAdmin();
		}
		//分页查询所有成员
		public List<Map<String, Object>> queryadmin(Page page) {
			return adminMapper.queryadmin(page);
		}
		//删除admin
		public int deleteadmin(int adminid) {
			return adminMapper.deleteadmin(adminid);
		}
		
		//添加管理员
		public int addadmin(Admin admin) {
			System.out.println("~~~~"+admin+"admin__");
			return adminMapper.addadmin(admin);
		}
		public int updateadmin(Admin admin) {
			return adminMapper.updateadmin(admin);
		}

		public Map<String, Object> checkname(String adminname) {
			// TODO Auto-generated method stub
			return adminMapper.checkname(adminname);
		}
		
		//妯＄硦鎼滅储
		public List<Map<String, Object>> queryadminbysome(Map<String, Object> map) {
			// TODO Auto-generated method stub
			return adminMapper.queryadminbysome(map);
		}
		//妯＄硦鎼滅储鍒嗛〉
		public int queryCountAdminbysome(Map<String, Object> map) {
			// TODO Auto-generated method stub
			return adminMapper.queryCountAdminbysome(map);
		}
}

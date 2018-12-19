package com.great.bean;

import java.sql.Date;
import java.util.List;

public class Admin {

	private Integer role_id;// role_id number,--角色ID
	private Integer admin_id;//admin_id number,--管理员ID
	private String admin_name;//admin_name;// varchar2(20),--管理员名称
	private String admin_pwd;//admin_pwd ;//varchar2(20),--管理员密码
	private Integer admin_state;//admin_state number default 1,--该管理员状态（1：正常、2：删除）
	private Date admin_cdate;//admin_cdate date--该管理员创建时间
	
	
	private String role_name;  //角色名字
	List<Menu> menus;          //该角色父级菜单
	
	
	public List<Menu> getMenus() {
		return menus;
	}
	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	public Integer getAdmin_state() {
		return admin_state;
	}
	public void setAdmin_state(Integer admin_state) {
		this.admin_state = admin_state;
	}
	public Date getAdmin_cdate() {
		return admin_cdate;
	}
	public void setAdmin_cdate(Date admin_cdate) {
		this.admin_cdate = admin_cdate;
	}
	
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	@Override
	public String toString() {
		return "Admin [role_id=" + role_id + ", admin_id=" + admin_id + ", admin_name=" + admin_name + ", admin_pwd="
				+ admin_pwd + ", admin_state=" + admin_state + ", admin_cdate=" + admin_cdate + "]";
	}
	
	
	
	
}

package com.great.bean;

public class RoleMenu {
	private Integer role_id;// number(10),--角色id
	private Integer menu_id;// number(10)--角色名称
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public Integer getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(Integer menu_id) {
		this.menu_id = menu_id;
	}
	@Override
	public String toString() {
		return "RoleMenu [role_id=" + role_id + ", menu_id=" + menu_id + "]";
	}
	
	
}

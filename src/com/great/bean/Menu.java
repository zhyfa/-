package com.great.bean;

import java.util.List;

public class Menu {
	private Integer menu_id;// number(10) primary key,--菜单ID
	private String menu_name;//  varchar2(50),--菜单名
	private Integer f_menu_id;// number(10),--菜单的上一级
	private String menu_con;// varchar2(200)--菜单链接
	
	List<Menu> menuChilds;
	
	
	public List<Menu> getMenuChilds() {
		return menuChilds;
	}
	public void setMenuChilds(List<Menu> menuChilds) {
		this.menuChilds = menuChilds;
	}
	public Integer getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(Integer menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public Integer getF_menu_id() {
		return f_menu_id;
	}
	public void setF_menu_id(Integer f_menu_id) {
		this.f_menu_id = f_menu_id;
	}
	public String getMenu_con() {
		return menu_con;
	}
	public void setMenu_con(String menu_con) {
		this.menu_con = menu_con;
	}
	@Override
	public String toString() {
		return "Menu [menu_id=" + menu_id + ", menu_name=" + menu_name + ", f_menu_id=" + f_menu_id + ", menu_con="
				+ menu_con + "]";
	}
	
	
}

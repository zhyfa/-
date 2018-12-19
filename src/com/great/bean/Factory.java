package com.great.bean;

public class Factory {
	private Integer factory_id;// number(20) primary key ,--工厂ID
	private String factory_name;// varchar2(50)--工厂名字
	public Integer getFactory_id() {
		return factory_id;
	}
	public void setFactory_id(Integer factory_id) {
		this.factory_id = factory_id;
	}
	public String getFactory_name() {
		return factory_name;
	}
	public void setFactory_name(String factory_name) {
		this.factory_name = factory_name;
	}
	@Override
	public String toString() {
		return "Factory [factory_id=" + factory_id + ", factory_name=" + factory_name + "]";
	}
	
}

package com.great.bean;

public class Parameter {
	private Integer parameter_id;// number(20) primary key   ,--参数ID
	private String parameter_name;// varchar2(20),--参数名
	private String parameter_type ;//number(20),--参数类型
	private Integer parameter_value;// number(20)--参数值
	public Integer getParameter_id() {
		return parameter_id;
	}
	public void setParameter_id(Integer parameter_id) {
		this.parameter_id = parameter_id;
	}
	public String getParameter_name() {
		return parameter_name;
	}
	public void setParameter_name(String parameter_name) {
		this.parameter_name = parameter_name;
	}
	
	public String getParameter_type() {
		return parameter_type;
	}
	public void setParameter_type(String parameter_type) {
		this.parameter_type = parameter_type;
	}
	public Integer getParameter_value() {
		return parameter_value;
	}
	public void setParameter_value(Integer parameter_value) {
		this.parameter_value = parameter_value;
	}
	@Override
	public String toString() {
		return "Parameter [parameter_id=" + parameter_id + ", parameter_name=" + parameter_name + ", parameter_type="
				+ parameter_type + ", parameter_value=" + parameter_value + "]";
	}
	
	
}

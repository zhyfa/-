package com.great.bean;

public class Stock {
	private Integer stock_id;// number(20) primary key not null,--库存ID
	private Integer drug_id;// number(20) ,--药品ID
	private Integer stock_number;// number(20),--库存数量

	private Integer state;// number(20) default 1,--状态
	private String cdete;// date default sysdate ,--日期
	private Integer admin_id;// number--用户ID

	private String drug_name;// 药品名字
	private String parameter_name;// 状态名字

	private Integer stock_min;// number,--药库最少库存，

	private String  msg;//警报信息
	
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getStock_min() {
		return stock_min;
	}

	public void setStock_min(Integer stock_min) {
		this.stock_min = stock_min;
	}

	public String getDrug_name() {
		return drug_name;
	}

	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}

	public String getParameter_name() {
		return parameter_name;
	}

	public void setParameter_name(String parameter_name) {
		this.parameter_name = parameter_name;
	}

	public Integer getStock_id() {
		return stock_id;
	}

	public void setStock_id(Integer stock_id) {
		this.stock_id = stock_id;
	}

	public Integer getDrug_id() {
		return drug_id;
	}

	public void setDrug_id(Integer drug_id) {
		this.drug_id = drug_id;
	}

	public Integer getStock_number() {
		return stock_number;
	}

	public void setStock_number(Integer stock_number) {
		this.stock_number = stock_number;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getCdete() {
		return cdete;
	}

	public void setCdete(String cdete) {
		this.cdete = cdete;
	}

	public Integer getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}

	@Override
	public String toString() {
		return "Stock [stock_id=" + stock_id + ", drug_id=" + drug_id + ", stock_number=" + stock_number + ", state="
				+ state + ", cdete=" + cdete + ", admin_id=" + admin_id + ", drug_name=" + drug_name
				+ ", parameter_name=" + parameter_name + ", stock_min=" + stock_min + ", msg=" + msg + "]";
	}

	
	

}

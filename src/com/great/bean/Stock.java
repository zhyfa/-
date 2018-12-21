package com.great.bean;

public class Stock {
	private Integer stock_id;// number(20) primary key not null,--库存ID
	private Integer drug_id;// number(20) ,--药品ID
	private Integer stock_number;// number(20),--库存数量
	private Integer state;// number(20) default 1,--状态
	private String cdate;// date default sysdate ,--日期
	private Integer admin_id;// number--用户ID
	private Integer factory_id;// number --工厂ID

	private String drug_name;// 药品名字
	private int spec;//--规格 1:盒  2：瓶
	private String parameter_name;// 状态名字
	private Integer stock_min;// number,--药库最少库存，
	private String  msg;//警报信息
	private String factory_name;//工厂名字
	private String admin_name;//操作人
	
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

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public int getSpec() {
		return spec;
	}

	public void setSpec(int spec) {
		this.spec = spec;
	}

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

	

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
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
				+ state + ", cdate=" + cdate + ", admin_id=" + admin_id + ", factory_id=" + factory_id + ", drug_name="
				+ drug_name + ", spec=" + spec + ", parameter_name=" + parameter_name + ", stock_min=" + stock_min
				+ ", msg=" + msg + ", factory_name=" + factory_name + ", admin_name=" + admin_name + "]";
	}

	

	

	

	
	

}

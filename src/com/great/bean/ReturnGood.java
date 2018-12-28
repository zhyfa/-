package com.great.bean;

public class ReturnGood {
	private Integer stock_id ;//number(20),--库存ID
	private Integer drug_id  ;//number(20) ,--药品ID
	private Integer stock_number  ;//number(20),--药品数量drug_id number,--药品ID//pharmary_number number,--药品数量
	private String  return_date ;// date --退药日期
	private String  birthday ;//生产日期
	private String  cdate ;//入库日期
	private Integer factory_id;//工厂id
	private Integer state;//工厂id
	
	private String  drug_name ;//药品名称
	private String  admin_name ;//添加药库的人员
	private String  factory_name;//工厂名称
	private String  parameter_name;//工厂名称
	@Override
	public String toString() {
		return "ReturnGood [stock_id=" + stock_id + ", drug_id=" + drug_id + ", stock_number=" + stock_number
				+ ", return_date=" + return_date + ", birthday=" + birthday + ", cdate=" + cdate + ", drug_name="
				+ drug_name + ", admin_name=" + admin_name + ", factory_name=" + factory_name + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	public ReturnGood(Integer stock_id, Integer drug_id, Integer stock_number, String return_date, String birthday,
			String cdate, String drug_name, String admin_name, String factory_name) {
		super();
		this.stock_id = stock_id;
		this.drug_id = drug_id;
		this.stock_number = stock_number;
		this.return_date = return_date;
		this.birthday = birthday;
		this.cdate = cdate;
		this.drug_name = drug_name;
		this.admin_name = admin_name;
		this.factory_name = factory_name;
	}
	
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getParameter_name() {
		return parameter_name;
	}
	public void setParameter_name(String parameter_name) {
		this.parameter_name = parameter_name;
	}
	public Integer getFactory_id() {
		return factory_id;
	}
	public void setFactory_id(Integer factory_id) {
		this.factory_id = factory_id;
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
	public String getReturn_date() {
		return return_date;
	}
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getDrug_name() {
		return drug_name;
	}
	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getFactory_name() {
		return factory_name;
	}
	public void setFactory_name(String factory_name) {
		this.factory_name = factory_name;
	}
	public ReturnGood() {
		super();
	}
	
	
}

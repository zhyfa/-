package com.great.bean;

public class Purchase {
	private Integer purchase_id ;//number(20) primary key  ,--采购id
	private Integer pharmary_id;// number(20) ,--药品ID
	private Integer pharmary_cost;// number(20),--药品成本价
	private Integer pharmary_number;// number(20),--进货数量
	private Integer pharmary_total;// number(20),--进货总价
	private String production_date;// date ,--生产日期
	private String batch_number;// varchar2(40),--进货批号
	private String purchase_date ;//date,--进货日期
	private Integer factory_id;// number(20),--工厂ID
	private Integer admin_id;// number(20)
	public Integer getPurchase_id() {
		return purchase_id;
	}
	public void setPurchase_id(Integer purchase_id) {
		this.purchase_id = purchase_id;
	}
	public Integer getPharmary_id() {
		return pharmary_id;
	}
	public void setPharmary_id(Integer pharmary_id) {
		this.pharmary_id = pharmary_id;
	}
	public Integer getPharmary_cost() {
		return pharmary_cost;
	}
	public void setPharmary_cost(Integer pharmary_cost) {
		this.pharmary_cost = pharmary_cost;
	}
	public Integer getPharmary_number() {
		return pharmary_number;
	}
	public void setPharmary_number(Integer pharmary_number) {
		this.pharmary_number = pharmary_number;
	}
	public Integer getPharmary_total() {
		return pharmary_total;
	}
	public void setPharmary_total(Integer pharmary_total) {
		this.pharmary_total = pharmary_total;
	}
	public String getProduction_date() {
		return production_date;
	}
	public void setProduction_date(String production_date) {
		this.production_date = production_date;
	}
	public String getBatch_number() {
		return batch_number;
	}
	public void setBatch_number(String batch_number) {
		this.batch_number = batch_number;
	}
	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
	public Integer getFactory_id() {
		return factory_id;
	}
	public void setFactory_id(Integer factory_id) {
		this.factory_id = factory_id;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	@Override
	public String toString() {
		return "Purchase [purchase_id=" + purchase_id + ", pharmary_id=" + pharmary_id + ", pharmary_cost="
				+ pharmary_cost + ", pharmary_number=" + pharmary_number + ", pharmary_total=" + pharmary_total
				+ ", production_date=" + production_date + ", batch_number=" + batch_number + ", purchase_date="
				+ purchase_date + ", factory_id=" + factory_id + ", admin_id=" + admin_id + "]";
	}
	
	
}

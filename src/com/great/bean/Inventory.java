package com.great.bean;

public class Inventory {
	private Integer inventory_id;// number  primary key,--药房库存id
	private Integer pharmacy_id;//  number,--药品id
	private String production_date ;// date,--生产日期
	private Integer minimum_inventory;//  number,--最少库存
	private Integer admin_id;//  number,--操作人
	private Integer state;//  number default 1,--状态
	private String cdate;//  date default sysdate--创建日期
	public Integer getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(Integer inventory_id) {
		this.inventory_id = inventory_id;
	}
	public Integer getPharmacy_id() {
		return pharmacy_id;
	}
	public void setPharmacy_id(Integer pharmacy_id) {
		this.pharmacy_id = pharmacy_id;
	}
	public String getProduction_date() {
		return production_date;
	}
	public void setProduction_date(String production_date) {
		this.production_date = production_date;
	}
	public Integer getMinimum_inventory() {
		return minimum_inventory;
	}
	public void setMinimum_inventory(Integer minimum_inventory) {
		this.minimum_inventory = minimum_inventory;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
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
	@Override
	public String toString() {
		return "Inventory [inventory_id=" + inventory_id + ", pharmacy_id=" + pharmacy_id + ", production_date="
				+ production_date + ", minimum_inventory=" + minimum_inventory + ", admin_id=" + admin_id + ", state="
				+ state + ", cdate=" + cdate + "]";
	}
	
	
}

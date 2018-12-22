package com.great.bean;

import java.sql.Date;

/**
 * 过期bean
 * @author 蒋亚福
 *
 */
public class Overdue {

	private Integer inventory_id;//药房库存id
	private Integer drug_id;//药品id
	private String drug_name;//药品名字
	private Date production_date;//生产日期
	private Integer irradiated;//保质期 （月）
	private Date nowDate;//生产日期 + 保质期
	
	private String msg;//过期标志
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(Integer inventory_id) {
		this.inventory_id = inventory_id;
	}
	public Integer getDrug_id() {
		return drug_id;
	}
	public void setDrug_id(Integer drug_id) {
		this.drug_id = drug_id;
	}
	public String getDrug_name() {
		return drug_name;
	}
	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}
	public Date getProduction_date() {
		return production_date;
	}
	public void setProduction_date(Date production_date) {
		this.production_date = production_date;
	}
	public Date getNowDate() {
		return nowDate;
	}
	public void setNowDate(Date nowDate) {
		this.nowDate = nowDate;
	}
	public Integer getIrradiated() {
		return irradiated;
	}
	public void setIrradiated(Integer irradiated) {
		this.irradiated = irradiated;
	}
	@Override
	public String toString() {
		return "Overdue [inventory_id=" + inventory_id + ", drug_id=" + drug_id + ", drug_name=" + drug_name
				+ ", production_date=" + production_date + ", irradiated=" + irradiated + ", nowDate=" + nowDate
				+ ", msg=" + msg + "]";
	}
	
	
	
	
}

package com.great.bean;
//药房盘点表
public class Check {
	private String drug_name;//药品名字
	private Integer system_quantity;//系统数量
	private String production_date;//生产批号
	private Integer real_quantity;//盘点实际数量
	private Integer difference;//差异数额
	public String getDrug_name() {
		return drug_name;
	}
	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}
	public Integer getSystem_quantity() {
		return system_quantity;
	}
	public void setSystem_quantity(Integer system_quantity) {
		this.system_quantity = system_quantity;
	}
	public Integer getReal_quantity() {
		return real_quantity;
	}
	public void setReal_quantity(Integer real_quantity) {
		this.real_quantity = real_quantity;
	}
	public Integer getDifference() {
		return difference;
	}
	public void setDifference(Integer difference) {
		this.difference = difference;
	}
	public String getProduction_date() {
		return production_date;
	}
	public void setProduction_date(String production_date) {
		this.production_date = production_date;
	}
	
	
}

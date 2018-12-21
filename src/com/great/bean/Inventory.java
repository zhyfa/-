package com.great.bean;

public class Inventory {
	private Integer inventory_id;// number  primary key,--药房库存id
	private Integer drug_id;//  number,--药品id
	private String production_date ;// date,--生产日期
	private Integer inventory_number;// number,--药房药品数量
	private Integer admin_id;//  number,--操作人
	private Integer state;//  number default 1,--状态
	private String cdate;//  date default sysdate--创建日期
	
	private String drug_name;//药品名字
	private String admin_name;//操作人
	private String parameter_name;//参数名字
	private int spec;//单位
	private String shiji;//导出excel时预留实际数量的列
	private String beizhu;//导出excel时预留备注的列
	
	public int getSpec() {
		return spec;
	}
	public void setSpec(int spec) {
		this.spec = spec;
	}
	public Integer getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(Integer inventory_id) {
		this.inventory_id = inventory_id;
	}
	
	public String getProduction_date() {
		return production_date;
	}
	public void setProduction_date(String production_date) {
		this.production_date = production_date;
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
	public Integer getInventory_number() {
		return inventory_number;
	}
	public void setInventory_number(Integer inventory_number) {
		this.inventory_number = inventory_number;
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
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getParameter_name() {
		return parameter_name;
	}
	public void setParameter_name(String parameter_name) {
		this.parameter_name = parameter_name;
	}
	@Override
	public String toString() {
		return "Inventory [inventory_id=" + inventory_id + ", drug_id=" + drug_id + ", production_date="
				+ production_date + ", inventory_number=" + inventory_number + ", admin_id=" + admin_id + ", state="
				+ state + ", cdate=" + cdate + ", drug_name=" + drug_name + ", admin_name=" + admin_name
				+ ", parameter_name=" + parameter_name + ", spec=" + spec + "]";
	}
	public String getShiji() {
		return shiji;
	}
	public void setShiji(String shiji) {
		this.shiji = shiji;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	
	
	
	
	
}

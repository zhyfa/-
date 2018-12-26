package com.great.bean;

public class PharmacyReturn {
	private Integer pharmacy_return_id;//主键 id
	private Integer admin_id;// number,--药房人员ID
	private Integer inventory_id ;//number,--药房库存id
	private Integer drug_id;// number,--药品ID
	private Integer drug_number;// number,--数量
	private String birthday;// varchar2(50),--药品生产日期
	private String illustrate;//退药说明
	private Integer state;// number default 1,--状态1、退药申请，2.同意退药  3、驳回申请  3
	private String cdate;// date default sysdate
	
	private String admin_name;
	private String drug_name;
	private String parameter_name;
	
	
	public String getIllustrate() {
		return illustrate;
	}
	public void setIllustrate(String illustrate) {
		this.illustrate = illustrate;
	}
	public Integer getPharmacy_return_id() {
		return pharmacy_return_id;
	}
	public void setPharmacy_return_id(Integer pharmacy_return_id) {
		this.pharmacy_return_id = pharmacy_return_id;
	}
	public String getParameter_name() {
		return parameter_name;
	}
	public void setParameter_name(String parameter_name) {
		this.parameter_name = parameter_name;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getDrug_name() {
		return drug_name;
	}
	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}
	public Integer getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(Integer inventory_id) {
		this.inventory_id = inventory_id;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public Integer getDrug_id() {
		return drug_id;
	}
	public void setDrug_id(Integer drug_id) {
		this.drug_id = drug_id;
	}
	public Integer getDrug_number() {
		return drug_number;
	}
	public void setDrug_number(Integer drug_number) {
		this.drug_number = drug_number;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
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
		return "PharmacyReturn [admin_id=" + admin_id + ", drug_id=" + drug_id + ", drug_number=" + drug_number
				+ ", birthday=" + birthday + ", state=" + state + ", cdate=" + cdate + "]";
	}
	
	
}

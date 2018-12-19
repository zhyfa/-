package com.great.bean;

public class Reimburse {
	private Integer reimburse_id;// number primary key,--报损id
	private Integer inventory_id;//  number,--药房库存id
	private Integer pharmacy_id;//  number,--药品id
	private Integer admin_id;//  number,--操作人
	private Integer reimburse_num;//  number,--报损数量
	private String illustrate;//  varchar2(40),--报损说明
	private Integer state;//  number default 1, --状态
	private String cdate;//  date default sysdate
	public Integer getReimburse_id() {
		return reimburse_id;
	}
	public void setReimburse_id(Integer reimburse_id) {
		this.reimburse_id = reimburse_id;
	}
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
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public Integer getReimburse_num() {
		return reimburse_num;
	}
	public void setReimburse_num(Integer reimburse_num) {
		this.reimburse_num = reimburse_num;
	}
	public String getIllustrate() {
		return illustrate;
	}
	public void setIllustrate(String illustrate) {
		this.illustrate = illustrate;
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
		return "Reimburse [reimburse_id=" + reimburse_id + ", inventory_id=" + inventory_id + ", pharmacy_id="
				+ pharmacy_id + ", admin_id=" + admin_id + ", reimburse_num=" + reimburse_num + ", illustrate="
				+ illustrate + ", state=" + state + ", cdate=" + cdate + "]";
	}
	
	
}

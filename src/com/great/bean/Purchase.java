package com.great.bean;

public class Purchase {
	private String auditsdetail_id ;//number(20) primary key  ,--采购id
	private Integer pharmary_number;// number(20),--采购的总量
	private String pharmary_total;// number(20),--进货总价
	private String purchase_date;// date ,--审批表提交时间
	private String check_date;//--采购表审批时间
	private String finish_date;//--采购单完成时间
	private String batch_number;// varchar2(40),--进货批号
	private Integer admin_id;// number(20)
	private Integer stat;
	public Purchase() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getAuditsdetail_id() {
		return auditsdetail_id;
	}
	public void setAuditsdetail_id(String auditsdetail_id) {
		this.auditsdetail_id = auditsdetail_id;
	}
	public Integer getPharmary_number() {
		return pharmary_number;
	}
	public void setPharmary_number(Integer pharmary_number) {
		this.pharmary_number = pharmary_number;
	}
	public String getPharmary_total() {
		return pharmary_total;
	}
	public void setPharmary_total(String pharmary_total) {
		this.pharmary_total = pharmary_total;
	}
	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
	public String getCheck_date() {
		return check_date;
	}
	public void setCheck_date(String check_date) {
		this.check_date = check_date;
	}
	public String getFinish_date() {
		return finish_date;
	}
	public void setFinish_date(String finish_date) {
		this.finish_date = finish_date;
	}
	public String getBatch_number() {
		return batch_number;
	}
	public void setBatch_number(String batch_number) {
		this.batch_number = batch_number;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public Integer getStat() {
		return stat;
	}
	public void setStat(Integer stat) {
		this.stat = stat;
	}
	@Override
	public String toString() {
		return "Purchase [auditsdetail_id=" + auditsdetail_id + ", pharmary_number=" + pharmary_number
				+ ", pharmary_total=" + pharmary_total + ", purchase_date=" + purchase_date + ", check_date="
				+ check_date + ", finish_date=" + finish_date + ", batch_number=" + batch_number + ", admin_id="
				+ admin_id + ", stat=" + stat + "]";
	}
	public Purchase(String auditsdetail_id, Integer pharmary_number, String pharmary_total, String purchase_date,
			String check_date, String finish_date, String batch_number, Integer admin_id, Integer stat) {
		super();
		this.auditsdetail_id = auditsdetail_id;
		this.pharmary_number = pharmary_number;
		this.pharmary_total = pharmary_total;
		this.purchase_date = purchase_date;
		this.check_date = check_date;
		this.finish_date = finish_date;
		this.batch_number = batch_number;
		this.admin_id = admin_id;
		this.stat = stat;
	}
	
}
	
package com.great.bean;

public class t_storgeapply {
	private String storge_id;
	private Integer storge_total;
	private Integer drugtype_total;
	private String storge_date;
	private String check_date;
	private String submit_date;
	private Integer admin_id;
	private Integer stat;
	public t_storgeapply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public t_storgeapply(String storge_id, Integer storge_total, Integer drugtype_total, String storge_date,
			String check_date, String submit_date, Integer admin_id, Integer stat) {
		super();
		this.storge_id = storge_id;
		this.storge_total = storge_total;
		this.drugtype_total = drugtype_total;
		this.storge_date = storge_date;
		this.check_date = check_date;
		this.submit_date = submit_date;
		this.admin_id = admin_id;
		this.stat = stat;
	}
	public String getStorge_id() {
		return storge_id;
	}
	public void setStorge_id(String storge_id) {
		this.storge_id = storge_id;
	}
	public Integer getStorge_total() {
		return storge_total;
	}
	public void setStorge_total(Integer storge_total) {
		this.storge_total = storge_total;
	}
	public Integer getDrugtype_total() {
		return drugtype_total;
	}
	public void setDrugtype_total(Integer drugtype_total) {
		this.drugtype_total = drugtype_total;
	}
	public String getStorge_date() {
		return storge_date;
	}
	public void setStorge_date(String storge_date) {
		this.storge_date = storge_date;
	}
	public String getCheck_date() {
		return check_date;
	}
	public void setCheck_date(String check_date) {
		this.check_date = check_date;
	}
	public String getSubmit_date() {
		return submit_date;
	}
	public void setSubmit_date(String submit_date) {
		this.submit_date = submit_date;
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
		return "t_storgeapply [storge_id=" + storge_id + ", storge_total=" + storge_total + ", drugtype_total="
				+ drugtype_total + ", storge_date=" + storge_date + ", check_date=" + check_date + ", submit_date="
				+ submit_date + ", admin_id=" + admin_id + ", stat=" + stat + "]";
	}

}

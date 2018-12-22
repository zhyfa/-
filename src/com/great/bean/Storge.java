package com.great.bean;

public class Storge {
	private String storge_id;
	private String auditsdetail_id;//采购单id
	private Integer admin_id;//管理员id
	private Integer  drug_id;//入库药品id
	private String drug_name;//入库药品名称
	private Integer storge_number;//入库数量
	private String factory_name;//生产厂家
	private Integer production_date;//生产日期
	private String production_id;//生产批号
	private Integer storge_date;//入库时间
	private Integer submit_date;//入库单提交时间
	private Integer stat;//状态
	public Storge() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "Storge [storge_id=" + storge_id + ", auditsdetail_id=" + auditsdetail_id + ", admin_id=" + admin_id
				+ ", drug_id=" + drug_id + ", drug_name=" + drug_name + ", storge_number=" + storge_number
				+ ", factory_name=" + factory_name + ", production_date=" + production_date + ", production_id="
				+ production_id + ", storge_date=" + storge_date + ", submit_date=" + submit_date + ", stat=" + stat
				+ "]";
	}

	public Storge(String storge_id, String auditsdetail_id, Integer admin_id, Integer drug_id, String drug_name,
			Integer storge_number, String factory_name, Integer production_date, String production_id,
			Integer storge_date, Integer submit_date, Integer stat) {
		super();
		this.storge_id = storge_id;
		this.auditsdetail_id = auditsdetail_id;
		this.admin_id = admin_id;
		this.drug_id = drug_id;
		this.drug_name = drug_name;
		this.storge_number = storge_number;
		this.factory_name = factory_name;
		this.production_date = production_date;
		this.production_id = production_id;
		this.storge_date = storge_date;
		this.submit_date = submit_date;
		this.stat = stat;
	}

	public String getAuditsdetail_id() {
		return auditsdetail_id;
	}
	public void setAuditsdetail_id(String auditsdetail_id) {
		this.auditsdetail_id = auditsdetail_id;
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
	public String getDrug_name() {
		return drug_name;
	}
	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}
	public Integer getStorge_number() {
		return storge_number;
	}
	public void setStorge_number(Integer storge_number) {
		this.storge_number = storge_number;
	}
	public String getFactory_name() {
		return factory_name;
	}
	public void setFactory_name(String factory_name) {
		this.factory_name = factory_name;
	}
	public Integer getProduction_date() {
		return production_date;
	}
	public void setProduction_date(Integer production_date) {
		this.production_date = production_date;
	}
	public String getProduction_id() {
		return production_id;
	}
	public void setProduction_id(String production_id) {
		this.production_id = production_id;
	}
	public Integer getStorge_date() {
		return storge_date;
	}
	public void setStorge_date(Integer storge_date) {
		this.storge_date = storge_date;
	}
	public Integer getSubmit_date() {
		return submit_date;
	}
	public void setSubmit_date(Integer submit_date) {
		this.submit_date = submit_date;
	}
	public Integer getStat() {
		return stat;
	}
	public void setStat(Integer stat) {
		this.stat = stat;
	}

	public String getStorge_id() {
		return storge_id;
	}

	public void setStorge_id(String storge_id) {
		this.storge_id = storge_id;
	}
	
	
}

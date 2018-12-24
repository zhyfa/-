package com.great.bean;

public class Storge {
	private Integer storgedetail_id;//明细序号
	private String storge_id;
	private String auditsdetail_id;//采购单id
	private Integer plantobuy_number;//采购数量
	private Integer admin_id;//管理员id
	private Integer  drug_id;//入库药品id
	private String drug_name;//入库药品名称
	private Integer storge_number;//入库数量
	private Integer real_storgeno;//实际入库数量
	private String reasonfor_varity;//出现误差的原因
	private String notes;//备注
	private String factory_name;//生产厂家
	private Integer production_date;//生产日期
	private String production_id;//生产批号
	private String storge_date;//入库时间
	private String submit_date;//入库单提交时间
	private String cdate;//入库单创建时间
	private Integer stat;//状态
	public Storge() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Storge(Integer storgedetail_id, String storge_id, String auditsdetail_id, Integer plantobuy_number,
			Integer admin_id, Integer drug_id, String drug_name, Integer storge_number, Integer real_storgeno,
			String reasonfor_varity, String notes, String factory_name, Integer production_date, String production_id,
			String storge_date, String submit_date, String cdate, Integer stat) {
		super();
		this.storgedetail_id = storgedetail_id;
		this.storge_id = storge_id;
		this.auditsdetail_id = auditsdetail_id;
		this.plantobuy_number = plantobuy_number;
		this.admin_id = admin_id;
		this.drug_id = drug_id;
		this.drug_name = drug_name;
		this.storge_number = storge_number;
		this.real_storgeno = real_storgeno;
		this.reasonfor_varity = reasonfor_varity;
		this.notes = notes;
		this.factory_name = factory_name;
		this.production_date = production_date;
		this.production_id = production_id;
		this.storge_date = storge_date;
		this.submit_date = submit_date;
		this.cdate = cdate;
		this.stat = stat;
	}

	@Override
	public String toString() {
		return "Storge [storgedetail_id=" + storgedetail_id + ", storge_id=" + storge_id + ", auditsdetail_id="
				+ auditsdetail_id + ", plantobuy_number=" + plantobuy_number + ", admin_id=" + admin_id + ", drug_id="
				+ drug_id + ", drug_name=" + drug_name + ", storge_number=" + storge_number + ", real_storgeno="
				+ real_storgeno + ", reasonfor_varity=" + reasonfor_varity + ", notes=" + notes + ", factory_name="
				+ factory_name + ", production_date=" + production_date + ", production_id=" + production_id
				+ ", storge_date=" + storge_date + ", submit_date=" + submit_date + ", cdate=" + cdate + ", stat="
				+ stat + "]";
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

	public Integer getPlantobuy_number() {
		return plantobuy_number;
	}

	public void setPlantobuy_number(Integer plantobuy_number) {
		this.plantobuy_number = plantobuy_number;
	}

	public Integer getReal_storgeno() {
		return real_storgeno;
	}

	public void setReal_storgeno(Integer real_storgeno) {
		this.real_storgeno = real_storgeno;
	}
	public String getReasonfor_varity() {
		return reasonfor_varity;
	}

	public void setReasonfor_varity(String reasonfor_varity) {
		this.reasonfor_varity = reasonfor_varity;
	}



	public String getNotes() {
		return notes;
	}

	public Integer getStorgedetail_id() {
		return storgedetail_id;
	}

	public void setStorgedetail_id(Integer storgedetail_id) {
		this.storgedetail_id = storgedetail_id;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getStorge_date() {
		return storge_date;
	}

	public void setStorge_date(String storge_date) {
		this.storge_date = storge_date;
	}

	public String getSubmit_date() {
		return submit_date;
	}

	public void setSubmit_date(String submit_date) {
		this.submit_date = submit_date;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	
	
}

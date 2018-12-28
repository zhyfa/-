package com.great.bean;

import java.io.Serializable;

public class AuditsDetail implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String auditsdetail_id;//审核表id
	private Integer drug_id;//药品id
	private String drug_name;//
	private String psycho;
	private String drug_type;
	private String spec;
	private String drug_unit;
	private Integer per_piece;
	private Integer price;
	private String sicks;
	private String factory;
	private Integer total;
	private String irradiated;
	private Integer admin_id;
	private String admin_name;
	private String total_price;
	private String cdate;
	private Integer stat;
	private Integer stock_num;//入库总量
	private String stock_date;//最后入库时间
	public AuditsDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuditsDetail(String auditsdetail_id, Integer drug_id, String drug_name, String psycho, String drug_type,
			String spec, String drug_unit, Integer per_piece, Integer price, String sicks, String factory,
			Integer total, String irradiated, Integer admin_id, String admin_name, String total_price, String cdate,
			Integer stat, Integer stock_num, String stock_date) {
		super();
		this.auditsdetail_id = auditsdetail_id;
		this.drug_id = drug_id;
		this.drug_name = drug_name;
		this.psycho = psycho;
		this.drug_type = drug_type;
		this.spec = spec;
		this.drug_unit = drug_unit;
		this.per_piece = per_piece;
		this.price = price;
		this.sicks = sicks;
		this.factory = factory;
		this.total = total;
		this.irradiated = irradiated;
		this.admin_id = admin_id;
		this.admin_name = admin_name;
		this.total_price = total_price;
		this.cdate = cdate;
		this.stat = stat;
		this.stock_num = stock_num;
		this.stock_date = stock_date;
	}
	public String getAuditsdetail_id() {
		return auditsdetail_id;
	}
	public void setAuditsdetail_id(String auditsdetail_id) {
		this.auditsdetail_id = auditsdetail_id;
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
	public String getPsycho() {
		return psycho;
	}
	public void setPsycho(String psycho) {
		this.psycho = psycho;
	}
	public String getDrug_type() {
		return drug_type;
	}
	public void setDrug_type(String drug_type) {
		this.drug_type = drug_type;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getDrug_unit() {
		return drug_unit;
	}
	public void setDrug_unit(String drug_unit) {
		this.drug_unit = drug_unit;
	}
	public Integer getPer_piece() {
		return per_piece;
	}
	public void setPer_piece(Integer per_piece) {
		this.per_piece = per_piece;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getSicks() {
		return sicks;
	}
	public void setSicks(String sicks) {
		this.sicks = sicks;
	}
	public String getFactory() {
		return factory;
	}
	public void setFactory(String factory) {
		this.factory = factory;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public String getIrradiated() {
		return irradiated;
	}
	public void setIrradiated(String irradiated) {
		this.irradiated = irradiated;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public Integer getStat() {
		return stat;
	}
	public void setStat(Integer stat) {
		this.stat = stat;
	}
	public Integer getStock_num() {
		return stock_num;
	}
	public void setStock_num(Integer stock_num) {
		this.stock_num = stock_num;
	}
	public String getStock_date() {
		return stock_date;
	}
	public void setStock_date(String stock_date) {
		this.stock_date = stock_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "AuditsDetail [auditsdetail_id=" + auditsdetail_id + ", drug_id=" + drug_id + ", drug_name=" + drug_name
				+ ", psycho=" + psycho + ", drug_type=" + drug_type + ", spec=" + spec + ", drug_unit=" + drug_unit
				+ ", per_piece=" + per_piece + ", price=" + price + ", sicks=" + sicks + ", factory=" + factory
				+ ", total=" + total + ", irradiated=" + irradiated + ", admin_id=" + admin_id + ", admin_name="
				+ admin_name + ", total_price=" + total_price + ", cdate=" + cdate + ", stat=" + stat + ", stock_num="
				+ stock_num + ", stock_date=" + stock_date + "]";
	}
	
	
}
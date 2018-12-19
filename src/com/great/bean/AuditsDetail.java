package com.great.bean;

import java.io.Serializable;

public class AuditsDetail implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer auditsdetail_id;//审核表id
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
	private String iraradiated;
	private Integer totalPrice;
	
	public AuditsDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public AuditsDetail(Integer auditsdetail_id, Integer drug_id, String drug_name, String psycho, String drug_type,
			String spec, String drug_unit, Integer per_piece, Integer price, String sicks, String factory,
			Integer total, String iraradiated, Integer totalPrice) {
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
		this.iraradiated = iraradiated;
		this.totalPrice = totalPrice;
	}



	@Override
	public String toString() {
		return "AuditsDetail [auditsdetail_id=" + auditsdetail_id + ", drug_id=" + drug_id + ", drug_name=" + drug_name
				+ ", psycho=" + psycho + ", drug_type=" + drug_type + ", spec=" + spec + ", drug_unit=" + drug_unit
				+ ", per_piece=" + per_piece + ", price=" + price + ", sicks=" + sicks + ", factory=" + factory
				+ ", total=" + total + ", iraradiated=" + iraradiated + ", totalPrice=" + totalPrice + "]";
	}



	public Integer getAuditsdetail_id() {
		return auditsdetail_id;
	}

	public void setAuditsdetail_id(Integer auditsdetail_id) {
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

	public String getIraradiated() {
		return iraradiated;
	}

	public void setIraradiated(String iraradiated) {
		this.iraradiated = iraradiated;
	}



	public Integer getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
    
}

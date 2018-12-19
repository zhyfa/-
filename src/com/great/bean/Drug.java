package com.great.bean;

import java.io.Serializable;

public class Drug implements Serializable{
	public static final long s=1000000l;
	private Integer drug_id;// number primary key,--药品id
	private String drug_name;// varchar2(20),--药品名字
	private Integer smalltype_id;// number,--小类别
	private int spec;// varchar2(20),--规格
	private Integer drug_size;// number,--一个规格中有多少的单位（颗、毫升、包，付）
	private String drug_unit;// varchar2(50),--单位（颗、包，付）（毫升）
	private Integer price;// number,--售价
	private Integer discount;// number,--折扣 （95）
	private String psychotropics;// varchar2(20),--是否是精神药
	private String medical_code;// varchar2(200), --医保编码
	private String use_method ;//varchar2(200),--使用方法
	private String drug_alias;// varchar2(200),--药的别名或化学式
	private String illustrate;// varchar2(200), --药品说明
	private String irradiated ;//varchar2(20),--保质期
	private Integer state;// number default 1,--状态
	private String cdate;// date default sysdate
	

    /////////////////////===jyf
	private Integer stock_min;// number,--药库最少库存，
	private Integer inventory_min;// number,--药房最少库存
	
	private String bigtype_name;//大类别名字
	private String smalltype_name;//小类别名字
	public Drug() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Drug(Integer drug_id, String drug_name, Integer smalltype_id, int spec, Integer drug_size, String drug_unit,
			Integer price, Integer discount, String psychotropics, String medical_code, String use_method,
			String drug_alias, String illustrate, String irradiated, Integer state, String cdate, Integer stock_min,
			Integer inventory_min, String bigtype_name, String smalltype_name) {
		super();
		this.drug_id = drug_id;
		this.drug_name = drug_name;
		this.smalltype_id = smalltype_id;
		this.spec = spec;
		this.drug_size = drug_size;
		this.drug_unit = drug_unit;
		this.price = price;
		this.discount = discount;
		this.psychotropics = psychotropics;
		this.medical_code = medical_code;
		this.use_method = use_method;
		this.drug_alias = drug_alias;
		this.illustrate = illustrate;
		this.irradiated = irradiated;
		this.state = state;
		this.cdate = cdate;
		this.stock_min = stock_min;
		this.inventory_min = inventory_min;
		this.bigtype_name = bigtype_name;
		this.smalltype_name = smalltype_name;
	}

	public Integer getStock_min() {
		return stock_min;
	}

	public void setStock_min(Integer stock_min) {
		this.stock_min = stock_min;
	}

	public Integer getInventory_min() {
		return inventory_min;
	}

	public void setInventory_min(Integer inventory_min) {
		this.inventory_min = inventory_min;
	}

	public String getBigtype_name() {
		return bigtype_name;
	}

	public void setBigtype_name(String bigtype_name) {
		this.bigtype_name = bigtype_name;
	}

	public String getSmalltype_name() {
		return smalltype_name;
	}

	public void setSmalltype_name(String smalltype_name) {
		this.smalltype_name = smalltype_name;
	}

	public void setDrug_size(Integer drug_size) {
		this.drug_size = drug_size;
	}

	public int getSpec() {
		return spec;
	}
	public void setSpec(int spec) {
		this.spec = spec;
	}
	public int getDrug_size() {
		return drug_size;
	}
	public void setDrug_size(int drug_size) {
		this.drug_size = drug_size;
	}
	public String getDrug_unit() {
		return drug_unit;
	}
	public void setDrug_unit(String drug_unit) {
		this.drug_unit = drug_unit;
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
	
	public Integer getSmalltype_id() {
		return smalltype_id;
	}
	public void setSmalltype_id(Integer smalltype_id) {
		this.smalltype_id = smalltype_id;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public String getPsychotropics() {
		return psychotropics;
	}
	public void setPsychotropics(String psychotropics) {
		this.psychotropics = psychotropics;
	}
	public String getMedical_code() {
		return medical_code;
	}
	public void setMedical_code(String medical_code) {
		this.medical_code = medical_code;
	}
	public String getUse_method() {
		return use_method;
	}
	public void setUse_method(String use_method) {
		this.use_method = use_method;
	}
	public String getDrug_alias() {
		return drug_alias;
	}
	public void setDrug_alias(String drug_alias) {
		this.drug_alias = drug_alias;
	}
	public String getIllustrate() {
		return illustrate;
	}
	public void setIllustrate(String illustrate) {
		this.illustrate = illustrate;
	}
	public String getIrradiated() {
		return irradiated;
	}
	public void setIrradiated(String irradiated) {
		this.irradiated = irradiated;
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
		return "Drug [drug_id=" + drug_id + ", drug_name=" + drug_name + ", smalltype_id=" + smalltype_id + ", spec="
				+ spec + ", drug_size=" + drug_size + ", drug_unit=" + drug_unit + ", price=" + price + ", discount="
				+ discount + ", psychotropics=" + psychotropics + ", medical_code=" + medical_code + ", use_method="
				+ use_method + ", drug_alias=" + drug_alias + ", illustrate=" + illustrate + ", irradiated="
				+ irradiated + ", state=" + state + ", cdate=" + cdate + ", stock_min=" + stock_min + ", inventory_min="
				+ inventory_min + ", bigtype_name=" + bigtype_name + ", smalltype_name=" + smalltype_name + "]";
	}

	
	
	
}

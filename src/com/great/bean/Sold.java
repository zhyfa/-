package com.great.bean;

public class Sold {
	private Integer sold_id;// number primary key,--销售表id
	private Integer drug_id;// number,--药品id
	private Integer inventory_id;// number,--药房库存id
	private Integer sold_num;// number,--销售数量
	private Integer admin_id;// number ,--操作表
	private Integer price;// number,--单价
	private String person;// varchar2(20),--购药人
	private String purpose ;//varchar2(500),--如果是特殊药，该字段有值
	private Integer bir_price;// number(20),--成本价
	private Integer state ;//number default 1,
	private String cdate ;//date default sysdate
	
	
	public Integer getBir_price() {
		return bir_price;
	}
	public void setBir_price(Integer bir_price) {
		this.bir_price = bir_price;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public Integer getDrug_id() {
		return drug_id;
	}
	public void setDrug_id(Integer drug_id) {
		this.drug_id = drug_id;
	}
	public Integer getSold_id() {
		return sold_id;
	}
	public void setSold_id(Integer sold_id) {
		this.sold_id = sold_id;
	}
	public Integer getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(Integer inventory_id) {
		this.inventory_id = inventory_id;
	}
	public Integer getSold_num() {
		return sold_num;
	}
	public void setSold_num(Integer sold_num) {
		this.sold_num = sold_num;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
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
		return "Sold [sold_id=" + sold_id + ", inventory_id=" + inventory_id + ", sold_num=" + sold_num + ", admin_id="
				+ admin_id + ", price=" + price + ", person=" + person + ", state=" + state + ", cdate=" + cdate + "]";
	}
	
}

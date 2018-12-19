package com.great.bean;

public class Sold {
	private Integer sold_id;// number primary key,--销售表id
	private Integer inventory_id;// number,--药房库存id
	private Integer sold_num;// number,--销售数量
	private Integer admin_id;// number ,--操作表
	private Integer price;// number,--单价
	private String person;// varchar2(20),--购药人
	private Integer state ;//number default 1,
	private String cdate ;//date default sysdate
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

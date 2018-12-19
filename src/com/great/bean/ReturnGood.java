package com.great.bean;

public class ReturnGood {
	private Integer stock_id ;//number(20),--库存ID
	private Integer pharmary_id  ;//number(20) ,--药品ID
	private Integer pharmary_number  ;//number(20),--药品数量
	private String  return_date ;// date --退药日期
	public Integer getStock_id() {
		return stock_id;
	}
	public void setStock_id(Integer stock_id) {
		this.stock_id = stock_id;
	}
	public Integer getPharmary_id() {
		return pharmary_id;
	}
	public void setPharmary_id(Integer pharmary_id) {
		this.pharmary_id = pharmary_id;
	}
	public Integer getPharmary_number() {
		return pharmary_number;
	}
	public void setPharmary_number(Integer pharmary_number) {
		this.pharmary_number = pharmary_number;
	}
	public String getReturn_date() {
		return return_date;
	}
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	@Override
	public String toString() {
		return "ReturnGood [stock_id=" + stock_id + ", pharmary_id=" + pharmary_id + ", pharmary_number="
				+ pharmary_number + ", return_date=" + return_date + "]";
	}
	
	
}

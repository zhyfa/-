package com.great.bean;

public class ReturnGood {
	private Integer stock_id ;//number(20),--库存ID
	private Integer drug_id  ;//number(20) ,--药品ID
	private Integer stock_number  ;//number(20),--药品数量drug_id number,--药品ID//pharmary_number number,--药品数量
	private String  return_date ;// date --退药日期
	public Integer getStock_id() {
		return stock_id;
	}
	public void setStock_id(Integer stock_id) {
		this.stock_id = stock_id;
	}
	
	public Integer getDrug_id() {
		return drug_id;
	}
	public void setDrug_id(Integer drug_id) {
		this.drug_id = drug_id;
	}
	
	public Integer getStock_number() {
		return stock_number;
	}
	public void setStock_number(Integer stock_number) {
		this.stock_number = stock_number;
	}
	public String getReturn_date() {
		return return_date;
	}
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	@Override
	public String toString() {
		return "ReturnGood [stock_id=" + stock_id + ", drug_id=" + drug_id + ", stock_number=" + stock_number
				+ ", return_date=" + return_date + "]";
	}
	
	
	
	
}

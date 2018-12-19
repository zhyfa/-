package com.great.bean;

public class Banned {
	private Integer pharmacy_id;// number,--禁药1
	private Integer pharmacy_id1;// number--禁药2
	public Integer getPharmacy_id() {
		return pharmacy_id;
	}
	public void setPharmacy_id(Integer pharmacy_id) {
		this.pharmacy_id = pharmacy_id;
	}
	public Integer getPharmacy_id1() {
		return pharmacy_id1;
	}
	public void setPharmacy_id1(Integer pharmacy_id1) {
		this.pharmacy_id1 = pharmacy_id1;
	}
	@Override
	public String toString() {
		return "Banned [pharmacy_id=" + pharmacy_id + ", pharmacy_id1=" + pharmacy_id1 + "]";
	}
	
}

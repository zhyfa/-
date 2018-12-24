package com.great.bean;

public class SaleNum {
	private Integer inventory_id;//药房库 存 id
	private Integer saleNum;//销售数量
	public Integer getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(Integer inventory_id) {
		this.inventory_id = inventory_id;
	}
	public Integer getSaleNum() {
		return saleNum;
	}
	public void setSaleNum(Integer saleNum) {
		this.saleNum = saleNum;
	}
	@Override
	public String toString() {
		return "SaleNum [inventory_id=" + inventory_id + ", saleNum=" + saleNum + "]";
	}
	
	
}

package com.great.bean;

public class Unsalable {
	private Integer unsalable_id;// number primary key,-- 滞销 id
	private Integer unsalable_day;// number,--滞销天数
	private Integer unsalable_number;// number,--滞销天数 之内  卖出多少规格 数量
	private Integer state;// number default 1 -- 1为可选规则 2为当前规则
	
	
	public Integer getUnsalable_id() {
		return unsalable_id;
	}
	public void setUnsalable_id(Integer unsalable_id) {
		this.unsalable_id = unsalable_id;
	}
	public Integer getUnsalable_day() {
		return unsalable_day;
	}
	public void setUnsalable_day(Integer unsalable_day) {
		this.unsalable_day = unsalable_day;
	}
	public Integer getUnsalable_number() {
		return unsalable_number;
	}
	public void setUnsalable_number(Integer unsalable_number) {
		this.unsalable_number = unsalable_number;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	
}

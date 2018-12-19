package com.great.bean;

public class BigType {
	private Integer bigtype_id;//number  primary key,--大类别id
	private String bigtype_name;// varchar2(20),--大类别名字
	private Integer state;// number default 1,--状态
	private String cdate;// date default sysdate
	public Integer getBigtype_id() {
		return bigtype_id;
	}
	public void setBigtype_id(Integer bigtype_id) {
		this.bigtype_id = bigtype_id;
	}
	public String getBigtype_name() {
		return bigtype_name;
	}
	public void setBigtype_name(String bigtype_name) {
		this.bigtype_name = bigtype_name;
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
		return "BigType [bigtype_id=" + bigtype_id + ", bigtype_name=" + bigtype_name + ", state=" + state + ", cdate="
				+ cdate + "]";
	}
	
	
}

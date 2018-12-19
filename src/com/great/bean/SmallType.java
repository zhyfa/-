package com.great.bean;

public class SmallType {
	private Integer smalltype_id;// number  primary key,--小类别id
	private String  smalltype_name ;//varchar2(20),--小类别名字
	private Integer father_id;// number,--父id  大类别id
	private Integer state;// number default 1,--状态
	private String cdate;// date default sysdate
	public Integer getSmalltype_id() {
		return smalltype_id;
	}
	public void setSmalltype_id(Integer smalltype_id) {
		this.smalltype_id = smalltype_id;
	}
	public String getSmalltype_name() {
		return smalltype_name;
	}
	public void setSmalltype_name(String smalltype_name) {
		this.smalltype_name = smalltype_name;
	}
	public Integer getFather_id() {
		return father_id;
	}
	public void setFather_id(Integer father_id) {
		this.father_id = father_id;
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
		return "SmallType [smalltype_id=" + smalltype_id + ", smalltype_name=" + smalltype_name + ", father_id="
				+ father_id + ", state=" + state + ", cdate=" + cdate + "]";
	}
	
}

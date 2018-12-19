package com.great.bean;

public class MyLog {
	private Integer log_id ;//number(20) primary key  ,--日志ID
	private Integer admin_id ;//number(20),--操作人员ID
	private String log_operation ;//varchar2(20),--日志操作
	private Integer log_state;// number(20) default 1,--日志状态
	private String log_cdate;// date default sysdate--操作日期
	public Integer getLog_id() {
		return log_id;
	}
	public void setLog_id(Integer log_id) {
		this.log_id = log_id;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getLog_operation() {
		return log_operation;
	}
	public void setLog_operation(String log_operation) {
		this.log_operation = log_operation;
	}
	public Integer getLog_state() {
		return log_state;
	}
	public void setLog_state(Integer log_state) {
		this.log_state = log_state;
	}
	public String getLog_cdate() {
		return log_cdate;
	}
	public void setLog_cdate(String log_cdate) {
		this.log_cdate = log_cdate;
	}
	@Override
	public String toString() {
		return "Log [log_id=" + log_id + ", admin_id=" + admin_id + ", log_operation=" + log_operation + ", log_state="
				+ log_state + ", log_cdate=" + log_cdate + "]";
	}
	
	
}

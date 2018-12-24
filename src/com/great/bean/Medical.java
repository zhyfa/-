package com.great.bean;
//医保基表
public class Medical {
	private int medical_id;//编号
	private String drug_name;//药品名称
	private String medical_city;//基准城市
	public int getMedical_id() {
		return medical_id;
	}
	public void setMedical_id(int medical_id) {
		this.medical_id = medical_id;
	}
	public String getDrug_name() {
		return drug_name;
	}
	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}
	public String getMedical_city() {
		return medical_city;
	}
	public void setMedical_city(String medical_city) {
		this.medical_city = medical_city;
	}
	
}

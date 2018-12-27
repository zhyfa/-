package com.great.bean;

public class Detaile3 {
	 String DRUG_NAME;//药品名单
	 String PSYCHOTROPICS;//是否为特殊药
	 String BIRTHDAY;//生产日期
	 String FACTORY_NAME;//生产工厂
	 Integer DRUG_NUMBER;//数量
	 String CDATE;//同意时间
	 String ADMIN_NAME1;//申请者
	 String ADMIN_NAME2;//审批者
	 String MEG;//意见
	@Override
	public String toString() {
		return "Detaile3 [DRUG_NAME=" + DRUG_NAME + ", PSYCHOTROPICS=" + PSYCHOTROPICS + ", BIRTHDAY=" + BIRTHDAY
				+ ", FACTORY_NAME=" + FACTORY_NAME + ", DRUG_NUMBER=" + DRUG_NUMBER + ", CDATE=" + CDATE
				+ ", ADMIN_NAME1=" + ADMIN_NAME1 + ", ADMIN_NAME2=" + ADMIN_NAME2 + ", MEG=" + MEG + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	public Detaile3(String dRUG_NAME, String pSYCHOTROPICS, String bIRTHDAY, String fACTORY_NAME, Integer dRUG_NUMBER,
			String cDATE, String aDMIN_NAME1, String aDMIN_NAME2, String mEG) {
		super();
		DRUG_NAME = dRUG_NAME;
		PSYCHOTROPICS = pSYCHOTROPICS;
		BIRTHDAY = bIRTHDAY;
		FACTORY_NAME = fACTORY_NAME;
		DRUG_NUMBER = dRUG_NUMBER;
		CDATE = cDATE;
		ADMIN_NAME1 = aDMIN_NAME1;
		ADMIN_NAME2 = aDMIN_NAME2;
		MEG = mEG;
	}
	public Detaile3() {
		super();
	}
	public String getDRUG_NAME() {
		return DRUG_NAME;
	}
	public void setDRUG_NAME(String dRUG_NAME) {
		DRUG_NAME = dRUG_NAME;
	}
	public String getPSYCHOTROPICS() {
		return PSYCHOTROPICS;
	}
	public void setPSYCHOTROPICS(String pSYCHOTROPICS) {
		PSYCHOTROPICS = pSYCHOTROPICS;
	}
	public String getBIRTHDAY() {
		return BIRTHDAY;
	}
	public void setBIRTHDAY(String bIRTHDAY) {
		BIRTHDAY = bIRTHDAY;
	}
	public String getFACTORY_NAME() {
		return FACTORY_NAME;
	}
	public void setFACTORY_NAME(String fACTORY_NAME) {
		FACTORY_NAME = fACTORY_NAME;
	}
	public Integer getDRUG_NUMBER() {
		return DRUG_NUMBER;
	}
	public void setDRUG_NUMBER(Integer dRUG_NUMBER) {
		DRUG_NUMBER = dRUG_NUMBER;
	}
	public String getCDATE() {
		return CDATE;
	}
	public void setCDATE(String cDATE) {
		CDATE = cDATE;
	}
	public String getADMIN_NAME1() {
		return ADMIN_NAME1;
	}
	public void setADMIN_NAME1(String aDMIN_NAME1) {
		ADMIN_NAME1 = aDMIN_NAME1;
	}
	public String getADMIN_NAME2() {
		return ADMIN_NAME2;
	}
	public void setADMIN_NAME2(String aDMIN_NAME2) {
		ADMIN_NAME2 = aDMIN_NAME2;
	}
	public String getMEG() {
		return MEG;
	}
	public void setMEG(String mEG) {
		MEG = mEG;
	}
	 
	 
	 
}

package com.great.bean;

public class LossReport {
	Integer REIMBURSE_ID;//报损序号
	Integer INVENTORY_ID;//库存ID
	String  DRUG_NAME;//药品名称
	Integer REIMBURSE_NUM;//数量
	String  ADMIN_NAME;//管理员ID
	String ILLUSTRATE;//说明
	String PARAMETER_NAME;//药品状态
	String CDATA;//日期
	
	
	public LossReport() {
		super();
	}
	public LossReport(Integer rEIMBURSE_ID, Integer iNVENTORY_ID, String dRUG_NAME, Integer rEIMBURSE_NUM,
			String aDMIN_NAME, String iLLUSTRATE, String pARAMETER_NAME, String cDATA) {
		super();
		REIMBURSE_ID = rEIMBURSE_ID;
		INVENTORY_ID = iNVENTORY_ID;
		DRUG_NAME = dRUG_NAME;
		REIMBURSE_NUM = rEIMBURSE_NUM;
		ADMIN_NAME = aDMIN_NAME;
		ILLUSTRATE = iLLUSTRATE;
		PARAMETER_NAME = pARAMETER_NAME;
		CDATA = cDATA;
	}
	@Override
	public String toString() {
		return "LossReport [REIMBURSE_ID=" + REIMBURSE_ID + ", INVENTORY_ID=" + INVENTORY_ID + ", DRUG_NAME="
				+ DRUG_NAME + ", REIMBURSE_NUM=" + REIMBURSE_NUM + ", ADMIN_NAME=" + ADMIN_NAME + ", ILLUSTRATE="
				+ ILLUSTRATE + ", PARAMETER_NAME=" + PARAMETER_NAME + ", CDATA=" + CDATA + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	public Integer getREIMBURSE_ID() {
		return REIMBURSE_ID;
	}
	public void setREIMBURSE_ID(Integer rEIMBURSE_ID) {
		REIMBURSE_ID = rEIMBURSE_ID;
	}
	public Integer getINVENTORY_ID() {
		return INVENTORY_ID;
	}
	public void setINVENTORY_ID(Integer iNVENTORY_ID) {
		INVENTORY_ID = iNVENTORY_ID;
	}
	public String getDRUG_NAME() {
		return DRUG_NAME;
	}
	public void setDRUG_NAME(String dRUG_NAME) {
		DRUG_NAME = dRUG_NAME;
	}
	public Integer getREIMBURSE_NUM() {
		return REIMBURSE_NUM;
	}
	public void setREIMBURSE_NUM(Integer rEIMBURSE_NUM) {
		REIMBURSE_NUM = rEIMBURSE_NUM;
	}
	public String getADMIN_NAME() {
		return ADMIN_NAME;
	}
	public void setADMIN_NAME(String aDMIN_NAME) {
		ADMIN_NAME = aDMIN_NAME;
	}
	public String getILLUSTRATE() {
		return ILLUSTRATE;
	}
	public void setILLUSTRATE(String iLLUSTRATE) {
		ILLUSTRATE = iLLUSTRATE;
	}
	public String getPARAMETER_NAME() {
		return PARAMETER_NAME;
	}
	public void setPARAMETER_NAME(String pARAMETER_NAME) {
		PARAMETER_NAME = pARAMETER_NAME;
	}
	public String getCDATA() {
		return CDATA;
	}
	public void setCDATA(String cDATA) {
		CDATA = cDATA;
	}
	
	
}

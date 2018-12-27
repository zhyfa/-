package com.great.bean;

public class Detaile1 {
String PSYCHOTROPICS;
int DRUG_NUMBER;
String CDATE;
String ADMIN_NAME;
String DRUG_NAME;
public Detaile1(String pSYCHOTROPICS, int dRUG_NUMBER, String cDATE, String aDMIN_NAME, String dRUG_NAME) {
	super();
	PSYCHOTROPICS = pSYCHOTROPICS;
	DRUG_NUMBER = dRUG_NUMBER;
	CDATE = cDATE;
	ADMIN_NAME = aDMIN_NAME;
	DRUG_NAME = dRUG_NAME;
}
public Detaile1() {
	super();
}
@Override
public String toString() {
	return "Detaile1 [PSYCHOTROPICS=" + PSYCHOTROPICS + ", DRUG_NUMBER=" + DRUG_NUMBER + ", CDATE=" + CDATE
			+ ", ADMIN_NAME=" + ADMIN_NAME + ", DRUG_NAME=" + DRUG_NAME + "]";
}
public String getPSYCHOTROPICS() {
	return PSYCHOTROPICS;
}
public void setPSYCHOTROPICS(String pSYCHOTROPICS) {
	PSYCHOTROPICS = pSYCHOTROPICS;
}
public int getDRUG_NUMBER() {
	return DRUG_NUMBER;
}
public void setDRUG_NUMBER(int dRUG_NUMBER) {
	DRUG_NUMBER = dRUG_NUMBER;
}
public String getCDATE() {
	return CDATE;
}
public void setCDATE(String cDATE) {
	CDATE = cDATE;
}
public String getADMIN_NAME() {
	return ADMIN_NAME;
}
public void setADMIN_NAME(String aDMIN_NAME) {
	ADMIN_NAME = aDMIN_NAME;
}
public String getDRUG_NAME() {
	return DRUG_NAME;
}
public void setDRUG_NAME(String dRUG_NAME) {
	DRUG_NAME = dRUG_NAME;
}

}

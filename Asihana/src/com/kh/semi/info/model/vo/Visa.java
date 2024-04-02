package com.kh.semi.info.model.vo;

public class Visa {
	private int visaNo;
	private String visaName;
	
	public Visa() {
		super();
	}

	public Visa(int visaNo, String visaName) {
		super();
		this.visaNo = visaNo;
		this.visaName = visaName;
	}

	public int getVisaNo() {
		return visaNo;
	}

	public void setVisaNo(int visaNo) {
		this.visaNo = visaNo;
	}

	public String getVisaName() {
		return visaName;
	}

	public void setVisaName(String visaName) {
		this.visaName = visaName;
	}

	@Override
	public String toString() {
		return "Visa [visaNo=" + visaNo + ", visaName=" + visaName + "]";
	}

}

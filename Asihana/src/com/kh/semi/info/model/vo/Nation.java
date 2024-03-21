package com.kh.semi.info.model.vo;

public class Nation {
	
	private int nationNo;
	private String nationName;
	private String nationContent;
	private String visaName;
	
	public Nation() {
		super();
	}

	public Nation(int nationNo, String nationName, String nationContent, String visaName) {
		super();
		this.nationNo = nationNo;
		this.nationName = nationName;
		this.nationContent = nationContent;
		this.visaName = visaName;
	}

	public int getNationNo() {
		return nationNo;
	}

	public void setNationNo(int nationNo) {
		this.nationNo = nationNo;
	}

	public String getNationName() {
		return nationName;
	}

	public void setNationName(String nationName) {
		this.nationName = nationName;
	}

	public String getNationContent() {
		return nationContent;
	}

	public void setNationContent(String nationContent) {
		this.nationContent = nationContent;
	}

	public String getVisaName() {
		return visaName;
	}

	public void setVisaName(String visaName) {
		this.visaName = visaName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nationContent == null) ? 0 : nationContent.hashCode());
		result = prime * result + ((nationName == null) ? 0 : nationName.hashCode());
		result = prime * result + nationNo;
		result = prime * result + ((visaName == null) ? 0 : visaName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Nation other = (Nation) obj;
		if (nationContent == null) {
			if (other.nationContent != null)
				return false;
		} else if (!nationContent.equals(other.nationContent))
			return false;
		if (nationName == null) {
			if (other.nationName != null)
				return false;
		} else if (!nationName.equals(other.nationName))
			return false;
		if (nationNo != other.nationNo)
			return false;
		if (visaName == null) {
			if (other.visaName != null)
				return false;
		} else if (!visaName.equals(other.visaName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Nation [nationNo=" + nationNo + ", nationName=" + nationName + ", nationContent=" + nationContent
				+ ", visaName=" + visaName + "]";
	}
	
	
	

}

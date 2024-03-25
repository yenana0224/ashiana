package com.kh.semi.info.model.vo;

public class Attraction {

	private int attractNo;
	private int cityNO;
	private String attractName;
	private String attarctCn;
	
	public Attraction() {
		super();
	}

	public Attraction(int attractNo, int cityNO, String attractName, String attarctCn) {
		super();
		this.attractNo = attractNo;
		this.cityNO = cityNO;
		this.attractName = attractName;
		this.attarctCn = attarctCn;
	}

	public int getAttractNo() {
		return attractNo;
	}

	public void setAttractNo(int attractNo) {
		this.attractNo = attractNo;
	}

	public int getCityNO() {
		return cityNO;
	}

	public void setCityNO(int cityNO) {
		this.cityNO = cityNO;
	}

	public String getAttractName() {
		return attractName;
	}

	public void setAttractName(String attractName) {
		this.attractName = attractName;
	}

	public String getAttarctCn() {
		return attarctCn;
	}

	public void setAttarctCn(String attarctCn) {
		this.attarctCn = attarctCn;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((attarctCn == null) ? 0 : attarctCn.hashCode());
		result = prime * result + ((attractName == null) ? 0 : attractName.hashCode());
		result = prime * result + attractNo;
		result = prime * result + cityNO;
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
		Attraction other = (Attraction) obj;
		if (attarctCn == null) {
			if (other.attarctCn != null)
				return false;
		} else if (!attarctCn.equals(other.attarctCn))
			return false;
		if (attractName == null) {
			if (other.attractName != null)
				return false;
		} else if (!attractName.equals(other.attractName))
			return false;
		if (attractNo != other.attractNo)
			return false;
		if (cityNO != other.cityNO)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Attraction [attractNo=" + attractNo + ", cityNO=" + cityNO + ", attractName=" + attractName
				+ ", attarctCn=" + attarctCn + "]";
	}
	
	
}

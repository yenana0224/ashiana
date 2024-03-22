package com.kh.semi.info.model.vo;

public class Currency {
	private int NationNo;
	private String currencyName;
	
	public Currency() {
		super();
	}

	public Currency(int nationNo, String currencyName) {
		super();
		NationNo = nationNo;
		this.currencyName = currencyName;
	}

	public int getNationNo() {
		return NationNo;
	}

	public void setNationNo(int nationNo) {
		NationNo = nationNo;
	}

	public String getCurrencyName() {
		return currencyName;
	}

	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + NationNo;
		result = prime * result + ((currencyName == null) ? 0 : currencyName.hashCode());
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
		Currency other = (Currency) obj;
		if (NationNo != other.NationNo)
			return false;
		if (currencyName == null) {
			if (other.currencyName != null)
				return false;
		} else if (!currencyName.equals(other.currencyName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return currencyName;
	}
	
	
}

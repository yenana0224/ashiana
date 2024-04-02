package com.kh.semi.info.model.vo;

public class Voltage {

	private int nationNo;
	private int voltageNo;
	private String volName;
	
	
	public Voltage() {
		super();
	}


	public Voltage(int nationNo, String volName) {
		super();
		this.nationNo = nationNo;
		this.volName = volName;
	}

	

	public int getVoltageNo() {
		return voltageNo;
	}


	public void setVoltageNo(int voltageNo) {
		this.voltageNo = voltageNo;
	}


	public int getNationNo() {
		return nationNo;
	}


	public void setNationNo(int nationNo) {
		this.nationNo = nationNo;
	}


	public String getVolName() {
		return volName;
	}


	public void setVolName(String volName) {
		this.volName = volName;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + nationNo;
		result = prime * result + ((volName == null) ? 0 : volName.hashCode());
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
		Voltage other = (Voltage) obj;
		if (nationNo != other.nationNo)
			return false;
		if (volName == null) {
			if (other.volName != null)
				return false;
		} else if (!volName.equals(other.volName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return volName;
	}

	
	
	
}

package com.kh.semi.info.model.vo;

import com.kh.semi.common.AttachmentFile;

public class CityFile extends AttachmentFile {
	
	private int nationNo;
	private String nationName;
	private int cityNo;
	private String cityName;
	
	public CityFile() {
		super();
	}

	public CityFile(int nationNo, String nationName, int cityNo, String cityName) {
		super();
		this.nationNo = nationNo;
		this.nationName = nationName;
		this.cityNo = cityNo;
		this.cityName = cityName;
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

	public int getCityNo() {
		return cityNo;
	}

	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	@Override
	public int getFileNo() {
		return super.getFileNo();
	}

	@Override
	public void setFileNo(int fileNo) {
		super.setFileNo(fileNo);
	}

	@Override
	public void setBoardType(int boardType) {
		super.setBoardType(boardType);
	}

	@Override
	public int getBoardNo() {
		return super.getBoardNo();
	}

	@Override
	public void setBoardNo(int boardNo) {
		super.setBoardNo(boardNo);
	}

	@Override
	public String getFilePath() {
		return super.getFilePath();
	}

	@Override
	public void setFilePath(String filePath) {
		super.setFilePath(filePath);
	}

	@Override
	public String getOriginName() {
		return super.getOriginName();
	}

	@Override
	public void setOriginName(String originName) {
		super.setOriginName(originName);
	}

	@Override
	public String getChangeName() {
		return super.getChangeName();
	}

	@Override
	public void setChangeName(String changeName) {
		super.setChangeName(changeName);
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((cityName == null) ? 0 : cityName.hashCode());
		result = prime * result + cityNo;
		result = prime * result + ((nationName == null) ? 0 : nationName.hashCode());
		result = prime * result + nationNo;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		CityFile other = (CityFile) obj;
		if (cityName == null) {
			if (other.cityName != null)
				return false;
		} else if (!cityName.equals(other.cityName))
			return false;
		if (cityNo != other.cityNo)
			return false;
		if (nationName == null) {
			if (other.nationName != null)
				return false;
		} else if (!nationName.equals(other.nationName))
			return false;
		if (nationNo != other.nationNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CityFile [nationNo=" + nationNo + ", nationName=" + nationName + ", cityNo=" + cityNo + ", cityName="
				+ cityName + "]";
	}

}

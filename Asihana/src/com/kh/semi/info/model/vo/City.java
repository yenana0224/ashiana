package com.kh.semi.info.model.vo;

public class City {
	
	private int cityNo;
	private String cityName;
	private String cityContent;
	private int nationNo;
	private String nationName;
	private String flyingTime;
	private int count;
	
	public City() {
		super();
	}

	public City(int cityNo, String cityName, String cityContent, int nationNo, String nationName, String flyingTime,
			int count) {
		super();
		this.cityNo = cityNo;
		this.cityName = cityName;
		this.cityContent = cityContent;
		this.nationNo = nationNo;
		this.nationName = nationName;
		this.flyingTime = flyingTime;
		this.count = count;
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

	public String getCityContent() {
		return cityContent;
	}

	public void setCityContent(String cityContent) {
		this.cityContent = cityContent;
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

	public String getFlyingTime() {
		return flyingTime;
	}

	public void setFlyingTime(String flyingTime) {
		this.flyingTime = flyingTime;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "City [cityNo=" + cityNo + ", cityName=" + cityName + ", cityContent=" + cityContent + ", nationNo="
				+ nationNo + ", nationName=" + nationName + ", flyingTime=" + flyingTime + ", count=" + count + "]";
	}
	
	

	
}

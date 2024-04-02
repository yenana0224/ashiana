package com.kh.semi.info.model.vo;

public class City {
	
	private int cityNo;
	private String cityName;
	private String cityContent;
	private int nationNo;
	private String nationName;
	private String flyingTime;
	private String visaName;
	private String language;
	private String voltage;
	private String currency;
	private int count;
	private String filePath;
	private String changeName;
	
	
	
	
	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

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
	
	

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getVisaName() {
		return visaName;
	}

	public void setVisaName(String visaName) {
		this.visaName = visaName;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getVoltage() {
		return voltage;
	}

	public void setVoltage(String voltage) {
		this.voltage = voltage;
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
				+ nationNo + ", nationName=" + nationName + ", flyingTime=" + flyingTime + ", visaName=" + visaName
				+ ", language=" + language + ", voltage=" + voltage + ", currency=" + currency + ", count=" + count
				+ "]";
	}

	
	
	

	
}

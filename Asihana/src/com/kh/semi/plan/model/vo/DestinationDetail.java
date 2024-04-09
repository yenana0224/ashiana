package com.kh.semi.plan.model.vo;

public class DestinationDetail {
	
	private int destNo;
	private int cityNo;
	private String cityName;
	private String trans;
	private String trip;
	private String transPrice;
	private String arrival;
	private String returnDate;
	private String destDate;
	private String schedCostSum;
	private String filePath;
	
	public DestinationDetail() {
		super();
	}

	public DestinationDetail(int destNo, int cityNo, String cityName, String trans, String trip, String transPrice,
			String arrival, String returnDate, String destDate, String schedCostSum, String filePath) {
		super();
		this.destNo = destNo;
		this.cityNo = cityNo;
		this.cityName = cityName;
		this.trans = trans;
		this.trip = trip;
		this.transPrice = transPrice;
		this.arrival = arrival;
		this.returnDate = returnDate;
		this.destDate = destDate;
		this.schedCostSum = schedCostSum;
		this.filePath = filePath;
	}

	public int getDestNo() {
		return destNo;
	}
	public void setDestNo(int destNo) {
		this.destNo = destNo;
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
	public String getTrans() {
		return trans;
	}
	public void setTrans(String trans) {
		this.trans = trans;
	}
	public String getTrip() {
		return trip;
	}
	public void setTrip(String trip) {
		this.trip = trip;
	}
	public String getTransPrice() {
		return transPrice;
	}
	public void setTransPrice(String transPrice) {
		this.transPrice = transPrice;
	}
	public String getArrival() {
		return arrival;
	}
	public void setArrival(String arrival) {
		this.arrival = arrival;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getDestDate() {
		return destDate;
	}
	public void setDestDate(String destDate) {
		this.destDate = destDate;
	}
	public String getSchedCostSum() {
		return schedCostSum;
	}
	public void setSchedCostSum(String schedCostSum) {
		this.schedCostSum = schedCostSum;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "DestinationDetail [destNo=" + destNo + ", cityName=" + cityName + ", trans=" + trans + ", trip=" + trip
				+ ", transPrice=" + transPrice + ", arrival=" + arrival + ", returnDate=" + returnDate + ", destDate="
				+ destDate + ", schedCostSum=" + schedCostSum + ", filePath=" + filePath + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((arrival == null) ? 0 : arrival.hashCode());
		result = prime * result + ((cityName == null) ? 0 : cityName.hashCode());
		result = prime * result + ((destDate == null) ? 0 : destDate.hashCode());
		result = prime * result + destNo;
		result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
		result = prime * result + ((returnDate == null) ? 0 : returnDate.hashCode());
		result = prime * result + ((schedCostSum == null) ? 0 : schedCostSum.hashCode());
		result = prime * result + ((trans == null) ? 0 : trans.hashCode());
		result = prime * result + ((transPrice == null) ? 0 : transPrice.hashCode());
		result = prime * result + ((trip == null) ? 0 : trip.hashCode());
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
		DestinationDetail other = (DestinationDetail) obj;
		if (arrival == null) {
			if (other.arrival != null)
				return false;
		} else if (!arrival.equals(other.arrival))
			return false;
		if (cityName == null) {
			if (other.cityName != null)
				return false;
		} else if (!cityName.equals(other.cityName))
			return false;
		if (destDate == null) {
			if (other.destDate != null)
				return false;
		} else if (!destDate.equals(other.destDate))
			return false;
		if (destNo != other.destNo)
			return false;
		if (filePath == null) {
			if (other.filePath != null)
				return false;
		} else if (!filePath.equals(other.filePath))
			return false;
		if (returnDate == null) {
			if (other.returnDate != null)
				return false;
		} else if (!returnDate.equals(other.returnDate))
			return false;
		if (schedCostSum == null) {
			if (other.schedCostSum != null)
				return false;
		} else if (!schedCostSum.equals(other.schedCostSum))
			return false;
		if (trans == null) {
			if (other.trans != null)
				return false;
		} else if (!trans.equals(other.trans))
			return false;
		if (transPrice == null) {
			if (other.transPrice != null)
				return false;
		} else if (!transPrice.equals(other.transPrice))
			return false;
		if (trip == null) {
			if (other.trip != null)
				return false;
		} else if (!trip.equals(other.trip))
			return false;
		return true;
	}

	
	
}

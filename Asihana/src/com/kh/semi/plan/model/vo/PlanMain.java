package com.kh.semi.plan.model.vo;

public class PlanMain {
	private int planNo;
	private String StartDate;
	private String endDate;
	private String travelDate;
	private String dDay;
	private String planCitys;
	private String totalPrice;
	private String uploadDate;
	private String filePath;
	
	public PlanMain() {
		super();
	}
	public PlanMain(int planNo, String startDate, String endDate, String travelDate, String dDay, String planCitys,
			String totalPrice, String uploadDate) {
		super();
		this.planNo = planNo;
		StartDate = startDate;
		this.endDate = endDate;
		this.travelDate = travelDate;
		this.dDay = dDay;
		this.planCitys = planCitys;
		this.totalPrice = totalPrice;
		this.uploadDate = uploadDate;
	}
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public String getStartDate() {
		return StartDate;
	}
	public void setStartDate(String startDate) {
		StartDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTravelDate() {
		return travelDate;
	}
	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}
	public String getdDay() {
		return dDay;
	}
	public void setdDay(String dDay) {
		this.dDay = dDay;
	}
	public String getPlanCitys() {
		return planCitys;
	}
	public void setPlanCitys(String planCitys) {
		this.planCitys = planCitys;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	@Override
	public String toString() {
		return "PlanMain [planNo=" + planNo + ", StartDate=" + StartDate + ", endDate=" + endDate + ", travelDate="
				+ travelDate + ", dDay=" + dDay + ", planCitys=" + planCitys + ", totalPrice=" + totalPrice
				+ ", uploadDate=" + uploadDate + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((StartDate == null) ? 0 : StartDate.hashCode());
		result = prime * result + ((dDay == null) ? 0 : dDay.hashCode());
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + ((planCitys == null) ? 0 : planCitys.hashCode());
		result = prime * result + planNo;
		result = prime * result + ((totalPrice == null) ? 0 : totalPrice.hashCode());
		result = prime * result + ((travelDate == null) ? 0 : travelDate.hashCode());
		result = prime * result + ((uploadDate == null) ? 0 : uploadDate.hashCode());
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
		PlanMain other = (PlanMain) obj;
		if (StartDate == null) {
			if (other.StartDate != null)
				return false;
		} else if (!StartDate.equals(other.StartDate))
			return false;
		if (dDay == null) {
			if (other.dDay != null)
				return false;
		} else if (!dDay.equals(other.dDay))
			return false;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (planCitys == null) {
			if (other.planCitys != null)
				return false;
		} else if (!planCitys.equals(other.planCitys))
			return false;
		if (planNo != other.planNo)
			return false;
		if (totalPrice == null) {
			if (other.totalPrice != null)
				return false;
		} else if (!totalPrice.equals(other.totalPrice))
			return false;
		if (travelDate == null) {
			if (other.travelDate != null)
				return false;
		} else if (!travelDate.equals(other.travelDate))
			return false;
		if (uploadDate == null) {
			if (other.uploadDate != null)
				return false;
		} else if (!uploadDate.equals(other.uploadDate))
			return false;
		return true;
	}

	
}

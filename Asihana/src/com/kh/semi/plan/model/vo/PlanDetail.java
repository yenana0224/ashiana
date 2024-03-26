package com.kh.semi.plan.model.vo;

public class PlanDetail {
	
	private int planNo;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private String travelDate;
	private String transSum;
	private String schedSum;
	private String totalSum;
	
	public PlanDetail() {
		super();
	}
	
	public PlanDetail(int planNo, String startDate, String startTime, String endDate, String endTime, String travelDate,
			String transSum, String schedSum, String totalSum) {
		super();
		this.planNo = planNo;
		this.startDate = startDate;
		this.startTime = startTime;
		this.endDate = endDate;
		this.endTime = endTime;
		this.travelDate = travelDate;
		this.transSum = transSum;
		this.schedSum = schedSum;
		this.totalSum = totalSum;
	}

	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getTravelDate() {
		return travelDate;
	}
	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}
	public String getTransSum() {
		return transSum;
	}
	public void setTransSum(String transSum) {
		this.transSum = transSum;
	}
	public String getSchedSum() {
		return schedSum;
	}
	public void setSchedSum(String schedSum) {
		this.schedSum = schedSum;
	}
	public String getTotalSum() {
		return totalSum;
	}
	public void setTotalSum(String totalSum) {
		this.totalSum = totalSum;
	}

	@Override
	public String toString() {
		return "PlanDetail [planNo=" + planNo + ", startDate=" + startDate + ", startTime=" + startTime + ", endDate="
				+ endDate + ", endTime=" + endTime + ", travelDate=" + travelDate + ", transSum=" + transSum
				+ ", schedSum=" + schedSum + ", totalSum=" + totalSum + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + ((endTime == null) ? 0 : endTime.hashCode());
		result = prime * result + planNo;
		result = prime * result + ((schedSum == null) ? 0 : schedSum.hashCode());
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
		result = prime * result + ((startTime == null) ? 0 : startTime.hashCode());
		result = prime * result + ((totalSum == null) ? 0 : totalSum.hashCode());
		result = prime * result + ((transSum == null) ? 0 : transSum.hashCode());
		result = prime * result + ((travelDate == null) ? 0 : travelDate.hashCode());
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
		PlanDetail other = (PlanDetail) obj;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (endTime == null) {
			if (other.endTime != null)
				return false;
		} else if (!endTime.equals(other.endTime))
			return false;
		if (planNo != other.planNo)
			return false;
		if (schedSum == null) {
			if (other.schedSum != null)
				return false;
		} else if (!schedSum.equals(other.schedSum))
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		if (startTime == null) {
			if (other.startTime != null)
				return false;
		} else if (!startTime.equals(other.startTime))
			return false;
		if (totalSum == null) {
			if (other.totalSum != null)
				return false;
		} else if (!totalSum.equals(other.totalSum))
			return false;
		if (transSum == null) {
			if (other.transSum != null)
				return false;
		} else if (!transSum.equals(other.transSum))
			return false;
		if (travelDate == null) {
			if (other.travelDate != null)
				return false;
		} else if (!travelDate.equals(other.travelDate))
			return false;
		return true;
	}

	
}

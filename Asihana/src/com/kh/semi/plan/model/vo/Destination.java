package com.kh.semi.plan.model.vo;

public class Destination {
	private int destNo;
	private int planNo;
	private int cityNo;
	private String trans;
	private String transPrice;
	private String trip;
	private String arrival;
	private String returnDate;
	public Destination() {
		super();
	}
	
	
	
	public Destination(int planNo, String trans, String transPrice, String trip, String arrival) {
		super();
		this.planNo = planNo;
		this.trans = trans;
		this.transPrice = transPrice;
		this.trip = trip;
		this.arrival = arrival;
	}



	public Destination(int destNo, int planNo, String returnDate) {
		super();
		this.destNo = destNo;
		this.planNo = planNo;
		this.returnDate = returnDate;
	}

	public Destination(int planNo, int cityNo, String trans, String transPrice, String trip, String arrival,
			String returnDate) {
		super();
		this.planNo = planNo;
		this.cityNo = cityNo;
		this.trans = trans;
		this.transPrice = transPrice;
		this.trip = trip;
		this.arrival = arrival;
		this.returnDate = returnDate;
	}

	public Destination(int destNo, int planNo, int cityNo, String trans, String transPrice, String trip, String arrival,
			String returnDate) {
		super();
		this.destNo = destNo;
		this.planNo = planNo;
		this.cityNo = cityNo;
		this.trans = trans;
		this.transPrice = transPrice;
		this.trip = trip;
		this.arrival = arrival;
		this.returnDate = returnDate;
	}
	public int getDestNo() {
		return destNo;
	}
	public void setDestNo(int destNo) {
		this.destNo = destNo;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public int getCityNo() {
		return cityNo;
	}
	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}
	public String getTrans() {
		return trans;
	}
	public void setTrans(String trans) {
		this.trans = trans;
	}
	public String getTransPrice() {
		return transPrice;
	}
	public void setTransPrice(String transPrice) {
		this.transPrice = transPrice;
	}
	public String getTrip() {
		return trip;
	}
	public void setTrip(String trip) {
		this.trip = trip;
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
	@Override
	public String toString() {
		return "Destination [destNo=" + destNo + ", planNo=" + planNo + ", cityNo=" + cityNo + ", trans=" + trans
				+ ", transPrice=" + transPrice + ", trip=" + trip + ", arrival=" + arrival + ", returnDate="
				+ returnDate + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((arrival == null) ? 0 : arrival.hashCode());
		result = prime * result + cityNo;
		result = prime * result + destNo;
		result = prime * result + planNo;
		result = prime * result + ((returnDate == null) ? 0 : returnDate.hashCode());
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
		Destination other = (Destination) obj;
		if (arrival == null) {
			if (other.arrival != null)
				return false;
		} else if (!arrival.equals(other.arrival))
			return false;
		if (cityNo != other.cityNo)
			return false;
		if (destNo != other.destNo)
			return false;
		if (planNo != other.planNo)
			return false;
		if (returnDate == null) {
			if (other.returnDate != null)
				return false;
		} else if (!returnDate.equals(other.returnDate))
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

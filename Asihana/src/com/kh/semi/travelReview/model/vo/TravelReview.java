package com.kh.semi.travelReview.model.vo;

public class TravelReview {

	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewWriter;
	private String departureDate; 
	private String arrivalDate; 
	private String partner;
	private int reviewPoint;
	private int count;
	private String createDate; 
	private int cityNo;
	private String planCheck;
	private String status;
	private int likes;
	private String cityName;
	private String nationName;
	
	
	
	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getNationName() {
		return nationName;
	}

	public void setNationName(String nationName) {
		this.nationName = nationName;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public TravelReview() {
	}

	public TravelReview(int reviewNo, String reviewTitle, String reviewContent, String reviewWriter,
			String departureDate, String arrivalDate, String partner, int reviewPoint, int count, String createDate,
			int cityNo, String planCheck, String status) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewWriter = reviewWriter;
		this.departureDate = departureDate;
		this.arrivalDate = arrivalDate;
		this.partner = partner;
		this.reviewPoint = reviewPoint;
		this.count = count;
		this.createDate = createDate;
		this.cityNo = cityNo;
		this.planCheck = planCheck;
		this.status = status;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public String getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public int getReviewPoint() {
		return reviewPoint;
	}

	public void setReviewPoint(int reviewPoint) {
		this.reviewPoint = reviewPoint;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getCityNo() {
		return cityNo;
	}

	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}

	public String getPlanCheck() {
		return planCheck;
	}

	public void setPlanCheck(String planCheck) {
		this.planCheck = planCheck;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TravelReview [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContent="
				+ reviewContent + ", reviewWriter=" + reviewWriter + ", departureDate=" + departureDate
				+ ", arrivalDate=" + arrivalDate + ", partner=" + partner + ", reviewPoint=" + reviewPoint + ", count="
				+ count + ", createDate=" + createDate + ", cityNo=" + cityNo + ", planCheck=" + planCheck + ", status="
				+ status + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((arrivalDate == null) ? 0 : arrivalDate.hashCode());
		result = prime * result + cityNo;
		result = prime * result + count;
		result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + ((departureDate == null) ? 0 : departureDate.hashCode());
		result = prime * result + ((partner == null) ? 0 : partner.hashCode());
		result = prime * result + ((planCheck == null) ? 0 : planCheck.hashCode());
		result = prime * result + ((reviewContent == null) ? 0 : reviewContent.hashCode());
		result = prime * result + reviewNo;
		result = prime * result + reviewPoint;
		result = prime * result + ((reviewTitle == null) ? 0 : reviewTitle.hashCode());
		result = prime * result + ((reviewWriter == null) ? 0 : reviewWriter.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		TravelReview other = (TravelReview) obj;
		if (arrivalDate == null) {
			if (other.arrivalDate != null)
				return false;
		} else if (!arrivalDate.equals(other.arrivalDate))
			return false;
		if (cityNo != other.cityNo)
			return false;
		if (count != other.count)
			return false;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (departureDate == null) {
			if (other.departureDate != null)
				return false;
		} else if (!departureDate.equals(other.departureDate))
			return false;
		if (partner == null) {
			if (other.partner != null)
				return false;
		} else if (!partner.equals(other.partner))
			return false;
		if (planCheck == null) {
			if (other.planCheck != null)
				return false;
		} else if (!planCheck.equals(other.planCheck))
			return false;
		if (reviewContent == null) {
			if (other.reviewContent != null)
				return false;
		} else if (!reviewContent.equals(other.reviewContent))
			return false;
		if (reviewNo != other.reviewNo)
			return false;
		if (reviewPoint != other.reviewPoint)
			return false;
		if (reviewTitle == null) {
			if (other.reviewTitle != null)
				return false;
		} else if (!reviewTitle.equals(other.reviewTitle))
			return false;
		if (reviewWriter == null) {
			if (other.reviewWriter != null)
				return false;
		} else if (!reviewWriter.equals(other.reviewWriter))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
}

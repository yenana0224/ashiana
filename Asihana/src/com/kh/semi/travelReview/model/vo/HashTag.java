package com.kh.semi.travelReview.model.vo;

public class HashTag {
	
	private int reviewNo;
	private int tagNo;
	private String tagName;
	
	public HashTag() {
		super();
	}

	public HashTag(int reviewNo, int tagNo, String tagName) {
		super();
		this.reviewNo = reviewNo;
		this.tagNo = tagNo;
		this.tagName = tagName;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	@Override
	public String toString() {
		return "HashTag [reviewNo=" + reviewNo + ", tagNo=" + tagNo + ", tagName=" + tagName + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + reviewNo;
		result = prime * result + ((tagName == null) ? 0 : tagName.hashCode());
		result = prime * result + tagNo;
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
		HashTag other = (HashTag) obj;
		if (reviewNo != other.reviewNo)
			return false;
		if (tagName == null) {
			if (other.tagName != null)
				return false;
		} else if (!tagName.equals(other.tagName))
			return false;
		if (tagNo != other.tagNo)
			return false;
		return true;
	}
}

package com.kh.semi.plan.model.vo;

public class Schedule {
	
	private int schedNo;
	private int destNo;
	private String category;
	private String schedName;
	private String schedContent;
	private String schedCost;
	
	public Schedule() {
		super();
	}
	

	public Schedule(int destNo, String category, String schedName, String schedContent, String schedCost) {
		super();
		this.destNo = destNo;
		this.category = category;
		this.schedName = schedName;
		this.schedContent = schedContent;
		this.schedCost = schedCost;
	}


	public Schedule(int schedNo, int destNo, String category, String schedName, String schedContent, String schedCost) {
		super();
		this.schedNo = schedNo;
		this.destNo = destNo;
		this.category = category;
		this.schedName = schedName;
		this.schedContent = schedContent;
		this.schedCost = schedCost;
	}
	public int getSchedNo() {
		return schedNo;
	}
	public void setSchedNo(int schedNo) {
		this.schedNo = schedNo;
	}
	public int getDestNo() {
		return destNo;
	}
	public void setDestNo(int destNo) {
		this.destNo = destNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSchedName() {
		return schedName;
	}
	public void setSchedName(String schedName) {
		this.schedName = schedName;
	}
	public String getSchedContent() {
		return schedContent;
	}
	public void setSchedContent(String schedContent) {
		this.schedContent = schedContent;
	}
	public String getSchedCost() {
		return schedCost;
	}
	public void setSchedCost(String schedCost) {
		this.schedCost = schedCost;
	}
	@Override
	public String toString() {
		return "Schedule [schedNo=" + schedNo + ", destNo=" + destNo + ", category=" + category + ", schedName="
				+ schedName + ", schedContent=" + schedContent + ", schedCost=" + schedCost + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + destNo;
		result = prime * result + ((schedContent == null) ? 0 : schedContent.hashCode());
		result = prime * result + ((schedCost == null) ? 0 : schedCost.hashCode());
		result = prime * result + ((schedName == null) ? 0 : schedName.hashCode());
		result = prime * result + schedNo;
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
		Schedule other = (Schedule) obj;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (destNo != other.destNo)
			return false;
		if (schedContent == null) {
			if (other.schedContent != null)
				return false;
		} else if (!schedContent.equals(other.schedContent))
			return false;
		if (schedCost == null) {
			if (other.schedCost != null)
				return false;
		} else if (!schedCost.equals(other.schedCost))
			return false;
		if (schedName == null) {
			if (other.schedName != null)
				return false;
		} else if (!schedName.equals(other.schedName))
			return false;
		if (schedNo != other.schedNo)
			return false;
		return true;
	}
	
	
}

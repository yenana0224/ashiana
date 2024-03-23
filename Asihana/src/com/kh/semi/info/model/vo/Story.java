package com.kh.semi.info.model.vo;

public class Story {
	private int storyNo;
	private String storyTitle;
	private String storyContent;
	private String createDate;
	private String storyFrom;
	
	public Story() {
		super();
	}

	public Story(int storyNo, String storyTitle, String storyContent, String createDate, String storyFrom) {
		super();
		this.storyNo = storyNo;
		this.storyTitle = storyTitle;
		this.storyContent = storyContent;
		this.createDate = createDate;
		this.storyFrom = storyFrom;
	}

	public int getStoryNo() {
		return storyNo;
	}

	public void setStoryNo(int storyNo) {
		this.storyNo = storyNo;
	}

	public String getStoryTitle() {
		return storyTitle;
	}

	public void setStoryTitle(String storyTitle) {
		this.storyTitle = storyTitle;
	}

	public String getStoryContent() {
		return storyContent;
	}

	public void setStoryContent(String storyContent) {
		this.storyContent = storyContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getStoryFrom() {
		return storyFrom;
	}

	public void setStoryFrom(String storyFrom) {
		this.storyFrom = storyFrom;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + ((storyContent == null) ? 0 : storyContent.hashCode());
		result = prime * result + ((storyFrom == null) ? 0 : storyFrom.hashCode());
		result = prime * result + storyNo;
		result = prime * result + ((storyTitle == null) ? 0 : storyTitle.hashCode());
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
		Story other = (Story) obj;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (storyContent == null) {
			if (other.storyContent != null)
				return false;
		} else if (!storyContent.equals(other.storyContent))
			return false;
		if (storyFrom == null) {
			if (other.storyFrom != null)
				return false;
		} else if (!storyFrom.equals(other.storyFrom))
			return false;
		if (storyNo != other.storyNo)
			return false;
		if (storyTitle == null) {
			if (other.storyTitle != null)
				return false;
		} else if (!storyTitle.equals(other.storyTitle))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Story [storyNo=" + storyNo + ", storyTitle=" + storyTitle + ", storyContent=" + storyContent
				+ ", createDate=" + createDate + ", storyFrom=" + storyFrom + "]";
	}
	
}

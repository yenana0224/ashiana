package com.kh.semi.customer.model.vo;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private String noticeHold;
	private String status;
	private int noticeType;
	private String imageFile;
	
	
	public Notice() {
		super();
	}
	
	public Notice(int noticeNo, String noticeTitle, String noticeContent, String noticeWriter, String noticeHold,
			String status, int noticeType, String imageFile) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeHold = noticeHold;
		this.status = status;
		this.noticeType = noticeType;
		this.imageFile = imageFile;
	}
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeHold() {
		return noticeHold;
	}
	public void setNoticeHold(String noticeHold) {
		this.noticeHold = noticeHold;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getNoticeType() {
		return noticeType;
	}
	public void setNoticeType(int noticeType) {
		this.noticeType = noticeType;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", noticeHold=" + noticeHold + ", status=" + status
				+ ", noticeType=" + noticeType + ", imageFile=" + imageFile + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((imageFile == null) ? 0 : imageFile.hashCode());
		result = prime * result + ((noticeContent == null) ? 0 : noticeContent.hashCode());
		result = prime * result + ((noticeHold == null) ? 0 : noticeHold.hashCode());
		result = prime * result + noticeNo;
		result = prime * result + ((noticeTitle == null) ? 0 : noticeTitle.hashCode());
		result = prime * result + noticeType;
		result = prime * result + ((noticeWriter == null) ? 0 : noticeWriter.hashCode());
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
		Notice other = (Notice) obj;
		if (imageFile == null) {
			if (other.imageFile != null)
				return false;
		} else if (!imageFile.equals(other.imageFile))
			return false;
		if (noticeContent == null) {
			if (other.noticeContent != null)
				return false;
		} else if (!noticeContent.equals(other.noticeContent))
			return false;
		if (noticeHold == null) {
			if (other.noticeHold != null)
				return false;
		} else if (!noticeHold.equals(other.noticeHold))
			return false;
		if (noticeNo != other.noticeNo)
			return false;
		if (noticeTitle == null) {
			if (other.noticeTitle != null)
				return false;
		} else if (!noticeTitle.equals(other.noticeTitle))
			return false;
		if (noticeType != other.noticeType)
			return false;
		if (noticeWriter == null) {
			if (other.noticeWriter != null)
				return false;
		} else if (!noticeWriter.equals(other.noticeWriter))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	
	
}

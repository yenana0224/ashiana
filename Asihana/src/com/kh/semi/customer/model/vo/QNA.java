package com.kh.semi.customer.model.vo;

import java.sql.Date;

public class QNA {
	private int QnaNo;  //QNA게시글번호
	private String QnaTitle; // 제목
	private String QnaContent; // 내용
	private Date CreateDate; // 작성일
	private String status; // 답변상태
	private String QnaWriter; // 작성자

	public QNA() {
		super();
	}
	
	public QNA(int qnaNo, String qnaTitle, String qnaContent, Date createDate, String status, String qnaWriter) {
		super();
		QnaNo = qnaNo;
		QnaTitle = qnaTitle;
		QnaContent = qnaContent;
		CreateDate = createDate;
		this.status = status;
		QnaWriter = qnaWriter;
	}

	public int getQnaNo() {
		return QnaNo;
	}

	public void setQnaNo(int qnaNo) {
		QnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return QnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		QnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return QnaContent;
	}

	public void setQnaContent(String qnaContent) {
		QnaContent = qnaContent;
	}

	public Date getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getQnaWriter() {
		return QnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		QnaWriter = qnaWriter;
	}

	@Override
	public String toString() {
		return "QNA [QnaNo=" + QnaNo + ", QnaTitle=" + QnaTitle + ", QnaContent=" + QnaContent + ", CreateDate="
				+ CreateDate + ", status=" + status + ", QnaWriter=" + QnaWriter + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((CreateDate == null) ? 0 : CreateDate.hashCode());
		result = prime * result + ((QnaContent == null) ? 0 : QnaContent.hashCode());
		result = prime * result + QnaNo;
		result = prime * result + ((QnaTitle == null) ? 0 : QnaTitle.hashCode());
		result = prime * result + ((QnaWriter == null) ? 0 : QnaWriter.hashCode());
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
		QNA other = (QNA) obj;
		if (CreateDate == null) {
			if (other.CreateDate != null)
				return false;
		} else if (!CreateDate.equals(other.CreateDate))
			return false;
		if (QnaContent == null) {
			if (other.QnaContent != null)
				return false;
		} else if (!QnaContent.equals(other.QnaContent))
			return false;
		if (QnaNo != other.QnaNo)
			return false;
		if (QnaTitle == null) {
			if (other.QnaTitle != null)
				return false;
		} else if (!QnaTitle.equals(other.QnaTitle))
			return false;
		if (QnaWriter == null) {
			if (other.QnaWriter != null)
				return false;
		} else if (!QnaWriter.equals(other.QnaWriter))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	
	
	
}

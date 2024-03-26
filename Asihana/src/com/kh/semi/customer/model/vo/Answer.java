package com.kh.semi.customer.model.vo;

import java.sql.Date;

public class Answer {
	
	private int replyNo;
	private int qnaNo;
	private String replyComment;
	private String replyWriter;
	private Date commentDate;
	private String status;
	public Answer() {
		super();
	}
	public Answer(int replyNo, int qnaNo, String replyComment, String replyWriter, Date commentDate, String status) {
		super();
		this.replyNo = replyNo;
		this.qnaNo = qnaNo;
		this.replyComment = replyComment;
		this.replyWriter = replyWriter;
		this.commentDate = commentDate;
		this.status = status;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getReplyComment() {
		return replyComment;
	}
	public void setReplyComment(String replyComment) {
		this.replyComment = replyComment;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Answer [replyNo=" + replyNo + ", qnaNo=" + qnaNo + ", replyComment=" + replyComment + ", replyWriter="
				+ replyWriter + ", commentDate=" + commentDate + ", status=" + status + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((commentDate == null) ? 0 : commentDate.hashCode());
		result = prime * result + qnaNo;
		result = prime * result + ((replyComment == null) ? 0 : replyComment.hashCode());
		result = prime * result + replyNo;
		result = prime * result + ((replyWriter == null) ? 0 : replyWriter.hashCode());
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
		Answer other = (Answer) obj;
		if (commentDate == null) {
			if (other.commentDate != null)
				return false;
		} else if (!commentDate.equals(other.commentDate))
			return false;
		if (qnaNo != other.qnaNo)
			return false;
		if (replyComment == null) {
			if (other.replyComment != null)
				return false;
		} else if (!replyComment.equals(other.replyComment))
			return false;
		if (replyNo != other.replyNo)
			return false;
		if (replyWriter == null) {
			if (other.replyWriter != null)
				return false;
		} else if (!replyWriter.equals(other.replyWriter))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}

	
	
	
}

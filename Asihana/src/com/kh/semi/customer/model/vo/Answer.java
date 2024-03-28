package com.kh.semi.customer.model.vo;

import java.sql.Date;

public class Answer {
	
	private int replyNo;
	private int qnaNo;
	private String replyComment;
	private String nickName;
	private int replyWriter;
	private Date commentDate;
	private String status;
	public Answer() {
		super();
	}
	public Answer(int replyNo, int qnaNo, String replyComment, String nickName, int replyWriter, Date commentDate,
			String status) {
		super();
		this.replyNo = replyNo;
		this.qnaNo = qnaNo;
		this.replyComment = replyComment;
		this.nickName = nickName;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(int replyWriter) {
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
		return "Answer [replyNo=" + replyNo + ", qnaNo=" + qnaNo + ", replyComment=" + replyComment + ", nickName="
				+ nickName + ", replyWriter=" + replyWriter + ", commentDate=" + commentDate + ", status=" + status
				+ "]";
	}

	
	
}


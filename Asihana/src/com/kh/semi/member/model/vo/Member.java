package com.kh.semi.member.model.vo;

import java.sql.Date;

public class Member {
//	   MEM_NO NUMBER PRIMARY KEY,
//	    MEM_ID VARCHAR2(20) NOT NULL,
//	    MEM_PWD VARCHAR2(30) NOT NULL,
//	    NICKNAME VARCHAR2(30),
//	    ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
//	    STATUS CHAR(1) DEFAULT 'U' CHECK (STATUS IN('U', 'A', 'B', 'N')),
//	    MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL
	//멤버넘버 멤버아이디 멤버번호 멤버
	
	private int userNo; // 멤버넘버
	private String userId; // 멤버아이디
	private String userPwd; // 멤버 비번
	private String nickName; //멤버 닉네임
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private String eDate; // enrollDate
	private String modiDate; // modifyDate
	
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public String getModiDate() {
		return modiDate;
	}
	public void setModiDate(String modiDate) {
		this.modiDate = modiDate;
	}
	
	public Member(int userNo, String userId, String userPwd, String nickName, Date enrollDate, Date modifyDate,
			String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	public Member() {
		super();
	}
	
	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", nickName=" + nickName
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	public Member(int userNo, String nickName) {
		super();
		this.userNo = userNo;
		this.nickName = nickName;
	}
	
	
	
}

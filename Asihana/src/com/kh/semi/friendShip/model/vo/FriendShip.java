package com.kh.semi.friendShip.model.vo;

public class FriendShip {

//	"FOLLOW_ID" NUMBER NOT NULL ENABLE, 
//	"MEM_NO1" NUMBER NOT NULL ENABLE, 
//	"MEM_NO2" NUMBER NOT NULL ENABLE, 
	
	public int userId1;
	public int userId2;
	private String nickNameF;
	
	public int getUserId1() {
		return userId1;
	}
	public void setUserId1(int userId1) {
		this.userId1 = userId1;
	}
	public int getUserId2() {
		return userId2;
	}
	public void setUserId2(int userId2) {
		this.userId2 = userId2;
	}
	
	
	public String getNickNameF() {
		return nickNameF;
	}
	public void setNickNameF(String nickNameF) {
		this.nickNameF = nickNameF;
	}
	public FriendShip(int userId1, int userId2) {
		super();
		this.userId1 = userId1;
		this.userId2 = userId2;
	}
	
	
	public FriendShip(int userId1, int userId2, String nickNameF) {
		super();
		this.userId1 = userId1;
		this.userId2 = userId2;
		this.nickNameF = nickNameF;
	}
	public FriendShip() {
		super();
	}
	
	@Override
	public String toString() {
		return "FriendShip [userId1=" + userId1 + ", userId2=" + userId2 + ", nickNameF=" + nickNameF + "]";
	}
	
	
	
}

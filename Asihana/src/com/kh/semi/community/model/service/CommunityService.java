package com.kh.semi.community.model.service;

import java.util.ArrayList;

import com.kh.semi.community.model.vo.Community;

public interface CommunityService {
	
	// 가이드라인을 잡아놨다고 생각을 해라!!!!
	// jsp -> controller(servlet) -> service -> dao -> mapper
	// 화면                 화면 지정                                       연산      sql연결       sql문 작성
	
	// 공지사항에서 이루어질 수 있는 기능들 : 목록조회, 상세조회, 작성, 수정, 삭제
	
	// 커뮤니티 목록조회(R) : 몇 개인지는 모르겠지만 커뮤니티 목록을 보겠다=> 배열을 쓸 수 있지만 번거롭다!!!(차면 늘리고 차면 늘리고 깊은 복사를 통해서)
	ArrayList<Community> selectCommunityList();
	
	// 커뮤니티 상세조회(R)
	Community selectCoummunity(int comuNo);
	
	// 커뮤니티  작성(C)
	Community insert(int comuNO);
	
	
	// 커뮤니티 수정(U)
	Community update(int comuNO);
	
	
	// 커뮤니티 삭제(D/U)
	Community delete(int comuNO);
	
	

}

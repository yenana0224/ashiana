package com.kh.semi.community.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.rollback;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.community.model.dao.CommunityDao;
import com.kh.semi.community.model.vo.Community;

public class CommunityServiceImpl {


	public ArrayList<Community> selectCommunityList() {  // 목록조회
		
		Connection conn = getConnection();		
		ArrayList<Community> list =new CommunityDao().selectCommunityList(conn);
			
		close(conn);
		
		
		// 메소드 바디만 채우면 된다!!!!
		return list;
	}

		public Community selectCommunity(int communityNo) {  // 상세조회
		
		Connection conn = getConnection();		
		Community community = new CommunityDao().selectCommunity(conn, communityNo);

		close(conn);
		
		
		
		return community;
	}
	
	public int increaseCount(int CommunityNo) {  // 조회수 증가
		
		Connection conn = getConnection();	
		
		int result = new CommunityDao().increaseCount(conn, CommunityNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		
		close(conn);
		
		return result;
		
	}
	
	public int insert(Community community) { // 글 작성 , 1행 추가한다라는 의미
	 
		Connection conn= getConnection();
		
		int result = new CommunityDao().insert(conn, community);
	
	
	}
	
	

}

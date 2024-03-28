package com.kh.semi.community.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.community.model.dao.CommunityDao;
import com.kh.semi.community.model.vo.Community;

public class CommunityServiceImpl implements CommunityService {

	@Override
	public ArrayList<Community> selectCommunityList() {
		
		Connection conn = getConnection();		
		ArrayList<Community> list =new CommunityDao().selectCommunityList(conn);
			
		close(conn);
		
		
		// 메소드 바디만 채우면 된다!!!!
		return list;
	}

	@Override
	public Community selectCoummunity(int communityNo) {
		
		Connection conn = getConnection();		
		Community community = new CommunityDao().selectCommunity(conn, communityNo);

		close(conn);
		
		
		
		return community;
	}
	
	public int increaseCount(int CommunityNo) {
		
		Connection conn = getConnection();	
		
		int result = new CommunityDao().increaseCount(conn, CommunityNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		
		close(conn);
		
		return result;
		
	}

}

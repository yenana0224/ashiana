package com.kh.semi.community.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

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
		return null;
	}

	@Override
	public Community selectCoummunity(int comuNo) {
		// TODO Auto-generated method stub
		return null;
	}

}

package com.kh.semi.community.model.dao;

import static com.kh.semi.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.community.model.vo.Community;

public class CommunityDao {
	
	private Properties prop =new Properties();
	
	public CommunityDao() {
		
		String fileName = CommunityDao.class
									.getResource("/sql/community/community-mapper.xml")
									.getPath();
		
		try {
			
			
			prop.loadFromXML(new FileInputStream(fileName));
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Community> selectCommunityList(Connection conn){
		
		
		ArrayList<Community> list = new ArrayList(); // 1) 돌려줄 친구가 있어야한다!!!
		ResultSet rset = null; // 2) 결과를 받을 
		PreparedStatement pstmt = null; // 3) 실행하고 결과 받아주는 친구
		
		String sql= prop.getProperty("selectCommunityList"); // 4) 실행할 sql문
		
		
		 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery(); // SELECT문, 완성된 sql문이다!!!  => 위치홀더를 채울 필요가 없다
			
			while(rset.next()) {  // community는 지역변수다!!!
				Community community = new Community();
				community.setComuNo(rset.getInt("COMU_NO"));
				community.setCityNo(rset.getInt("CITY_NO"));		
				community.setMemNo(rset.getInt("MEMBER_NO"));
				community.setComuContent(rset.getString("COMU_CONTENT"));
				community.setComuDate(rset.getDate("COMU_DATE"));
				community.setStatus(rset.getString("STATUS").charAt(0));
			
				list.add(community);  // 위에 있는 지역변수  community를 살려둘수 있게 list가 가리키고 있다!!!
			}
			
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	
	
	

}

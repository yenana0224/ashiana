package com.kh.semi.friendShip.model.dao;

import java.io.FileInputStream;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.friendShip.model.vo.FriendShip;

public class FriendShipDao {
	
	private Properties prop = new Properties();
	
	public FriendShipDao() {
		String sqlFile = FriendShipDao.class.getResource("/sql/friendShip/friendShip-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(sqlFile));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<FriendShip> selectList(Connection conn, int userNo) {
	
		ArrayList <FriendShip> list = new ArrayList();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				list.add(new FriendShip(rset.getInt("MEM_NO1"),
										rset.getInt("MEM_NO2"),
										rset.getString("NICKNAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertFriendShip(Connection conn, FriendShip friendShip) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFriendShip");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1,friendShip.getUserId1());
			pstmt.setInt(2,friendShip.getUserId2());
					
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteFriendShip(Connection conn, FriendShip friendShip) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFriendShip");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1,friendShip.getUserId1());
			pstmt.setInt(2,friendShip.getUserId2());
					
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
}

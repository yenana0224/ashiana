package com.kh.semi.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.info.model.dao.InfoDao;
import static com.kh.semi.common.JDBCTemplate.*;
public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		String filePath = InfoDao.class.getResource("/sql/admin/admin-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// notice 전체 고정 해제
	public int holdN(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("holdN");
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 선택한 noticeNo만 고정
	public int changeHolds(Connection conn, int hold) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changeHolds");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hold);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}

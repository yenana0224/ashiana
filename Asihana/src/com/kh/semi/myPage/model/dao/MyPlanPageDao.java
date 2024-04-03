package com.kh.semi.myPage.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.semi.customer.model.dao.CustomerDao;
public class MyPlanPageDao {


	private Properties prop = new Properties();
	
	public MyPlanPageDao() {
		String filePath = MyPlanPageDao.class.getResource("/sql/myPage/myPage-mapper.xml").getPath();
			
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 전체 조회 카운트
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public int selectCount(Connection conn, int userNo) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				
				rset = pstmt.executeQuery();
				if(rset.next()) {
					result = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return result;
		}
}

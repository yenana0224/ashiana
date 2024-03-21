package com.kh.semi.customer.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.customer.model.vo.Notice;


public class CustomerDao {

	private Properties prop = new Properties();
	
	public CustomerDao() {
		String filePath = CustomerDao.class.getResource("/sql/customer/customer-mapper.xml").getPath();
			
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Notice[] notice(Connection conn) {
		
		Notice[] notice = new Notice[3];
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("notice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			for(int i = 0; i < notice.length; i++) {
				if(rset.next()) {
					Notice n = new Notice();
					n.setNoticeNo(rset.getInt("NOTICE_NO"));
					n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
					notice[i] = n;
				} 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return notice;
	}
	
	public ArrayList<Notice> noticeList(Connection conn){
		
		ArrayList<Notice> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeList");
	}
	
	
	
}

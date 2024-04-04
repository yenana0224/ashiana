package com.kh.semi.myPage.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

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
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.pageInfo.model.vo.PageInfo;
import com.kh.semi.plan.model.vo.PlanMain;
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
	
	/**
	 * 도시내용으로 카운트
	 * @param conn
	 * @param searchContent
	 * @param userNo
	 * @return
	 */
	public int selectContentCount(Connection conn, String searchContent, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectContentCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchContent);
			pstmt.setInt(2, userNo);
			
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
	
	/**
	 * 제목으로 카운트
	 * @param conn
	 * @param searchContent
	 * @param userNo
	 * @return
	 */
	public int selectTitleCount(Connection conn, String searchContent, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTitleCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchContent);
			pstmt.setInt(2, userNo);
			
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
	
	

	public List<PlanMain> selectList(Connection conn, PageInfo pi,int userNo) {
		
		List<PlanMain> list = new ArrayList();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new PlanMain(rset.getInt("PLAN_NO"),
								      rset.getString("START_DATE"),
								      rset.getString("END_DATE"),
								      rset.getString("TRAVEL_DATE"),
								      rset.getString("D_DAY"),
								      rset.getString("PLAN_CITYS"),
								      rset.getString("TOTAL_PRICE"),
								      rset.getString("UPLOAD_DATE")));
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

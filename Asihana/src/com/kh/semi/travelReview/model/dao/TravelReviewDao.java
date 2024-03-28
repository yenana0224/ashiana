package com.kh.semi.travelReview.model.dao;

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

import com.kh.semi.friendShip.model.vo.FriendShip;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.travelReview.model.vo.TravelReview;

public class TravelReviewDao {
	
	private Properties prop = new Properties();
	
	public TravelReviewDao() {
		
		String filePath = TravelReviewDao.class.getResource("/sql/travelReview/travelReview-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<City> selectCityList(Connection conn){
		
		List<City> cityList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCityList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				City city = new City();
				
				city.setCityName(rset.getString("CITY_NAME"));
				city.setNationName(rset.getString("NATION_NAME"));
				cityList.add(city);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cityList;
	}
	
	public List<TravelReview> selectReviewList(Connection conn){
		
		List<TravelReview> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				TravelReview review = new TravelReview();
				
				review.setReviewNo(rset.getInt("REVIEW_NO"));
				review.setReviewTitle(rset.getString("REVIEW_TITLE"));
				review.setReviewWriter(rset.getString("NICKNAME"));
				review.setCreateDate(String.valueOf(rset.getDate("CREATE_DATE")));
				list.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public List<TravelReview> selectLikeList(Connection conn){
		
		List<TravelReview> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLikeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				TravelReview t = new TravelReview();
					
				t.setReviewNo(rset.getInt("REVIEW_NO"));
				t.setReviewTitle(rset.getString("REVIEW_TITLE"));
				t.setReviewContent(rset.getString("REVIEW_CONTENT"));
				t.setReviewWriter(rset.getString("NICKNAME"));
				t.setCreateDate(String.valueOf(rset.getDate("CREATE_DATE")));
				t.setLikes(rset.getInt("LIKES"));
				list.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int updateReviewCount(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	public ArrayList<TravelReview> selectMyList(Connection conn, int userNo) {
		
		ArrayList <TravelReview> list = new ArrayList();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				list.add(new TravelReview(rset.getInt("REVIEW_NO"),
										rset.getString("REVIEW_TITLE"),
										rset.getString("CITY_NAME"),
										rset.getString("CREATE_DATE"),
										rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}

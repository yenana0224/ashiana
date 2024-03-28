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

import com.kh.semi.info.model.vo.City;
import com.kh.semi.travelReview.model.vo.HashTag;
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
				city.setCityNo(rset.getInt("CITY_NO"));
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
	
	public TravelReview selectDetailReview(Connection conn, int reviewNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDetailReview");
		TravelReview review = null;

		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			rset.next();
			
			review = new TravelReview();
			
			review.setReviewNo(rset.getInt("REVIEW_NO"));
			review.setReviewTitle(rset.getString("REVIEW_TITLE"));
			review.setReviewContent(rset.getString("REVIEW_CONTENT"));
			review.setReviewWriter(rset.getString("NICKNAME"));
			review.setCreateDate(String.valueOf(rset.getDate("CREATE_DATE")));
			review.setDepartureDate(String.valueOf(rset.getDate("DEPARTURE_DATE")));
			review.setArrivalDate(String.valueOf(rset.getDate("ARRIVAL_DATE")));
			review.setPartner(rset.getString("PARTNER"));
			review.setReviewPoint(rset.getInt("STAR_POINT"));
			review.setCityName(rset.getString("CITY_NAME"));
			review.setNationName(rset.getString("NATION_NAME"));
			review.setPlanCheck(rset.getString("PLAN_CHECK"));
			review.setLikes(rset.getInt("LIKES"));
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return review;
	
	}
	/***
	 * 내 여행기
	 * @param conn
	 * @param userNo
	 * @return
	 */
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
	
public ArrayList<TravelReview> selectOthersList(Connection conn, int userNo) {
		
		ArrayList <TravelReview> list = new ArrayList();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOthersList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				list.add(new TravelReview(rset.getInt("REVIEW_NO"),
										rset.getString("DEPARTURE_DATE"),
										rset.getString("REVIEW_TITLE"),
										rset.getInt("COUNT"),
										rset.getString("CITY_NAME"),
										rset.getString("NICKNAME")
									));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
		
	}
	
	public List<HashTag> selectReviewHashTagList(Connection conn, int reviewNo){
		
		List<HashTag> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewHashTagList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				HashTag t = new HashTag();
				
				t.setReviewNo(rset.getInt("REVIEW_NO"));
				t.setTagNo(rset.getInt("TAG_NUM"));
				t.setTagName(rset.getString("TAG_NAME"));
				
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
	
	public List<HashTag> selectHashTagList(Connection conn){
		
		List<HashTag> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHashTagList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				HashTag tList = new HashTag();
				
				tList.setTagNo(rset.getInt("TAG_NUM"));
				tList.setTagName(rset.getString("TAG_NAME"));
				
				list.add(tList);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		//System.out.println(list);
		return list;
	}
	
	public List<HashTag> selectCheckedTagList(Connection conn){
		
		List<HashTag> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCheckedTagList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				HashTag t = new HashTag();
				
				t.setReviewNo(rset.getInt("REVIEW_NO"));
				t.setTagNo(rset.getInt("TAG_NUM"));
				t.setTagName(rset.getString("TAG_NAME"));
				
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
	
}

package com.kh.semi.travelReview.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.friendShip.model.dao.FriendShipDao;
import com.kh.semi.friendShip.model.vo.FriendShip;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.travelReview.model.dao.TravelReviewDao;
import com.kh.semi.travelReview.model.vo.TravelReview;

public class TravelReviewService {

	public List<City> selectCityList(){
		
		Connection conn = getConnection();
		
		List<City> cityList = new TravelReviewDao().selectCityList(conn); 
		
		
		return cityList;
	}
	
	
	public List<TravelReview> selectReviewList(){
		
		
		// 커넥션 
		Connection conn = getConnection();
		
		List<TravelReview> list = new TravelReviewDao().selectReviewList(conn);
		

		close(conn);
		
		return list;
	}
	
	public List<TravelReview> selectLikeList(){
		
		Connection conn = getConnection();
		
		List<TravelReview> likeList = new TravelReviewDao().selectLikeList(conn);
		
		close(conn);
		
		return likeList;
	}
	
	
	public int updateReviewCount(int reviewNo) {
		
		Connection conn = getConnection();
		
		int result = new TravelReviewDao().updateReviewCount(conn, reviewNo);
		
		// 트랜잭션 처리
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		return result;
	}
	
	public ArrayList<TravelReview> selectMyList(int userNo) {
		Connection conn = getConnection();

		ArrayList<TravelReview> list = new TravelReviewDao().selectMyList(conn, userNo);

		close(conn);
		
		return list;

	}
}

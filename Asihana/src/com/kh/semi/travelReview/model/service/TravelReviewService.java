package com.kh.semi.travelReview.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.travelReview.model.dao.TravelReviewDao;
import com.kh.semi.travelReview.model.vo.TravelReview;

public class TravelReviewService {

	
	public List<TravelReview> selectReviewList(){
		
		
		// 커넥션 
		Connection conn = JDBCTemplate.getConnection();
		
		List<TravelReview> list = new TravelReviewDao().selectReviewList(conn);
		

		JDBCTemplate.close(conn);
		
		return list;
	}
	
}

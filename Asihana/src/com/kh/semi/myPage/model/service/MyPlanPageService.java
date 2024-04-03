package com.kh.semi.myPage.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.customer.model.dao.CustomerDao;
import com.kh.semi.myPage.model.dao.MyPlanPageDao;
import com.kh.semi.pageInfo.model.vo.PageInfo;
import com.kh.semi.plan.model.vo.PlanMain;

public class MyPlanPageService {

	/***
	 * 검색 목록조회
	 * @param select
	 * @param searchContent
	 * @param userNo
	 * @param pi
	 * @return
	 */
	public List<PlanMain> planSearch(String select, String searchContent, int userNo, PageInfo pi) {
			
		Connection conn = getConnection();
		
		if(select.equals("title")) {
			List<PlanMain> list = new MyPlanPageDao().planTitleSearch(conn, searchContent, pi);
		} else {
			List<PlanMain> list = new MyPlanPageDao().planContentSearch(conn, searchContent, pi);
		}
		
		
		close(conn);
		
		return list;
	}
	
	/***
	 * 검색없는 리스트 조회 ()
	 * @param userNo
	 * @param pi
	 * @return
	 */
	public List<PlanMain> selectList(int userNo, PageInfo pi) {
		
		Connection conn = getConnection();
		
		List<PlanMain> list = new MyPlanPageDao().selectList(conn, pi, userNo);
		
		close(conn);
		
		return list;
	}

	/****
	 * 페이징 위한 해당 전체 게시물 수
	 * @param select
	 * @param searchContent
	 * @param userNo
	 * @return
	 */
	public int selectPlanListCount(String select, String searchContent, int userNo) {
		
			Connection conn = getConnection();
			
			int result = 0;
			
			if(searchContent != null) {//검색내용있는데
				if(select.equals("title")) {//검색조건이 제목일떄
					result = new MyPlanPageDao().selectTitleCount(conn, searchContent, userNo);
				} else {//검색조건이 제목이 아닐떄
					result = new MyPlanPageDao().selectContentCount(conn, searchContent, userNo);
				}
			}else {//
				result = new MyPlanPageDao().selectCount(conn,userNo);
			}
			
			close(conn);
			
			return result;
		}
	
}

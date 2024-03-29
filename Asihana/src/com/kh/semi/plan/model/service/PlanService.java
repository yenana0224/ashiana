package com.kh.semi.plan.model.service;

import com.kh.semi.plan.model.dao.PlanDao;
import com.kh.semi.plan.model.vo.Destination;
import com.kh.semi.plan.model.vo.DestinationDetail;
import com.kh.semi.plan.model.vo.PlanDetail;
import com.kh.semi.plan.model.vo.PlanMain;
import com.kh.semi.plan.model.vo.Schedule;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

public class PlanService {
	

	public List<PlanMain> selectPlanList(int userNo) {
		
		Connection conn = getConnection();
		
		List<PlanMain> list = new PlanDao().selectPlanList(conn, userNo);
		
		close(conn);
		
		return list;
	}

	public int userPlanCheck(int userNo, int planNo) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().userPlanCheck(conn, userNo, planNo);
		
		close(conn);
		
		return result;
	}

	public PlanDetail selectPlanDetail(int planNo) {
		
		Connection conn = getConnection();
		
		PlanDetail planDetail = new PlanDao().selectPlanDetail(conn, planNo);
		
		close(conn);
		
		return planDetail;
	}

	public List<DestinationDetail> selectDesDetail(int planNo, String status) {
		
		Connection conn = getConnection();
		
		List<DestinationDetail> list = new PlanDao().selectDesDetail(conn, planNo, status);
		
		close(conn);
		
		return list;
	}

	public List<Schedule> selectSchedule(int destNo, String status) {
		
		Connection conn = getConnection();
		
		List<Schedule> list = new PlanDao().selectSchedule(conn, destNo, status);
		
		close(conn);
		
		return list;
	}

	public int insertPlan(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().insertPlan(conn, userNo);
		
		if(result > 0) commit(conn);
		
		close(conn);
		
		return result;
	}

	public int selectInsertPlan(int userNo) {
		
		Connection conn = getConnection();
		
		int planNo = new PlanDao().selectInsertPlan(conn, userNo);
		
		close(conn);
		
		return planNo;
	}

	public int insertStartDestination(int planNo, String returnDate) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().insertStartDestination(conn, planNo, returnDate);
		
		if(result > 0) commit(conn);
		
		close(conn);
		
		return result;
	}
	
	public int insertDestination(Destination des) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().insertDestination(conn, des);
		
		if(result > 0) commit(conn);
		
		close(conn);
		
		return result;
	}

	public int updateStartDestination(int destNo, String returnDate) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().updateStartDestination(conn, destNo, returnDate);
		
		if(result > 0) commit(conn);
		
		close(conn);
		
		return result;
	}




}

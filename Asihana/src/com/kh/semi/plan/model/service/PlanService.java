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

	public PlanDetail selectPlanDetail(int planNo, String status) {
		
		Connection conn = getConnection();
		
		PlanDetail planDetail = new PlanDao().selectPlanDetail(conn, planNo, status);
		
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

	public void deletePlanCache(int userNo) {
		
		Connection conn = getConnection();
		
		if(new PlanDao().deletePlanCache(conn, userNo) > 0) commit(conn);
		
		close(conn);
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
	
	public int updateStartDestination(int destNo, String returnDate) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().updateStartDestination(conn, destNo, returnDate);
		
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

	public int insertSchedule(Schedule sched) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().insertSchedule(conn, sched);
		
		if(result > 0) commit(conn);
		
		close(conn);
		
		return result;
	}

	public int insertEndDestination(Destination des) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().insertEndDestination(conn, des);
		
		if(result > 0) commit(conn);
		
		close(conn);
		
		return result;
	}

	public int publishPlan(int planNo, int scheds) {
		
		Connection conn = getConnection();
		
		int sResult = 1;
		if(scheds != new PlanDao().publishSched(conn, planNo)) sResult = 0;
		int dResult = new PlanDao().publishDest(conn, planNo);
		int pResult = new PlanDao().publishPlan(conn, planNo);
		
		int result = sResult * dResult * pResult;
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int updateDestination(Destination des) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().updateDestination(conn, des);
		
		if(result > 0) commit(conn);
		
		close(conn);
		
		return result;
	}

	public int deleteDestCache(int destNo) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().deleteDestCache(conn, destNo);
		
		if(result > 0) commit(conn);

		close(conn);
		
		return result;
	}
	
	public void deleteSchedCache(int destNo) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().deleteSchedCache(conn, destNo);
		
		if(result > 0) commit(conn);

		close(conn);
		
	}
	
	public int updateSched(Schedule sched) {
		
		Connection conn = getConnection();
		
		int result = new PlanDao().updateSched(conn, sched);
		
		if(result > 0) commit(conn);
		
		close(conn);
		
		return result;
	}

	public int deletePlan(int planNo) {
		
		Connection conn = getConnection();

		new PlanDao().deleteSched(conn, planNo);
		int resultD = new PlanDao().deleteDest(conn, planNo);
		int resultP = new PlanDao().deletePlan(conn, planNo);

		if(resultD * resultP > 0) commit(conn);
		else rollback(conn);
		
		return resultD * resultP;
	}









}

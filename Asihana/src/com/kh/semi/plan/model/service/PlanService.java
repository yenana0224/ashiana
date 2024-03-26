package com.kh.semi.plan.model.service;

import com.kh.semi.plan.model.dao.PlanDao;
import com.kh.semi.plan.model.vo.PlanDetail;
import com.kh.semi.plan.model.vo.PlanMain;
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

}

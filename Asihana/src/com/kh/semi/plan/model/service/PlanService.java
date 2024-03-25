package com.kh.semi.plan.model.service;

import com.kh.semi.plan.model.dao.PlanDao;
import com.kh.semi.plan.model.vo.PlanMain;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class PlanService {
	

	public ArrayList<PlanMain> selectPlanList(int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<PlanMain> list = new PlanDao().selectPlanList(conn, userNo);
		
		close(conn);
		
		return list;
		
	}

}

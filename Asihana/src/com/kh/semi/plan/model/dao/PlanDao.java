package com.kh.semi.plan.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.plan.model.vo.PlanMain;


public class PlanDao {
	
	private Properties prop = new Properties();
	
	{
		String sqlFile = PlanDao.class.getResource("/sql/plan/plan-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(sqlFile));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public ArrayList<PlanMain> selectPlanList(Connection conn, int userNo) {
		
		
		
		
		return null;
	}

}

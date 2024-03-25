package com.kh.semi.plan.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.kh.semi.common.JDBCTemplate.*;

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
	

	public List<PlanMain> selectPlanList(Connection conn, int userNo) {
		
		List<PlanMain> list = new ArrayList();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectPlanList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new PlanMain(rset.getInt("PLAN_NO"),
								      rset.getString("START_DATE"),
								      rset.getString("END_DATE"),
								      rset.getString("TRAVEL_DATE"),
								      rset.getString("D_DAY"),
								      rset.getString("PLAN_CITYS"),
								      rset.getString("TOTAL_PRICE"),
								      rset.getString("UPLOAD_DATE")));
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

package com.kh.semi.plan.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.plan.model.vo.Destination;
import com.kh.semi.plan.model.vo.DestinationDetail;
import com.kh.semi.plan.model.vo.PlanDetail;
import com.kh.semi.plan.model.vo.PlanMain;
import com.kh.semi.plan.model.vo.Schedule;


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


	public int userPlanCheck(Connection conn, int userNo, int planNo) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("userPlanCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, planNo);
			rset = pstmt.executeQuery();
			
			rset.next();
			result = rset.getInt("COUNT(*)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}


	public PlanDetail selectPlanDetail(Connection conn, int planNo) {
		
		PlanDetail planDetail = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectPlanDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, planNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				planDetail = new PlanDetail(rset.getInt("PLAN_NO"),
						                    rset.getString("START_DATE"),
						                    rset.getString("START_TIME"),
						                    rset.getString("END_DATE"),
						                    rset.getString("START_TIME"),
						                    rset.getString("TRAVEL_DATE"),
						                    rset.getString("TRANS_SUM"),
						                    rset.getString("SCHED_SUM"),
						                    rset.getString("TOTAL_SUM"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return planDetail;
	}


	public List<DestinationDetail> selectDesDetail(Connection conn, int planNo, String status) {
		
		List<DestinationDetail> list = new ArrayList();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectDesDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, planNo);
			pstmt.setString(2, status);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new DestinationDetail(rset.getInt("DEST_NO"),
						                       rset.getString("CITY_NAME"),
						                       rset.getString("TRANS"),
						                       rset.getString("TRIP"),
						                       rset.getString("TRANS_PRICE"),
						                       rset.getString("ARRIVAL"),
						                       rset.getString("RETURN_DATE"),
						                       rset.getString("DEST_DATE"),
						                       rset.getString("SCHED_COST_SUM")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public List<Schedule> selectSchedule(Connection conn, int destNo, String status) {
		
		List<Schedule> list = new ArrayList();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, destNo);
			pstmt.setString(2, status);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Schedule(rset.getInt("SCHED_NO"),
									  rset.getInt("DEST_NO"),
									  rset.getString("CATEGORY"),
									  rset.getString("SCHED_NAME"),
									  rset.getString("SCHED_CONTENT"),
									  rset.getString("SCHED_COST")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertPlan(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;	
		
		String sql = prop.getProperty("insertPlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectInsertPlan(Connection conn, int userNo) {
		
		int planNo = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;	
		
		String sql = prop.getProperty("selectInsertPlan");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				planNo = rset.getInt("PLAN_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return planNo;
	}

	public int insertStartDestination(Connection conn, int planNo, String returnDate) {
		
		int result = 0;
		PreparedStatement pstmt = null;	
		
		String sql = prop.getProperty("insertStartDestination");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, planNo);
			pstmt.setString(2, returnDate);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateStartDestination(Connection conn, int destNo, String returnDate) {
		
		int result = 0;
		PreparedStatement pstmt = null;	
		
		String sql = prop.getProperty("updateStartDestination");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, returnDate);
			pstmt.setInt(2, destNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertDestination(Connection conn, Destination des) {
		
		int result = 0;
		PreparedStatement pstmt = null;	
		
		String sql = prop.getProperty("insertDestination");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, des.getPlanNo());
			pstmt.setInt(2, des.getCityNo());
			pstmt.setString(3, des.getTrans());
			pstmt.setInt(4, Integer.parseInt(des.getTransPrice().trim()));
			pstmt.setString(5, des.getTrip());
			pstmt.setString(6, des.getArrival());
			pstmt.setString(7, des.getReturnDate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


}

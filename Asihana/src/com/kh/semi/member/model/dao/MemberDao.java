package com.kh.semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {
		String sqlFile = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(sqlFile));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/***
	 * 로그인세션
	 * @param conn
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public Member login(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;

		String sql = prop.getProperty("login");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getInt("MEM_NO"),
								rset.getString("MEM_ID"),
								rset.getString("MEM_PWD"),
								rset.getString("NICKNAME"),
								rset.getDate("ENROLL_DATE"),
								rset.getDate("MODIFY_DATE"),
								rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return m;
		
	}
	
	
	/***
	 * 회원가입
	 * @param conn
	 * @param member
	 * @return
	 */
	public int insertMember(Connection conn, Member member) {
		//INSERT문 => 처리된 행의 개수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//위치홀더 채우기
			pstmt.setString(1,member.getUserId());
			pstmt.setString(2,member.getUserPwd());
			pstmt.setString(3,member.getNickName());
			
			//SQL 실행 후 결과받기
			//insert/update / delete=>executeUpdate()
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		//결과 반환
		
		return result;
	}
	
	/***
	 * 아디중복체크
	 * @param conn
	 * @param checkId
	 * @return
	 */
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			rset.next();
			count = rset.getInt("COUNT(*)");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		return count;
	}
	
	/**
	 * 로그인 
	 * @param conn
	 * @param userId
	 * @return
	 */

	public Member selectMember(Connection conn, String userId) {
		Member updateMem=null;
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				updateMem=new Member(rset.getInt("MEM_NO"),
									rset.getString("MEM_ID"),
									rset.getString("MEM_PWD"),
									rset.getString("NICKNAME"),
									rset.getDate("ENORLL_DATE"),
									rset.getDate("MODIFY_DATE"),
									rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return updateMem;
	}
	
}

package com.kh.semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	
	/**
	 * 회원정보수정
	 * @param conn
	 * @param member
	 * @return
	 */
	public int updateMember(Connection conn, Member member) {
		//UPDATE => 처리된 행의 개수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,member.getNickName());
			pstmt.setString(2,member.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
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
									rset.getDate("ENROLL_DATE"),
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
	

	public Member selectOtMember(Connection conn, int userNo) {
		Member member=null;
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOtMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,userNo);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				member=new Member(rset.getInt("MEM_NO"),
									rset.getString("MEM_ID"),
									rset.getString("MEM_PWD"),
									rset.getString("NICKNAME"),
									rset.getDate("ENROLL_DATE"),
									rset.getDate("MODIFY_DATE"),
									rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		System.out.println("userNo = "+userNo);
		System.out.println("member dao"+member);
		
		return member;
	}
	
	/***
	 * 회원탈퇴
	 * @param conn
	 * @param userPwd
	 * @param userNo
	 * @return
	 */
	public int delete(Connection conn, String userPwd, int userNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userPwd);
			pstmt.setInt(2,userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * 비밀번호 수정
	 * @param conn
	 * @param userNo
	 * @param userPwd
	 * @param changePwd
	 * @return
	 */
	public int updatePwd(Connection conn, int userNo, String userPwd, String changePwd) {
		
		//UPDATE문 => 처리된 행의 개수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, changePwd);
			pstmt.setInt(2, userNo);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;

		
	}
	
	public ArrayList<Member> selectFriendList(Connection conn) {

		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		String sql = prop.getProperty("selectFriendList");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Member m = new Member();
				m.setUserNo(rset.getInt("MEM_NO"));
				m.setNickName(rset.getString("NICKNAME"));
				list.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
}

package com.kh.semi.member.model.service;

import java.sql.Connection;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;

public class MemberService {

	/**
	 * 로그인 세션
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public Member login(String userId, String userPwd) {
		// Service => Connection 객체 생성

		// 1) Connection객체 생성
		Connection conn = JDBCTemplate.getConnection();

		// 2) Controller에서 넘어온 전달값과 Connection객체를 DAO메소드를 호출하면서 전달
		Member loginUser = new MemberDao().login(conn, userId, userPwd);
		JDBCTemplate.close(conn);
		return loginUser;
	}
	
	/**
	 *	회원가입
	 * @param member
	 * @return
	 */
	public int insertMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().insertMember(conn, member);
		// 성공했다면 1, 실패했다면 0
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	/**
	 * 아디 중복체크
	 * @param checkId
	 * @return
	 */
	public int idCheck(String checkId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new MemberDao().idCheck(conn,checkId);
		
		JDBCTemplate.close(conn);
		
		return count;
	}
	
	/**
	 * 로그인
	 * @param userId
	 * @return
	 */
	public Member selectMember(String userId) {
		Connection conn = JDBCTemplate.getConnection();

		Member updateMem = new MemberDao().selectMember(conn, userId);
		JDBCTemplate.close(conn);

		return updateMem;
	}
}

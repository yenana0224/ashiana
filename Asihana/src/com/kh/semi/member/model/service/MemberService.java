package com.kh.semi.member.model.service;

import java.sql.Connection;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;

public class MemberService {

	
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
}

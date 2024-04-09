package com.kh.semi.community.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.community.model.service.CommunityServiceImpl;
import com.kh.semi.community.model.vo.Community;

/**
 * Servlet implementation class CommunityInsertController
 */
@WebServlet("/insert.commu")
public class CommunityInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		// 1) POST
		//request.setCharacterEncoding("UTF-8");
		
		// 2) 값뽑기
		//String cityname = request.getParameter("cityname");
		//String context  = request.getParameter("context");
		//String memberNo = request.getParameter("memberNo");
		
		// COMMUNITY테이블에서 INSERT시점에 MEMBER_NO컬럼이 NOT NULL제약조건
		//  추가적으로 공지사항 작성자의  MEMBER_NO가필요함!!!
		
		// 3) 데이터 가공
		//Community community = new Community();
		//community.setCityName(cityname);
		//community.setComuContent(context);
		//community.setMemberNickname(memberNo);
		
		// 4) Service단으로 넘겨주기~
		// new CommunityServiceImpl().insert(community);
		// INSERT INTO COMMUNITY VALUES(시퀀스, 사용자가 선택한 도시, 입력한 내용, 커뮤니티 사용자의ㅏ 회원번호)
		
		
		
		
		//
		
		
		
	
	
		// 응답화면 지정
		request.getRequestDispatcher("views/community/communityListEnrollForm.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

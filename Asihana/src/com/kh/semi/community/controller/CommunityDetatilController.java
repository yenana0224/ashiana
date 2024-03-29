package com.kh.semi.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.community.model.service.CommunityServiceImpl;
import com.kh.semi.community.model.vo.Community;

/**
 * Servlet implementation class CommunityDetatilController
 */
@WebServlet("/detail.commu")
public class CommunityDetatilController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDetatilController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		// 1)  GET방식 => 인코딩 X
		
		// 2) request로부터 값 뽑기
		//localhost:7776/Asihana/detail.commu?communityNo=2 => 이렇게 요청이 와서 일을 하는중!!!
		//localhost:7776/Asihana/detail.commu?communityNo=글번호
		int communityNo = Integer.parseInt(request.getParameter("communityNo"));
		
		// 3) VO가공
		// 넘긴 값이 하나밖에 없다 => 가공이 불필요하다!!!
	
		// 4) Service 호출
		int result = new CommunityServiceImpl().increaseCount(communityNo);
		
		if(result > 0) {
			
			
			// 5) 화면 지정
			Community community = new CommunityServiceImpl().selectCommunity(communityNo);
			
			if(community != null) {
				
				request.setAttribute("community", community);
				request.getRequestDispatcher("views/community/communityDetail.jsp").forward(request,response);
		
			} else {
				
				request.setAttribute("errorMsg", "공지사항 상세 조회실패!!!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
				
				
			}
			
			
		} else {// 실패 => 에러페이지 보내기
			// 5) 화면 지정
			request.setAttribute("errorMsg", "공지사항 상세 조회실패!!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

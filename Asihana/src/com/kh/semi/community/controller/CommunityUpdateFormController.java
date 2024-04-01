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
 * Servlet implementation class CommunityUpdateFormController
 */
@WebServlet("/updateForm.commu")
public class CommunityUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	// GET방식
		
	// 값뽑기
	int communityNo=Integer.parseInt(request.getParameter("communityNo"));
	
	// 가공
	
	//서비스호출
	Community community = new CommunityServiceImpl(),selectCommunity(communityNo);
	
	request.setAttribute("community", community);	
		
	
		
	request.getRequestDispatcher("views/community/communityUpdateForm.jsp").forward(request, response);		
	
	
	}

	private void selectCommunity(int communityNo) {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

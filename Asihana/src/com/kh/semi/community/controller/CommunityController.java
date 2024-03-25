package com.kh.semi.community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.community.model.service.CommunityService;
import com.kh.semi.community.model.service.CommunityServiceImpl;
import com.kh.semi.community.model.vo.Community;

/**
 * Servlet implementation class communityController
 */
@WebServlet("/commu.List")
public class CommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		// 1) 어떤 방식인지 생각!!! => a태그로 들어온다!!! => GET방식 => 인코딩 불필요
		
		
		
		
		// 2) 값 뽑기
		
		
		
		
		// 3) 값 가공 => 할게 없다
		
		// 화면을 띄워주기 전 COMMUNITY테이블에 있는 전체 행의 데이터를 조회해서 응답페이지에 전달해야함!!
		
		// Service단으로 SELECT요청~
		// 커뮤니티 목록 => 가져올 행의 개수 : 최소 0개 ~~~ ?? => List
		//ArrayList<Community> list = new CommunityServiceImpl().selectCommunityList();
		//request.setAttribute("community",list); // 커뮤니티에서만 본다  => request, 커뮤니티에서만 보는게 아니다~ => session
	
		// 화면지정
		request.getRequestDispatcher("views/communiry/communityList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

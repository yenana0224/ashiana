package com.kh.semi.community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.community.model.service.CommunityService;
import com.kh.semi.community.model.vo.Community;

/**
 * Servlet implementation class communityController
 */
@WebServlet("/read.commu")
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
		
	
		// 1.어떤 방식인지 생각 => GET방식 => 인코딩 불필요
		
		// 2.값 뽑아보기
		
		
		
		// 값 가공 => 할게 없다
		
		// service지정 => 얼마나 조회가 되는지 모른다!!!
		ArrayList<Community> list = new CommunityService().selectCommu();
		request.setAttribute("community",list);
	
		// 화면지정
		request.getRequestDispatcher("views/community/read.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

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
 * Servlet implementation class CommunityUpdateController
 */
@WebServlet("/update.commu")
public class CommunityUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		// POST방식 => 게시글,내용,분문이 있는것은어쩔수 없다 길이제한 때문에!!!
		// 1) 인코딩 => 영어는 상관이 없으나 한글이 있을 수 있기 때문에 필수!!!
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값뽑기!!!
		String CityName=request.getParameter("CityName");
		String ComuContent=request.getParameter("ComuContent");
		int ComuNo=Integer.parseInt(request.getParameter("ComuNo"));
		
		// 3) 가공하기 => 두개 이상이니 가공을 해준다!!!
		Community community = new Community();
		community.setCityName(CityName);
		community.setComuContent(ComuContent);
		community.setComuNo(ComuNo);
		
		// 서비스 호출
		new CommunityServiceImpl().update(community);
		// UPDATE COMMUNITY SET CITY_NAME =?, COMU_CONTENT =?
		// WHERE COMU_NO =?
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.kh.semi.travelReview.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.friendShip.controller.TravelReview;
import com.kh.semi.friendShip.controller.TravelReviewService;
import com.kh.semi.friendShip.model.service.FriendShipService;
import com.kh.semi.friendShip.model.vo.FriendShip;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class MyTravelController
 */
@WebServlet("/myTravel")
public class MyTravelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTravelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		//세션에서 유저넘버 받아오기
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		ArrayList<TravelReview> myTravelList = new TravelReviewService().selectMyList(userNo);
		
		request.setAttribute("myTravelList", myTravelList);
		
		request.getRequestDispatcher("views/member/MyTravel.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

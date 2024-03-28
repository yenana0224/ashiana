package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.vo.Member;
import com.kh.semi.plan.model.service.PlanService;
import com.kh.semi.plan.model.vo.PlanMain;
import com.kh.semi.travelReview.model.service.TravelReviewService;
import com.kh.semi.travelReview.model.vo.TravelReview;

/**
 * Servlet implementation class MyPlanController
 */
@WebServlet("/myPlan")
public class MyPlanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPlanController() {
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
		System.out.println(userNo);
		List<PlanMain> myPlanList = new PlanService().selectPlanList(userNo);
		
		System.out.println("myPlanList contro "+myPlanList);
		request.setAttribute("myPlanList", myPlanList);
		
		request.getRequestDispatcher("views/member/MyPlan.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

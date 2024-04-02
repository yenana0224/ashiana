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
		List<PlanMain> myPlanList = new PlanService().selectPlanList(userNo);
		
		request.setAttribute("myPlanList", myPlanList);
		
		request.getRequestDispatcher("views/member/MyPlan.jsp").forward(request,response);
		
		/*
		 * 	request.setCharacterEncoding("UTF-8");
		//세션
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		//페이징관련
		int listCount; // 현재 일반게시판의 게시글 총 개수 => BOARD테이블로부터 COUNT(*)활용해서 조회
		int currentPage; // 현재 페이지(사용자가 요청한 페이지) => request.getParameter("currentPage")
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 개수 => 10개로 고정
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수 => 10개
		
		int maxPage; // 가장 마지막 페이지가 몇 번 페이지인지(총 페이지의 개수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		String select = request.getParameter("select");
		String searchContent = request.getParameter("searchContent");
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		pageLimit = 10;
		boardLimit = 15;
		
		//페이징관련
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		
		List<PlanMain> myPlanList = new ArrayList<PlanMain>();
	
		//총개수
		listCount = new PlanService().selectPlanListCount(select, searchContent,userNo);		
//		
//		if(select != null) {
//			myPlanList = new PlanService().noticeSearch(select, searchContent,userNo,pi);
//		} else {
//			myPlanList = new PlanService().noticeList(userNo,pi);
//		}
//		
		//세션에서 유저넘버 받아오기
		myPlanList = new PlanService().selectPlanList(userNo);
		
		request.setAttribute("myPlanList", myPlanList);
		request.setAttribute("pageInfo", pi);
		request.setAttribute("searchContent", searchContent);
		request.setAttribute("select", select);
		
		
		request.getRequestDispatcher("views/member/MyPlan.jsp").forward(request,response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.kh.semi.travelReview.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.travelReview.model.service.TravelReviewService;

/**
 * Servlet implementation class TravelReviewDetailController
 */
@WebServlet("/detail.review")
public class TravelReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// get방식 인코딩 X
		
		// 조회페이지이기 때문에 조회수부터 올리기
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		System.out.println(reviewNo);
		
		
		// 조회수 update할 게시물
		int result = new TravelReviewService().updateReviewCount(reviewNo);
		
		// 리뷰 상세 조회해올 게시물
		//int review = new TravelReviewService().selectDetailReview(reviewNo);
		
		request.getRequestDispatcher("views/travelReview/travelReviewDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

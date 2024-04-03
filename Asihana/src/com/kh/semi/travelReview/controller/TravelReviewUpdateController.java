package com.kh.semi.travelReview.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.AttachmentFile;
import com.kh.semi.travelReview.model.service.TravelReviewService;
import com.kh.semi.travelReview.model.vo.HashTag;
import com.kh.semi.travelReview.model.vo.TravelReview;

/**
 * Servlet implementation class TravelReviewUpdateController
 */
@WebServlet("/update.tralvelReview")
public class TravelReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// get방식 + 기존 게시물의 데이터 가져오기
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

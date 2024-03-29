package com.kh.semi.travelReview.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class TravelReviewInsertController
 */
@WebServlet("/insertReview")
public class TravelReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1) MultipartRequest 생성
			// 1_1) 용량제한(10MB)
			int MaxSize = 1024 * 1024 * 10;
			
			// 1_2) 저장할 경로 구함
			String savePath = request.getServletContext().getRealPath("/resources/travelReview");
			
			String content = request.getParameter("content");
			
			System.out.println(content);
			
			
			request.getSession().getAttribute("hashTagList");
			
			request.getRequestDispatcher("views/travelReview/travelReviewInsert.jsp").forward(request, response);
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

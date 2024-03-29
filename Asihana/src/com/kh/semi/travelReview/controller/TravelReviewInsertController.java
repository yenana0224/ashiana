package com.kh.semi.travelReview.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

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
			int maxSize = 1024 * 1024 * 10;
			
			// 1_2) 저장할 경로 구함
			String savePath = request.getServletContext().getRealPath("/resources/travelReview");
			
			// 2) MultipartRequest 객체 생성하면서 파일의 이름을 수정하면서 업로드
			MultipartRequest multiRequest =
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String reviewTitle = multiRequest.getParameter("title");
			String reviewContent = multiRequest.getParameter("content");
			String arrivalDate = multiRequest.getParameter("arrival");
			String departureDate = multiRequest.getParameter("departure");
			int city = Integer.parseInt(multiRequest.getParameter("city"));
			String partner = multiRequest.getParameter("partner");
			
			System.out.println(reviewTitle);
			System.out.println(reviewContent);
			System.out.println(arrivalDate);
			System.out.println(departureDate);
			System.out.println(partner);
			
			
			//작성자
			//별점
			//플랜 첨부 여부
			
			
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

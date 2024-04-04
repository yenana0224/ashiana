package com.kh.semi.travelReview.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class TravelReviewUpdateController
 */
@WebServlet("/update.review")
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
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 용량 제한
			int maxSize = 1024 * 1024 * 10;
			
			// 1_2) 저장할 경로 구함
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			String savePath = application.getRealPath("/resources/travelReview/");
			
			// 2) MultipartRequest 객체 생성하면서 파일의 이름을 수정하면서 업로드
			MultipartRequest multiRequest =
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String reviewWriter = multiRequest.getParameter("userNo");
			String reviewTitle = multiRequest.getParameter("title");
			String reviewContent = multiRequest.getParameter("content");
			String arrivalDate = multiRequest.getParameter("arrival");
			String departureDate = multiRequest.getParameter("departure");
			int cityNo = Integer.parseInt(multiRequest.getParameter("city"));
			String partner = multiRequest.getParameter("partner");
			int starPoint = Integer.parseInt(multiRequest.getParameter("star"));
			String planCheck = multiRequest.getParameter("planCheck");
			String[] hashTagList = multiRequest.getParameterValues("hashTag");
			String status = multiRequest.getParameter("status");
			
			System.out.println(reviewWriter + "작성자");
			System.out.println(reviewTitle + "제목");
			System.out.println(reviewContent + "내용");
			System.out.println(arrivalDate + "떠나날");
			System.out.println(cityNo + "도시");
			System.out.println(partner + "파트너");
			System.out.println(departureDate + "복구날");
			System.out.println(Arrays.toString(hashTagList));
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

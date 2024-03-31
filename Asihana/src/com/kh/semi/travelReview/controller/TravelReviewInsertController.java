package com.kh.semi.travelReview.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.travelReview.model.vo.HashTag;
import com.kh.semi.travelReview.model.vo.TravelReview;
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
		
		// 0) POST방식 인코딩
		request.setCharacterEncoding("UTF-8");
		
		
		// 파일첨부 enctype
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1) MultipartRequest 생성
			// 1_1) 용량제한(10MB)
			int maxSize = 1024 * 1024 * 10;
			
			// 1_2) 저장할 경로 구함
			String savePath = request.getServletContext().getRealPath("/resources/travelReview");
			
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
			Double starPoint = Double.parseDouble(multiRequest.getParameter("star"));
			String planCheck = multiRequest.getParameter("planCheck");
			String[] hashTagList = multiRequest.getParameterValues("hashTag");
			/*
			System.out.println(reviewWriter + "작성자");
			System.out.println(reviewTitle + "제목");
			System.out.println(reviewContent + "내용");
			System.out.println(arrivalDate + "떠나날");
			System.out.println(city + "도시");
			System.out.println(departureDate + "복구날");
			System.out.println(partner + "파트너");
			System.out.println(starPoint + "별점");
			System.out.println(Arrays.toString(hashTagList));
			*/
			
			// 여행기 값 VO에 담기
			TravelReview t = new TravelReview();
			t.setReviewWriter(reviewWriter);
			t.setReviewTitle(reviewTitle);
			t.setReviewContent(reviewContent);
			t.setDepartureDate(departureDate);
			t.setArrivalDate(arrivalDate);
			t.setCityNo(cityNo);
			t.setPartner(partner);
			t.setStarPoint(starPoint);
			t.setPlanCheck(planCheck);
			
			//해시태그 값 VO에 담기
			List<HashTag> list = new ArrayList();

			if(hashTagList != null) {
				for(int i = 0; i < hashTagList.length; i++) {
					HashTag h = new HashTag();
					h.setTagNo(Integer.parseInt(hashTagList[i]));
					list.add(h);
				}
			}
			
			
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

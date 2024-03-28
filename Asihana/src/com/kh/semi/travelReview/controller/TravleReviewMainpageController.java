package com.kh.semi.travelReview.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.info.model.vo.City;
import com.kh.semi.travelReview.model.service.TravelReviewService;
import com.kh.semi.travelReview.model.vo.HashTag;
import com.kh.semi.travelReview.model.vo.TravelReview;

/**
 * Servlet implementation class TravleRiewMainpageController
 */
@WebServlet("/travelReviewMain")
public class TravleReviewMainpageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravleReviewMainpageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//GET 방식 인코딩 필요 없음
		
		// 2) request 값뽑기
		// -- 페이징 처리 --
		// 필요한 변수들
		int listCount; // 현재 일반게시판의 게시글 총 개수 => BOARD테이블로부터 COUNT(*)활용해서 조회
		int currentPage; // 현재 페이지(사용자가 요청한 페이지) => request.getParameter("currentPage")
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 개수 => 최대 10개로 고정
		int boardLimit; // 한 페이지에 보여질 게시글 최대 개수 => 10개로 고정
						
		int maxPage; // 가장 마지막 페이지가 몇 번 페이지인지(총 페이지의 개수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수 
				
		// 3) 서비스 호출
		// 3_2)검색창에 띄울 국가, 도시 정보를 가져와야 함
		List<City> cityList = new TravelReviewService().selectCityList();
				
		// 3_1)여행기가 게시물 리스트를 가져와야 함
		List<TravelReview> reviewList =  new TravelReviewService().selectReviewList();

		
		// 3_2)추천수가 담긴 여행기 리스트를 가져와야 함
		List<TravelReview> likeList = new TravelReviewService().selectLikeList();
				
		// 3_3)해시태그가 담긴 여행기 리스트를 가져와야 함
		
		
		request.setAttribute("cityList", cityList);
		//System.out.println(cityList);
		
		request.setAttribute("reviewList", reviewList);
		//System.out.println(reviewList);
		
		request.setAttribute("likeList", likeList);
		//System.out.println(likeList + "1");
			
		request.getSession().getAttribute("hashTagList");
		request.getSession().getAttribute("checkedHashTagList");
		//System.out.println(request.getSession().getAttribute("hashTagList"));
		
		
		//request.setAttribute("hashTagList", hashTagList);
		request.getRequestDispatcher("views/travelReview/travelReviewMain.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

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

/**
 * Servlet implementation class TravelReviewDetailCityForm
 */
@WebServlet("/cityDetail.review")
public class TravelReviewDetailCityForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelReviewDetailCityForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 사용자가 검색한 도시(국가) 키워드에서 도시 정보만 뽑아서 가공
		String searchKeyword = request.getParameter("search");
		
		int index = searchKeyword.indexOf("(");
		String cityName = searchKeyword.substring(0, index);
		System.out.println(cityName);
		
		// service 호출
		List<City> cityInformation = new TravelReviewService().selectDetailCity(cityName);
		System.out.println(cityInformation);
		
		
		
		
		// 출력화면 지정
		if(cityInformation.isEmpty()) {
			request.setAttribute("errorMsg", "게시글 조회실패");
		} else {
			request.setAttribute("cityInformation", cityInformation);
		}
		request.getRequestDispatcher("views/travelReview/travelReviewCityDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

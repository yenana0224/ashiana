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
		
		// 사용자가 검색한 도시(국가) 키워드에서 도시 정보만 뽑아서 cityName으로 가공
		String searchKeyword = request.getParameter("search");
		
		int index = searchKeyword.indexOf("(");
		String cityName = searchKeyword.substring(0, index);
		
		// service 호출
		
		// cityName으로 cityNo 조회하기
		int cityNo = new TravelReviewService().selectCityNo(cityName);
		
		
		List<City> cityInfo = new TravelReviewService().selectDetailCity(cityNo);
		
		String language = cityInfo.get(0).getLanguage();
		String currency = cityInfo.get(0).getCurrency();
		String voltage = cityInfo.get(0).getVoltage();

		String newLanguage = cityInfo.get(0).getLanguage();
		String newCurrency = cityInfo.get(0).getCurrency();
		String newVoltage = cityInfo.get(0).getVoltage();
		
		for(int i = 1; i < cityInfo.size(); i++){
			if(!language.equals(cityInfo.get(i).getLanguage())){
				newLanguage += ", " + cityInfo.get(i).getLanguage();
			}
		}
		
		for(int j = 1; j < cityInfo.size(); j++){
			if(!currency.equals(cityInfo.get(j).getCurrency())){
				newCurrency += ", " + cityInfo.get(j).getCurrency(); 
			}
		}
		
		for(int k = 0; k < cityInfo.size(); k++){
			if(!voltage.equals(cityInfo.get(k).getVoltage())){
				newVoltage += ", " + cityInfo.get(k).getVoltage();
			}
		}

		
		City cityInformation = new City();
		cityInformation.setCityName(cityName);
		cityInformation.setCurrency(newCurrency);
		cityInformation.setVoltage(newVoltage);
		cityInformation.setLanguage(newLanguage);
		cityInformation.setNationName(cityInfo.get(0).getNationName());
		cityInformation.setVisaName(cityInfo.get(0).getVisaName());
		cityInformation.setFilePath(cityInfo.get(0).getFilePath());
		cityInformation.setChangeName(cityInfo.get(0).getChangeName());
		
		
		// 출력화면 지정
		if(cityInfo.isEmpty()) {
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

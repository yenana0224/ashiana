package com.kh.semi.info.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.info.model.service.InfoService;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.Nation;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class InfoController {

	
	public String main(HttpServletRequest request, HttpServletResponse response) {
		List<City> list = new InfoService().cityList();
		request.setAttribute("list", list);
		String view = "views/info/selectCity.jsp";
		return view;
	};

	public String search(HttpServletRequest request, HttpServletResponse response) {
		int nationNo = Integer.parseInt(request.getParameter("nation"));
		String cityName = request.getParameter("city");

		String view = "";
		
		// 나라만 선택하는 경우
		if(cityName.equals("도시선택")) {
			Nation nation = new InfoService().searchNation(nationNo);
			List<City> cityList = new InfoService().nationCity(nationNo);				
			request.setAttribute("nation", nation);
			request.setAttribute("cityList", cityList);
			view = "views/info/nationInfo.jsp";
			
		// 도시까지 선택하는 경우
		} else {
			City c = new City();
			c.setNationNo(nationNo);
			c.setCityName(cityName);
			
			// City 조회수 1증가
			int result = new InfoService().increaseCity(c);
			if(result > 0) {
				// 도시정보 조회
				City city = new InfoService().searchCity(c);
				// 도시 내 즐길거리 조회
				//List<Attraction> attraction = new InfoService().searchAttraction(c);
				request.setAttribute("City", city);
				view = "views/info/cityInfo.jsp";
			} else {
				view = "views/common/errorPage.jsp";
			}
		}
		return view;
	}
	
	public String story(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new InfoService().countStory();
		int pageLimit = 10;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = ((currentPage - 1) / pageLimit ) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Story> storyList = new InfoService().selectList();
		
		String view = "";
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", storyList);
		
		view = "views/info/storyMain.jsp";
		
		return view;
	}
	
}

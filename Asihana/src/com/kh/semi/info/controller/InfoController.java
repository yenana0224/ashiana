package com.kh.semi.info.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.AttachmentFile;
import com.kh.semi.info.model.service.CityService;
import com.kh.semi.info.model.service.NationService;
import com.kh.semi.info.model.service.StoryService;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.Nation;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class InfoController {

	
	public String main(HttpServletRequest request, HttpServletResponse response) {
		List<City> list = new CityService().cityList();
		List<Nation> nationList = new NationService().allNationList();
		request.setAttribute("list", list);
		request.setAttribute("nationList", nationList);
		
		return "views/info/selectCity.jsp";
	};

	public String search(HttpServletRequest request, HttpServletResponse response) {
		int nationNo = Integer.parseInt(request.getParameter("nation"));
		int cityNo = Integer.parseInt(request.getParameter("cityNo"));
		String cityName = request.getParameter("city");

		String view = "";
		
		// 나라만 선택하는 경우
		if(cityName.equals("도시선택")) {
			Nation nation = new NationService().searchNation(nationNo);
			AttachmentFile title = new NationService().selectTitlePhoto(nationNo);
			List<City> cityList = new CityService().nationCity(nationNo);

			request.setAttribute("nation", nation);
			request.setAttribute("cityList", cityList);
			request.setAttribute("title", title);
			view = "views/info/nationInfo.jsp";
			
		// 도시까지 선택하는 경우
		} else {
			City c = new City();
			c.setNationNo(nationNo);
			c.setCityName(cityName);
			
			// City 조회수 1증가
			int result = new CityService().increaseCity(c);
			if(result > 0) {
				// 도시정보 조회
				City city = new CityService().searchCity(c);
				AttachmentFile file = new CityService().selectPhoto(cityNo);
				// 도시 내 즐길거리 조회
				//List<Attraction> attraction = new InfoService().searchAttraction(c);
				request.setAttribute("City", city);
				request.setAttribute("file", file);
				view = "views/info/cityInfo.jsp";
			} else {
				view = "views/common/errorPage.jsp";
			}
		}
		return view;
	}
	
	public String story(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new StoryService().countStory();
		int pageLimit = 10;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = ((currentPage - 1) / pageLimit ) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) endPage = maxPage;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Story> storyList = new StoryService().storyList(pi);
		
		String view = "";
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", storyList);

		
		return "views/info/storyMain.jsp";
	}
	
	public String detailStory(HttpServletRequest request, HttpServletResponse response) {
		int storyNo = Integer.parseInt(request.getParameter("storyNo"));
		Story story = new StoryService().detailStory(storyNo);
		
		request.setAttribute("pageNo", Integer.parseInt(request.getParameter("pageNo")));
		request.setAttribute("story", story);
		
		return "views/info/storyDetail.jsp";
	}
	
}

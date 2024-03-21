package com.kh.semi.info.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.info.model.service.InfoService;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.Nation;

public class InfoController {

	
	public String main(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<City> list = new InfoService().cityList();
		request.setAttribute("list", list);
		String view = "views/info/selectCity.jsp";
		return view;
	};

	public String search(HttpServletRequest request, HttpServletResponse response) {
		int nationNo = Integer.parseInt(request.getParameter("nation"));
		String cityName = request.getParameter("city");

		String view = "";
		
		if(cityName.equals("도시선택")) {
			Nation nation = new InfoService().searchNation(nationNo);
			request.setAttribute("nation", nation);
			view = "views/info/nationInfo.jsp";
			
		} else {
			City c = new City();
			c.setNationNo(nationNo);
			c.setCityName(cityName);
			City city = new InfoService().searchCity(c);
			request.setAttribute("City", city);
			view = "views/info/cityInfo.jsp";
		}

		return view;
	}
	
}

package com.kh.semi.info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CityController {
	
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		
		String view = "views/admin/CityEnrollForm";
		return view;
	}
	
	public String select(HttpServletRequest request, HttpServletResponse response) {
		String view = "views/info/cityInfo";
		
		return view;
	}
	
	public String update(HttpServletRequest request, HttpServletResponse response) {
		String view = "views/admin/cityupdateForm";
		
		return view;
	}

}

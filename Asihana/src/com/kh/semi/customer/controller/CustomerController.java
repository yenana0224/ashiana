package com.kh.semi.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.model.service.CustomerService;
import com.kh.semi.customer.model.vo.Notice;

public class CustomerController {
	
	
	public String notice(HttpServletRequest request, HttpServletResponse response) {
		
		Notice[] notice = new Notice[3];
		notice = new CustomerService().notice();
		request.setAttribute("notice", notice);
		String view = "/views/customer/customer.jsp";
		
		return view;
	}
	
	
	
	
	
	
}

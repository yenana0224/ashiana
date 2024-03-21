package com.kh.semi.customer.controller;

import java.util.ArrayList;

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
	
	public String noticeList(HttpServletRequest request, HttpServletResponse response) {
		
		
		ArrayList<Notice> noticeList = new CustomerService().noticeList();
		
		request.setAttribute("noticeList", noticeList);
		
		String view = "/views/customer/notice.jsp";
		
		return view;
		
		
	}
	
	
	
	
}

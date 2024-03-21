package com.kh.semi.customer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.model.service.CustomerService;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class CustomerController {
	
	
	public String notice(HttpServletRequest request, HttpServletResponse response) {
		
		Notice[] notice = new Notice[3];
		notice = new CustomerService().notice();
		request.setAttribute("notice", notice);
		String view = "/views/customer/customer.jsp";
		
		return view;
	}
	
	public String noticeList(HttpServletRequest request, HttpServletResponse response) {
		
		int listCount; // 현재 일반게시판의 게시글 총 개수 => BOARD테이블로부터 COUNT(*)활용해서 조회
		int currentPage; // 현재 페이지(사용자가 요청한 페이지) => request.getParameter("currentPage")
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 개수 => 10개로 고정
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수 => 10개
		
		int maxPage; // 가장 마지막 페이지가 몇 번 페이지인지(총 페이지의 개수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		
		listCount = new CustomerService().selectCount();
		
		// 사용자가 요청한 페이지 번호 값 뽑기
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// 하단 페이징바 최대 10개
		pageLimit = 10;
		// 한 페이지에 최대 15개 게시물
		boardLimit = 15;
		
		// 가장 마지막 페이지 = 게시글 총개수를 실수로 변환(23.0)(나누기 /)(15.0)한페이지에 보여질 게시글<더 작은 int가 형변환> 
		// Math클래스에 ceil로 올림처리 마지막으로 int로 형변환후 대입
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		// endPage를 maxPage값으로 변경
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Notice> noticeList = new CustomerService().noticeList(pi);
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("noticeList", noticeList);
		
		String view = "/views/customer/notice.jsp";
		
		return view;
		
		
	}
	
	
	
	
}

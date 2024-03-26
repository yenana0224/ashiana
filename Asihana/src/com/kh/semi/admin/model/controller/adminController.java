package com.kh.semi.admin.model.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.customer.model.service.CustomerService;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.info.model.service.InfoService;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class adminController {
	
	public String noticeList(HttpServletRequest request, HttpServletResponse response) {

		String select = request.getParameter("select");
		String searchContent = request.getParameter("searchContent");

		int listCount = new CustomerService().selectCount(select, searchContent);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int pageLimit = 10;
		int boardLimit = 15;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		// endPage를 maxPage값으로 변경
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		List<Notice> noticeList = new ArrayList();
		
		if(select != null) {
			noticeList = new CustomerService().noticeSearch(select, searchContent, pi);
		} else {
			noticeList = new CustomerService().noticeList(pi);
		}
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("searchContent", searchContent);
		request.setAttribute("select", select);

		return "views/admin/adminNoticeList.jsp";
	}
	
	public String storyList(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new InfoService().countStory();
		int pageLimit = 15;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = ((currentPage - 1) / pageLimit ) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) endPage = maxPage;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Story> storyList = new InfoService().storyList(pi);
		
		String view = "";
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", storyList);
		
		view = "views/admin/adminStoryList.jsp";
		
		return view;
	}
	
	public String noticeInsertForm(HttpServletRequest request, HttpServletResponse response) {
		
		return "views/admin/noticeInsertForm.jsp";
	}
	
	public String noticeDetail(HttpServletRequest request, HttpServletResponse response) {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		Notice notice = new CustomerService().noticeDetail(noticeNo);
		request.setAttribute("notice", notice);
		return "views/admin/noticeDetail.jsp";
	}
	
	public String changeHold(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String[] holds = request.getParameterValues("hold");
		int result = new AdminService().changeHolds(holds);

		return "/notice.admin?currentPage=1";
	}
	
	public String noticeUpdateForm(HttpServletRequest request, HttpServletResponse response) {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		Notice notice = new CustomerService().noticeDetail(noticeNo);
		
		request.setAttribute("Notice", notice);
		return "views/admin/noticeUpdateForm.jsp";		
	}

}

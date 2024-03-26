package com.kh.semi.admin.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class adminController
 */
@WebServlet("*.admin")
public class adminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String mapping = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		adminController ac = new adminController();
		
		String view = "";
		boolean flag = true;
		
		switch(mapping){
		case "main" : view = "views/admin/adminMain.jsp"; break;
		case "notice" : view = ac.noticeList(request, response); break;
		case "story" : view = ac.storyList(request, response); break;
		case "noticeInsertForm" : view = ac.noticeInsertForm(request, response); break;
		case "noticeDetail" : view = ac.noticeDetail(request, response); break;
		case "changeHold" : view = ac.changeHold(request, response); flag = false; break;
		case "noticeUpdateForm" : view = ac.noticeUpdateForm(request, response); break;
		case "noticeUpdate" : view = ac.noticeUpdate(request, response); flag = false; break;
		case "storyDel" : view = ac.storyDel(request, response); flag = false;  break;
		}
		
		if(flag) {
			request.getRequestDispatcher(view).forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + view);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

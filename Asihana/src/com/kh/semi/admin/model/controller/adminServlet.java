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
		case "noticeInsertForm" : view = ac.noticeInsertForm(request, response); break;
		case "noticeDetail" : view = ac.noticeDetail(request, response); break;
		case "noticeUpdateForm" : view = ac.noticeUpdateForm(request, response); break;
		case "noticeUpdate" : view = ac.noticeUpdate(request, response); flag = false; break;
		case "changeHold" : view = ac.changeHold(request, response); flag = false; break;
		case "story" : view = ac.storyList(request, response); break;
		case "storyDel" : view = ac.storyDel(request, response); flag = false;  break;
		case "storyInsertForm" : view = ac.storyInsertForm(request, response); break;
		case "storyInsert" : view = ac.storyInsert(request, response); flag = false; break;
		case "storyDetail" : view = ac.storyDetail(request, response); break;
		case "storyUpdateForm" : view = ac.storyUpdateForm(request, response); break;
		case "storyUpdate" : view = ac.storyUpdate(request, response); flag = false; break;
		case "info" : view = ac.nationList(request, response); break;
		case "nationCityList" : view = ac.allCityList(request, response); break;
		case "nationInfo" : view = ac.nationInfo(request, response); break;
		case "nationUpdateForm" : view = ac.nationUpdateForm(request, response); break;
		case "nationUpdate" : view = ac.nationUpdate(request, response); flag = false; break;
		case "cityinfo" : view = ac.cityinfo(request, response); break;
		case "cityUpdateForm" : view = ac.cityUpdateForm(request, response); break;
		case "cityUpdate" : view = ac.cityUpdate(request, response); flag = false; break;
		case "member" : view = ac.memberList(request, response); break;
		case "memberDelete" : view = ac.memberDelete(request, response); flag = false; break;
		case "notmember" : view = ac.userDeleteList(request, response); break;
		case "memberRollback" : view = ac.memberRollback(request, response); flag = false; break;
		case "searchInfo" : view = ac.searchInfo(request, response); flag=false; break;
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

package com.kh.semi.friendShip.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.friendShip.model.service.FriendShipService;
import com.kh.semi.friendShip.model.vo.FriendShip;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class FriendInsertController
 */
@WebServlet("/insert.friend")
public class FriendInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int userId2 = Integer.parseInt(request.getParameter("userId2"));
		
		FriendShip friendShip = new FriendShip();
		friendShip.setUserId1(userNo);
		friendShip.setUserId2(userId2);
		
		int result = new FriendShipService().insertFriendShip(friendShip);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result > 0 ? "success" : "fail");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

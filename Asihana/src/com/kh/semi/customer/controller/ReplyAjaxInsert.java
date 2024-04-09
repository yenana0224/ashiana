package com.kh.semi.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.model.service.CustomerService;
import com.kh.semi.customer.model.vo.Answer;

/**
 * Servlet implementation class ReplyAjaxInsert
 */
@WebServlet("/replyInsert.yo")
public class ReplyAjaxInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyAjaxInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String coment = request.getParameter("content");
		String qnaStatus = request.getParameter("qnaStatus");
		
		
		Answer answer = new Answer();
		answer.setQnaNo(qnaNo);
		answer.setReplyComment(coment);
		answer.setReplyWriter(userNo);
		
		int result = new CustomerService().replyInsert(answer, qnaStatus);
		
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

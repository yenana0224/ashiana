package com.kh.semi.customer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.model.vo.Answer;


/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("*.customer")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		
		String mapping = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
		CustomerController customer = new CustomerController();
		
		String view = "";
		List<Answer> answerList = new ArrayList();
		boolean flag = true;
		
		switch(mapping) {
		case "customer" : view = customer.notice(request, response); break;
		case "faq" : view = "/views/customer/faq.jsp"; break;
		case "notice" : view = customer.noticeList(request, response); break;
		case "noticeDetail" : view = customer.noticeDetail(request, response); break;
		case "noticeInsert" : view = customer.noticeInsert(request, response); flag = false; break;
		case "qa" : view = customer.qaList(request, response); break;
		case "enrollQa" : view = "/views/customer/enrollQa.jsp"; break;
		case "insertQa" : 
			view = customer.insertQa(request, response);
			if(view.equals("/qa.customer?currentPage=1")) {
				flag = false;
			}
			break;
		case "qnaDetail" : view = customer.qnaDetail(request, response); break;
		case "qnaDelete" : view = customer.qnaDelete(request, response); break;
		case "updateQaView" : view = customer.updateQaView(request, response); break;
		case "updateQa" : view = customer.updateQa(request, response); flag = false; break;
		}
		
		if(flag == true) {
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

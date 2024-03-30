package com.kh.semi.plan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.plan.model.vo.PlanDetail;

/**
 * Servlet implementation class AjaxPlanServlet
 */
@WebServlet("*.ajaxplan")
public class AjaxPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST => 인코딩
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String mapping = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		response.setContentType("application/json; charset=UTF-8");
		
		PlanController pc = new PlanController();
		
		switch(mapping) {
		case "selectPlanDetail" : new Gson().toJson(pc.selectPlanDetail(request, response), response.getWriter()); break;
		case "selectDesDetail" :  new Gson().toJson(pc.selectDesDetail(request, response), response.getWriter()); break;
		case "selectSchedule" : new Gson().toJson(pc.selectSchedule(request, response), response.getWriter()); break;
		case "insertStartDestination" : new Gson().toJson(pc.insertStartDestination(request, response), response.getWriter()); break;
		case "updateStartDestination" : new Gson().toJson(pc.updateStartDestination(request, response), response.getWriter()); break;
		case "insertDestination" : new Gson().toJson(pc.insertDestination(request, response), response.getWriter()); break;
		
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

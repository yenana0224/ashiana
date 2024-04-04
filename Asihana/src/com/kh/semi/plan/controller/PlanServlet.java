package com.kh.semi.plan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class PlanController
 */
@WebServlet("*.plan")
public class PlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String mapping = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		PlanController pc = new PlanController();
		String view = "";
		
		switch(mapping) {
		case "planMain" : view = pc.selectPlanList(request, response); break;
		case "planDetail" : view = pc.userPlanCheck(request, response); break;
		case "insert" : pc.deletePlanCache(request, response); view = pc.insertPlan(request, response); break; // 새 플랜 작성 화면 입장 시 작성중 취소했던 플랜을 삭제함
		case "delete" : view = pc.deletePlan(request, response); break;
		case "update" : pc.deletePlanCache(request, response); view = pc.updatePlan(request, response);
		case "publishPlan" : view = pc.publishPlan(request, response); break;
		}
		
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

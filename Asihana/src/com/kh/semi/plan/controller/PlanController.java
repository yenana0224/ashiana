package com.kh.semi.plan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.vo.Member;
import com.kh.semi.plan.model.service.PlanService;
import com.kh.semi.plan.model.vo.PlanMain;

public class PlanController {
	

	public String selectPlanList(HttpServletRequest request, HttpServletResponse response) {
		
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			List<PlanMain> list = new PlanService().selectPlanList(loginUser.getUserNo());
			request.setAttribute("list", list);
		}
		
		String view = "views/plan/planMain.jsp";
		
		return view;
	}

	public String userPlanCheck(HttpServletRequest request, HttpServletResponse response) {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		
		String view = "";
		int result = 0;
		if(loginUser != null) {
			result = new PlanService().userPlanCheck(loginUser.getUserNo(), planNo);
		} 
		
		if(result > 0) {
			request.setAttribute("planNo", planNo);
			view = "views/plan/planDetail.jsp";
		} else {
			request.setAttribute("errorMsg", "니가 짠 플랜이 아니잖어~ 로그인은 했니~?");
			view = "views/common/errorPage.jsp";
		}
		
		return view;
	}

	

}

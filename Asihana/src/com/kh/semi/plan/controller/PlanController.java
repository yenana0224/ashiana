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

	

}

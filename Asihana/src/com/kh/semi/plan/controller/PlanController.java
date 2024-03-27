package com.kh.semi.plan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.plan.model.service.PlanService;
import com.kh.semi.plan.model.vo.*;

public class PlanController {
	

	public String selectPlanList(HttpServletRequest request, HttpServletResponse response) {
		
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			List<PlanMain> list = new PlanService().selectPlanList(loginUser.getUserNo());
			request.setAttribute("list", list);
		}
		
		return "views/plan/planMain.jsp";
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

	public PlanDetail selectPlanDetail(HttpServletRequest request, HttpServletResponse response) {
		
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		
		return new PlanService().selectPlanDetail(planNo);
	}

	public List<DestinationDetail> selectDesDetail(HttpServletRequest request, HttpServletResponse response) {
		
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		
		return new PlanService().selectDesDetail(planNo);
	}

	public List<Schedule> selectSchedule(HttpServletRequest request, HttpServletResponse response) {
		
		return new PlanService().selectSchedule(Integer.parseInt(request.getParameter("destNo")));
	}

	

}

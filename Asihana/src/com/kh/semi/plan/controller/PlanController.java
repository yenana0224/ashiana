package com.kh.semi.plan.controller;

import java.util.ArrayList;
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
		List<PlanMain> list = new ArrayList();
		if(loginUser != null) {
			list = new PlanService().selectPlanList(loginUser.getUserNo());
		}
		request.setAttribute("list", list);
		
		return "views/plan/planMain.jsp";
	}

	public String userPlanCheck(HttpServletRequest request, HttpServletResponse response) {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		
		String view = "";
		if(loginUser != null && new PlanService().userPlanCheck(loginUser.getUserNo(), planNo) > 0) {
			request.setAttribute("planNo", planNo);
			view = "views/plan/planDetail.jsp";
		} else {
			request.setAttribute("errorMsg", "작성하신 플랜이 아닙니다.");
			view = "views/common/errorPage.jsp";
		}
		return view;
	}

	public PlanDetail selectPlanDetail(HttpServletRequest request, HttpServletResponse response) {
		
		return new PlanService().selectPlanDetail(Integer.parseInt(request.getParameter("planNo")));
	}

	public List<DestinationDetail> selectDesDetail(HttpServletRequest request, HttpServletResponse response) {
		
		return new PlanService().selectDesDetail(Integer.parseInt(request.getParameter("planNo")));
	}

	public List<Schedule> selectSchedule(HttpServletRequest request, HttpServletResponse response) {
		
		return new PlanService().selectSchedule(Integer.parseInt(request.getParameter("destNo")));
	}

	public String insertPlan(HttpServletRequest request, HttpServletResponse response) {
		
		String view = "";
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int loginUserNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		if(loginUserNo == userNo && new PlanService().insertPlan(userNo) > 0) {
			view = "views/plan/insertPlan.jsp";
		} else {
			request.setAttribute("errorMsg", "작성하신 플랜이 아닙니다.");
			view = "views/common/errorPage.jsp";
		}
		return view;
	}

	

}

package com.kh.semi.plan.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.plan.model.service.PlanService;
import com.kh.semi.plan.model.vo.*;
import com.kh.semi.travelReview.model.service.TravelReviewService;

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
		
		return new PlanService().selectDesDetail(Integer.parseInt(request.getParameter("planNo")), request.getParameter("status"));
	}

	public List<Schedule> selectSchedule(HttpServletRequest request, HttpServletResponse response) {
		
		return new PlanService().selectSchedule(Integer.parseInt(request.getParameter("destNo")), request.getParameter("status"));
	}

	public String insertPlan(HttpServletRequest request, HttpServletResponse response) {
		
		String view = "";
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int loginUserNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		if(loginUserNo == userNo && new PlanService().insertPlan(userNo) > 0) {
			request.setAttribute("cityList", new TravelReviewService().selectCityList());
			request.setAttribute("planNo", new PlanService().selectInsertPlan(loginUserNo));
			view = "views/plan/insertPlan.jsp";
		} else {
			request.setAttribute("errorMsg", "로그인 확인 후 다시 시도해주세요.");
			view = "views/common/errorPage.jsp";
		}
		return view;
	}

	public int insertStartDestination(HttpServletRequest request, HttpServletResponse response) {
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		String returnDate = request.getParameter("returnDate");
		
		return new PlanService().insertStartDestination(planNo, returnDate);
	}
	
	public List<DestinationDetail> insertDestination(HttpServletRequest request, HttpServletResponse response) {
		
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		Destination des = new Destination(planNo,
										  Integer.parseInt(request.getParameter("cityNo")),
										  request.getParameter("trans"),
										  request.getParameter("transPrice"),
										  request.getParameter("trip"),
										  request.getParameter("arrival"),
										  request.getParameter("returnDate"));
		
		int result = new PlanService().insertDestination(des);
		
		List<DestinationDetail> list = new ArrayList();
		
		if(result > 0) list = new PlanService().insertDestination(planNo);
		
		return list;
	}

	public int updateStartDestination(HttpServletRequest request, HttpServletResponse response) {
		
		return new PlanService().updateStartDestination(Integer.parseInt(request.getParameter("destNo")), request.getParameter("returnDate"));
	}


	

}

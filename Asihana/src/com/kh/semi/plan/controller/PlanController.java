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
		
		return new PlanService().selectPlanDetail(Integer.parseInt(request.getParameter("planNo")), request.getParameter("status"));
	}

	public List<DestinationDetail> selectDesDetail(HttpServletRequest request, HttpServletResponse response) {
		
		return new PlanService().selectDesDetail(Integer.parseInt(request.getParameter("planNo")), request.getParameter("status"));
	}

	public List<Schedule> selectSchedule(HttpServletRequest request, HttpServletResponse response) {
		
		return new PlanService().selectSchedule(Integer.parseInt(request.getParameter("destNo")), request.getParameter("status"));
	}

	public void deletePlanCache(HttpServletRequest request, HttpServletResponse response) {
		// 새 플랜 작성을 시작하기전에 전에 작성중이었던 플랜을 삭제 
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		if(((Member)request.getSession().getAttribute("loginUser")).getUserNo() == userNo) {
			// TB_SCHEDULE => TB_DESTINATION => TB_PLAN 순으로 삭제 
			new PlanService().deletePlanCache(userNo);
		}
	}
	public String insertPlan(HttpServletRequest request, HttpServletResponse response) {
		
		String view = "views/common/errorPage.jsp";
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int loginUserNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		if(loginUserNo == userNo && new PlanService().insertPlan(userNo) > 0) { // 로그인 유저 넘버와 Parameter의 유저 넘버가 같은지 비교 
			request.setAttribute("cityList", new TravelReviewService().selectCityList()); //도시 리스트
			request.setAttribute("planNo", new PlanService().selectInsertPlan(loginUserNo));
			view = "views/plan/insertPlan.jsp";
		} else {
			request.setAttribute("errorMsg", "로그인 확인 후 다시 시도해주세요.");
		}
		return view;
	}

	public int insertStartDestination(HttpServletRequest request, HttpServletResponse response) {
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		String returnDate = request.getParameter("returnDate");
		
		return new PlanService().insertStartDestination(planNo, returnDate);
	}
	
	public int updateStartDestination(HttpServletRequest request, HttpServletResponse response) {
		
		return new PlanService().updateStartDestination(Integer.parseInt(request.getParameter("destNo")), request.getParameter("returnDate"));
	}
	
	public int insertDestination(HttpServletRequest request, HttpServletResponse response) {
		
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		Destination des = new Destination(planNo,
										  Integer.parseInt(request.getParameter("cityNo")),
										  request.getParameter("trans"),
										  request.getParameter("transPrice"),
										  request.getParameter("trip"),
										  request.getParameter("arrival"),
										  request.getParameter("returnDate"));
		
		return new PlanService().insertDestination(des);
	}

	public int insertSchedule(HttpServletRequest request, HttpServletResponse response) {
		
		Schedule sched = new Schedule(Integer.parseInt(request.getParameter("destNo")),
									  request.getParameter("category"),
									  request.getParameter("schedName"),
									  request.getParameter("schedContent"),
									  request.getParameter("schedCost"));
		return new PlanService().insertSchedule(sched);
	}

	public int insertEndDestination(HttpServletRequest request, HttpServletResponse response) {
		Destination des = new Destination(Integer.parseInt(request.getParameter("planNo")),
														   request.getParameter("trans"),
														   request.getParameter("transPrice"),
														   request.getParameter("trip"),
														   request.getParameter("arrival"));
		return new PlanService().insertEndDestination(des);
	}





	

}

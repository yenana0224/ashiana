package com.kh.semi.member.controller;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;


/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String nickName = request.getParameter("nickName");
		String userId = request.getParameter("userId");
		
		//3) VO 객체에 담기
		Member member = new Member();
		member.setNickName(nickName);
		member.setUserId(userId);
		
		//4) Service호출
		int result = new MemberService().updateMember(member);
		if(result>0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg","정보수정에 성공했습니다 축하드려요~~");
			
			String userPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
			Member updateMem = new MemberService().login(userId, userPwd);
			session.setAttribute("loginUser", updateMem);
			response.sendRedirect(request.getContextPath()+"/myPage");
			
		}else {
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request,response);
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

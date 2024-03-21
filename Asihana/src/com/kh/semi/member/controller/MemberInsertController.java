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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	
		String userId = request.getParameter("userId");//"필수입력"
		String userPwd = request.getParameter("userPwd");//"필수입력"
		String nickName = request.getParameter("nickName");//"필수입력"
		
		Member member = new Member();
		member.setUserId(userId);
		member.setUserPwd(userPwd);
		member.setNickName(nickName);
		
		int result = new MemberService().insertMember(member);
		
		if(result>0) {//성공 => index.jsp
			//RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			//view.forward(request,response);
			HttpSession session=request.getSession();
			session.setAttribute("alertMsg", "회원가입에 성공했습니다");
			response.sendRedirect(request.getContextPath());
			
		}else {//실패 =>에러페이지로 포워딩
			request.setAttribute("errorMsg","회원가입에 실패했습니다.");
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

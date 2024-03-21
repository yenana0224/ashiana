package com.kh.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxIdCheckController
 */
@WebServlet("/idCheck.do")
public class AjaxIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	//GET
		
	//2) request 로부터 값 뽑기
		String checkId = request.getParameter("checkId");
		
		//3) VO 가공~ 패스
		
		//4) Service 호출
		
		new MemberService().idCheck(checkId);
		//SELECT USER_ID FROM MEMBER WHERE USER_ID = '입력한거' => 리설트셋이 0행
		
		//SELECT COUNT(*) FROM MEMBER WHERE USER_ID = '입력한거'
		
		int count = new MemberService().idCheck(checkId);
		
		//5) 결과에 따른 응답
		//AJAX는 데이터만 돌려준다
		//=> response.getWriter().print()
		//중복값이 있을때 count ==1 => "NNNNN"
		//중복값이 없을떄 count ==0 => "NNNNY"
		
		response.setContentType("text/html ; charset = UTF-8");
		
		

		
		response.getWriter().print(count>0? "NNNNN":"NNNNY");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

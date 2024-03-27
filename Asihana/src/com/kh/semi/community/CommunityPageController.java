package com.kh.semi.community;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.community.model.service.CommunityService;
import com.kh.semi.community.model.vo.Community;
import com.kh.semi.pageInfo.model.vo.PageInfo;

/**
 * Servlet implementation class CommunityPageController
 */
@WebServlet("/page")
public class CommunityPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1. 어떤 방식인가??? => 쿼리 스트링 요청 받음 => GET방식
		
		// 2. 값 뽑기
		// 페이징 처리
		// 페이징 번호 노출을 하기위해서는 총 게시글의 갯수가 필요함
		
		int listCount; 
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount =new CommunityService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		
		pageLimit=;
		
		boardLimit=;
		
		maxPage = (int)Math.ceil(double)listCount/ boardLimit);
		
		startPage = (currentPage-1) / pageLimit * pageLimit +1;
		
		
		endPage = startPage + pageLimit -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// 3. 가공
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 4 service지정
		ArrayList<Community> list= new CommunityService().selectList(pi);
		
		
		// 응답화면
		request.
		
		
		
		
		
		
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

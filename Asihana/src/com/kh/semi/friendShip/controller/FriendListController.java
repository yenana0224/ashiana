package com.kh.semi.friendShip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.pageInfo.model.vo.PageInfo;

/**
 * Servlet implementation class FriendListController
 */
@WebServlet("/friendList")
public class FriendListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;//현재 일반게시판의 게시글 총 개수 =? board 테이블로부터 count (*) 활용해서 조회
		int currentPage;//현재페이지(사용자가 요청한 페이지) -> request.getParameter("currentPage")
		int pageLimit;//페이지 하단에 보여질 페이징바의 최대 개수 => 10개 고정
		int boardLimit; //한 페이지에 보여질 게시글의 최대 개수 -? 10개 고정
		
		int maxPage; //가장 마지막 페이지가 몇 번 페이지인지(총 페이지의 개수)
		int startPage; //페이지 하단에 보여질 페이징바의 시작수
		int endPage;//페이지 하단에 보여질 페이징 바의 끝수
		
		//*listCount : 총 게시글의 수
		listCount = new FriendService().selectListCount();
		
		//*Currentage : 현재페이지(사욪가 ㅏ요청한 ㅔ이지)
		currentPage=  Integer.parseInt(request.getParameter("currentPage"));	
		
//		System.out.println(currentPage);
//		System.out.println(listCount);
		
		//*pageList : 페이징 바 최대개수
		pageLimit = 10;
		
		//*boardLimit : 한 페이지에 보여질 게시글의 최대 개수
		boardLimit = 10;
		
		//*maxPage : 가장 마지막페이지가 몇번 페이지인지(총 페이지 개수)
		
		/*
		 * 
		 *  listCount, boardLimit 에 영향을 받음
		 *
		 *  -공식 구하기
		 *  
		 *  단, boardLimit에 10이라는 가정하에 규칙을 찾아보자
		 *  총개수 (listCount) / 게시글 개수(boardList) ==maxPage(마지막페이지)
		 *  100				/		10			==10.0	10페이지
		 *  107				/		10			==10.7	11페이지
		 *  111				/		10			==11.1	12페이지
		 *  
		 *  ==> 나눗셈결과에 소수점을 붙여서 올림처리를 할 경우 maxPage가 됨
		 *  
		 *  스텝
		 *  1. listCount 를 double 로 변환
		 *  2. listCount / boardLimit
		 *  3. Math.ceil() => 결과를 올림처리
		 *  4. 결과값을 int로 형변환
		 *  
		 */
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		//*startPage : 페이지 하단에 보여질 페이징 바의  시작 수
		/*
		 * currentPage, pageLimit에 영향을 받음
		 * 
		 * -공식
		 * 단,pageLimit이 10이라고 가정
		 * 
		 * -startPage : 1, 11, 21, 31, 41 =>n*10+!
		 * 
		 * pageLimit이 5
		 * 
		 * -startPage : 1,6,11, 16
		 * 
		 * 즉 startPage = n*pageLimit +1 ;
		 * 
		 * currentPage			startPage
		 * 		1					1
		 * 		5					1
		 * 		10					1
		 * 		13					11
		 * 		20					11
		 * 		29					21
		 * 		
		 * 
		 * => 1~10  : n*10 +1 ==> n==0
		 * =>11~20	: n*10 +1 ==> n==1
		 * =>21~30	: n*10 +1 ==> n==2
		 * 
		 * 
		 * 1~10 / 10 => 0~1
		 * 11~20 / 10 => 1~2
		 * 21~30 / 10 => 2~3
		 * 
		 * n= (currentPage -1)/pageLimit;
		 * 
		 */
		startPage=(currentPage -1 ) /pageLimit*pageLimit +1;
		
		
		//*endPage : 페이지 하단에 보여질 페이징바의 끝 수
		
		/*
		 * startPage, pageLimit 에 영향을 받음(단, maxPage도 마지막 페이징 바에 대해 영향을 끼침)
		 * 
		 * -공식
		 * 단, pageLimit이 10이라고 가정
		 * 
		 * startPage : 1 => endPage :10
		 * startPage : 11 => endPage :20
		 * startPage : 21 => endPage :30
		 * 
		 * =>endPage = startPage + pageLimit -1;
		 * 
		 */
		endPage = startPage + pageLimit - 1;
		
		//StartPage가 31이라서 endPage 에는 40이 들어갔는데
		//maxPage가 35다??
		//endPage 를 maxPage값으로 변경
		//endPage를 maxPage로 변경
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	

		
		//4)Service 호출
		ArrayList<Board> boardlist = new BoardService().selectList(pi);
		
		//5)응답화면 지정
		request.setAttribute("boardList", boardlist);
		request.setAttribute("pageInfo", pi);
		
		request.getRequestDispatcher("/views/board/boardList.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

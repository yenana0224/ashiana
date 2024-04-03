package com.kh.semi.travelReview.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.AttachmentFile;
import com.kh.semi.travelReview.model.service.TravelReviewService;
import com.kh.semi.travelReview.model.vo.TravelReview;

/**
 * Servlet implementation class TravelReviewUpdateFormController
 */
@WebServlet("/updateForm.review")
public class TravelReviewUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelReviewUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		// 업데이트 창에 보여줄 값 담기
		// 도시목록, 해시태그 목록 가져오기
		request.getSession().getAttribute("cityList");
		request.getSession().getAttribute("hashTagList");
		
		// 해당 review 가져오기
		TravelReview review = new TravelReviewService().selectDetailReview(reviewNo);
		request.setAttribute("review", review);
		
		// 첨부파일 가져오기 
		List<AttachmentFile> fileList = new TravelReviewService().selectAttachmentFileList(reviewNo);
		request.setAttribute("fileList", fileList);
			
		request.getRequestDispatcher("views/travelReview/travelReviewUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.kh.semi.admin.model.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.customer.model.service.CustomerService;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.customer.model.vo.NoticeFile;
import com.kh.semi.info.model.service.InfoService;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.Nation;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.pageInfo.model.vo.PageInfo;
import com.oreilly.servlet.MultipartRequest;

public class adminController {
	
	public String noticeList(HttpServletRequest request, HttpServletResponse response) {

		String select = request.getParameter("select");
		String searchContent = request.getParameter("searchContent");

		int listCount = new CustomerService().selectCount(select, searchContent);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int pageLimit = 10;
		int boardLimit = 15;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		// endPage를 maxPage값으로 변경
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		List<Notice> noticeList = new ArrayList();
		
		if(select != null) {
			noticeList = new CustomerService().noticeSearch(select, searchContent, pi);
		} else {
			noticeList = new CustomerService().noticeList(pi);
		}
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("searchContent", searchContent);
		request.setAttribute("select", select);

		return "views/admin/adminNoticeList.jsp";
	}
	
	public String storyList(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new InfoService().countStory();
		int pageLimit = 10;
		int boardLimit = 15;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = ((currentPage - 1) / pageLimit ) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) endPage = maxPage;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Story> storyList = new InfoService().storyList(pi);
		
		String view = "";
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", storyList);
		
		view = "views/admin/adminStoryList.jsp";
		
		return view;
	}
	
	public String noticeInsertForm(HttpServletRequest request, HttpServletResponse response) {
		
		return "views/admin/noticeInsertForm.jsp";
	}
	
	public String noticeDetail(HttpServletRequest request, HttpServletResponse response) {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		int boardType = 4;
		Notice notice = new CustomerService().noticeDetail(noticeNo);
		
		NoticeFile noticeFile = new CustomerService().selectFile(noticeNo, boardType);
		
		request.setAttribute("notice", notice);
		request.setAttribute("noticeFile", noticeFile);
		return "views/admin/noticeDetail.jsp";
	}
	
	public String changeHold(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String[] holds = request.getParameterValues("hold");
		int result = new AdminService().changeHolds(holds);

		return "/notice.admin?currentPage=1";
	}
	
	public String noticeUpdateForm(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		int boardType = 4;
		Notice notice = new CustomerService().noticeDetail(noticeNo);
		NoticeFile noticeFile = new CustomerService().selectFile(noticeNo, boardType);
		
		request.setAttribute("notice", notice);
		request.setAttribute("noticeFile", noticeFile);
		
		return "views/admin/noticeUpdateForm.jsp";		
	}
	
	public String noticeUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		String view = "";

		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024* 1024* 10;
			String savePath = request.getServletContext().getRealPath("/resources/notice");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int noticeNo = Integer.parseInt(multiRequest.getParameter("noticeNo"));
			String noticeTitle = multiRequest.getParameter("title");
			String noticeContent = multiRequest.getParameter("content");
			String noticeWriter = multiRequest.getParameter("userNo");
			String noticeHold = "N";
			if(multiRequest.getParameter("hold") != null ) noticeHold = "Y";
			
			Notice notice = new Notice();
			notice.setNoticeNo(noticeNo);
			notice.setNoticeTitle(noticeTitle);
			notice.setNoticeContent(noticeContent);
			notice.setNoticeWriter(noticeWriter);
			notice.setNoticeHold(noticeHold);

			NoticeFile noticeFile = null;
			String key = "newFile";
			// 새로운 업로드 파일이 존재한다면
			if(multiRequest.getOriginalFileName(key) != null) {
				noticeFile = new NoticeFile();
				noticeFile.setOriginName(multiRequest.getOriginalFileName(key));
				noticeFile.setChangeName(multiRequest.getFilesystemName(key));
				noticeFile.setBoardType(Integer.parseInt(multiRequest.getParameter("boardType")));
				noticeFile.setFilePath("resources/notice");
				
				// 원본파일 존재시 DB update필요 > 원본 fileNo
				if(multiRequest.getParameter("fileNo") != null) {
					noticeFile.setFileNo(Integer.parseInt(multiRequest.getParameter("fileNo")));
				} else {
					// 원본파일 X > DB insert 필요. 게시글번호 필요
					noticeFile.setBoardNo(noticeNo);
				}
			}
			
			if(new AdminService().updateNotice(notice, noticeFile) > 0) {
				view = "/noticeDetail.admin?noticeNo=" + noticeNo;
			} else {
				view = "/notice.admin?currentPage=1";
			}
		}
		return view;
	}
	
	
	public String storyDel(HttpServletRequest request, HttpServletResponse response) {
		String view = "";
		String[] storyNos = request.getParameterValues("storyNo");
		if(new AdminService().storyDel(storyNos) > 0) {
			view = "/story.admin?currentPage=1";
		}
		return view;
	}
	
	public String storyInsertForm(HttpServletRequest request, HttpServletResponse response) {
		
		return "views/admin/storyInsertForm.jsp";
	}
	
	public String nationList(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new InfoService().countNation();
		int pageLimit = 10;
		int boardLimit = 15;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = ((currentPage - 1) / pageLimit ) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) endPage = maxPage;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Nation> nationList = new InfoService().nationList(pi);
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", nationList);
		
		return  "views/admin/adminInfoList.jsp";
	}
	
	public String allCityList(HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new InfoService().countCity();
		int pageLimit = 10;
		int boardLimit = 15;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = ((currentPage - 1) / pageLimit ) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) endPage = maxPage;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		System.out.println(pi.toString());
		
		List<City> cityList = new InfoService().allCityList(pi);
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", cityList);
		
		return "views/admin/adminCityList.jsp";
		
	}
	
	public String selectNation(HttpServletRequest request, HttpServletResponse response) {
		
		return "views/admin/nationInfoDetail.jsp";
	}
	
}

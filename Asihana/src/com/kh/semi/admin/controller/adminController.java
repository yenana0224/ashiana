package com.kh.semi.admin.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.common.AttachmentFile;
import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.customer.model.service.CustomerService;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.customer.model.vo.NoticeFile;
import com.kh.semi.info.model.service.CityService;
import com.kh.semi.info.model.service.InfoService;
import com.kh.semi.info.model.service.NationService;
import com.kh.semi.info.model.service.StoryService;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.Currency;
import com.kh.semi.info.model.vo.Language;
import com.kh.semi.info.model.vo.Nation;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.info.model.vo.StoryFile;
import com.kh.semi.info.model.vo.Visa;
import com.kh.semi.info.model.vo.Voltage;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.pageInfo.model.vo.PageInfo;
import com.oreilly.servlet.MultipartRequest;

public class adminController {
	
	/***
	 * 공지사항 목록 + 검색
	 * 
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
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
	
	
	/***
	 * 스토리 목록 + 검색
	 * @param request
	 * @param response
	 * @return
	 */
	public String storyList(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new StoryService().countStory();
		if(category != null && category.equals("title")) listCount = new StoryService().countSelectTitle(keyword);
		else if(category != null && category.equals("content")) listCount = new StoryService().countSelectContent(keyword);
		
		int pageLimit = 10;
		int boardLimit = 15;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) endPage = maxPage;

		List<StoryFile> storyList = new ArrayList();
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		if(category != null && category.equals("title")) {
			storyList = new StoryService().searchTitle(pi, keyword);
		} else if (category != null && category.equals("content")) {
			storyList = new StoryService().searchContent(pi, keyword);
		} else if(category == null) {
			storyList = new StoryService().storyList(pi);
		}

		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", storyList);
		request.setAttribute("count", listCount);
		request.setAttribute("category", category);
		request.setAttribute("keyword", keyword);

		return "views/admin/adminStoryList.jsp";
	}
	
	/***
	 * 공지사항 작성페이지로 이동
	 * @param request
	 * @param response
	 * @return
	 */
	public String noticeInsertForm(HttpServletRequest request, HttpServletResponse response) {
		
		return "views/admin/noticeInsertForm.jsp";
	}
	
	/***
	 * 공지사항 상세보기
	 * @param request
	 * @param response
	 * @return
	 */
	public String noticeDetail(HttpServletRequest request, HttpServletResponse response) {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		int boardType = 4;
		Notice notice = new CustomerService().noticeDetail(noticeNo);
		
		NoticeFile noticeFile = new CustomerService().selectFile(noticeNo, boardType);
		
		request.setAttribute("notice", notice);
		request.setAttribute("noticeFile", noticeFile);
		return "views/admin/noticeDetail.jsp";
	}
	
	/***
	 * 공지사항 고정
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String changeHold(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String[] holds = request.getParameterValues("hold");
		int result = new AdminService().changeHolds(holds);

		return "/notice.admin?currentPage=1";
	}
	
	/***
	 * 공지사항 수정페이지 이동
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
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
	
	/***
	 * 공지사항 수정
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
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
	
	/***
	 * 스토리 삭제
	 * @param request
	 * @param response
	 * @return
	 */
	public String storyDel(HttpServletRequest request, HttpServletResponse response) {
		String view = "";
		String[] storyNos = request.getParameterValues("storyNo");
		if(new AdminService().storyDel(storyNos) > 0) {
			view = "/story.admin?currentPage=1";
		}
		return view;
	}
	
	/***
	 * 스토리 작성페이지 이동
	 * @param request
	 * @param response
	 * @return
	 */
	public String storyInsertForm(HttpServletRequest request, HttpServletResponse response) {
		
		return "views/admin/storyInsertForm.jsp";
	}
	
	/***
	 * 스토리 작성
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public String storyInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String view = "";
		int fileResult = 1;
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getServletContext().getRealPath("/resources/story");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String storyTitle = multiRequest.getParameter("title");
			String storyContent = multiRequest.getParameter("content");
			String storyFrom = multiRequest.getParameter("from");
			
			Story story = new Story();
			story.setStoryTitle(storyTitle);
			story.setStoryContent(storyContent);
			story.setStoryFrom(storyFrom);
			
			
			StoryFile file = null;
	
			if(multiRequest.getOriginalFileName("storyFile") != null) {
				file = new StoryFile();
				file.setBoardNo(Integer.parseInt(multiRequest.getParameter("board")));
				file.setOriginName(multiRequest.getOriginalFileName("storyFile"));
				file.setChangeName(multiRequest.getFilesystemName("storyFile"));
				file.setFilePath("/resources/story");
			}

			int result = new StoryService().insertStory(story, file);
			
			if(result > 0) view = "/story.admin?currentPage=1";
		}
		return view;
	}
	
	/***
	 * 스토리 상세페이지
	 * @param request
	 * @param response
	 * @return
	 */
	public String storyDetail(HttpServletRequest request, HttpServletResponse response) {
		int storyNo = Integer.parseInt(request.getParameter("storyNo"));
		StoryFile file = new StoryService().detailStory(storyNo);
		request.setAttribute("file", file);
		return "views/admin/storyDetail.jsp";
	}
	
	/***
	 * 스토리 수정페이지로 이동
	 * @param request
	 * @param response
	 * @return
	 */
	public String storyUpdateForm(HttpServletRequest request, HttpServletResponse response) {
		int storyNo = Integer.parseInt(request.getParameter("storyNo"));
		StoryFile file = new StoryService().detailStory(storyNo);
		request.setAttribute("file", file);
		return "views/admin/storyUpdateForm.jsp";
	}
	
	/**
	 * 스토리 수정
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public String storyUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String view = "";
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getServletContext().getRealPath("/resources/story");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int storyNo = Integer.parseInt(multiRequest.getParameter("storyNo"));
			String storyTitle = multiRequest.getParameter("title");
			String storyContent = multiRequest.getParameter("StoryContent");
			String storyFrom = multiRequest.getParameter("from");
			
			Story story = new Story();
			story.setStoryNo(storyNo);
			story.setStoryTitle(storyTitle);
			story.setStoryContent(storyContent);
			story.setStoryFrom(storyFrom);
			
			StoryFile file = null;
			if(multiRequest.getOriginalFileName("newFile") != null) {
				file = new StoryFile();
				file.setBoardNo(Integer.parseInt(multiRequest.getParameter("board")));
				file.setOriginName(multiRequest.getOriginalFileName("newFile"));
				file.setChangeName(multiRequest.getFilesystemName("newFile"));
				file.setFilePath("/resources/story");
			}
			
			int result = new StoryService().updateStory(story, file);
			if (result > 0) {
				view = "/storyDetail.admin?storyNo=" + storyNo;
			} else {
				
			}
		}
		return view;
	}
	
	/***
	 * 국가 목록 + 검색
	 * @param request
	 * @param response
	 * @return
	 */
	public String nationList(HttpServletRequest request, HttpServletResponse response) {
		
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");

		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new NationService().countNation();
		int pageLimit = 10;
		int boardLimit = 15;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Nation> nationList = new ArrayList();
		
		if(category != null) {
			nationList = new NationService().searchName(keyword, pi);
		} else {
			nationList = new NationService().nationList(pi);
		}
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", nationList);
		request.setAttribute("category", category);
		request.setAttribute("keyword", keyword);
		
		return  "views/admin/adminInfoList.jsp";
	}
	
	/***
	 * 도시 목록 + 검색
	 * @param request
	 * @param response
	 * @return
	 */
	public String allCityList(HttpServletRequest request, HttpServletResponse response) {
		
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new CityService().countCity();
		if(category != null) listCount = new CityService().countSelectCity(keyword); 
		int pageLimit = 10;
		int boardLimit = 15;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) endPage = maxPage;

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		List<City> cityList = new ArrayList();
		
		if(category != null) {
			cityList = new CityService().searchName(keyword, pi);
		} else {
			cityList = new CityService().allCityList(pi);
		}

		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", cityList);
		request.setAttribute("category", category);
		request.setAttribute("keyword", keyword);
		
		return "views/admin/adminCityList.jsp";
		
	}
	
	/***
	 * 국가 상세페이지
	 * @param request
	 * @param response
	 * @return
	 */
	public String nationInfo(HttpServletRequest request, HttpServletResponse response) {
		int nationNo = Integer.parseInt(request.getParameter("nationNo"));
		Nation nation = new NationService().searchNation(nationNo);
		
		if(new InfoService().nationLang(nationNo) != null) {
			nation.setLanguage(new InfoService().nationLang(nationNo));
		}
		
		if(new InfoService().nationCur(nationNo) != null) {
			nation.setCurrency(new InfoService().nationCur(nationNo));
		}

		if(new InfoService().nationVol(nationNo) != null) {
			nation.setVoltage(new InfoService().nationVol(nationNo));
		}

		AttachmentFile title = new NationService().selectTitlePhoto(nationNo);
		AttachmentFile file = new NationService().selectPhoto(nationNo);
				
		request.setAttribute("nation", nation);
		if(title != null) request.setAttribute("title", title);
		if(file != null) request.setAttribute("file", file);
		
		return "views/admin/nationInfoDetail.jsp";
	}
	
	/**
	 * 국가 수정 페이지로 이동
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String nationUpdateForm(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		
		int nationNo = Integer.parseInt(request.getParameter("nationNo"));
		
		Nation nation = new Nation();
		nation.setNationNo(nationNo);
		nation.setNationName(request.getParameter("nationName"));
		nation.setNationContent(request.getParameter("nationContent"));
		nation.setVoltage(request.getParameter("voltage"));
		nation.setLanguage(request.getParameter("language"));
		nation.setCurrency(request.getParameter("currency"));
		nation.setVisaName(request.getParameter("visa"));
		AttachmentFile title = new NationService().selectTitlePhoto(nationNo);
		AttachmentFile file = new NationService().selectPhoto(nationNo);
		
		List<Visa> visaList = new InfoService().visaList();
		List<Language> langList = new InfoService().langList();
		List<Voltage> volList = new InfoService().volList();
		List<Currency> curList = new InfoService().curList();
		
 		request.setAttribute("visaList", visaList);
 		request.setAttribute("langList", langList);
 		request.setAttribute("volList", volList);
 		request.setAttribute("curList", curList);
		
		request.setAttribute("nation", nation);
		request.setAttribute("title", title);
		request.setAttribute("file", file);

		
		return "views/admin/nationUpdateForm.jsp";		
	}
	
	/***
	 * 국가 수정
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public String nationUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String view = "";
	
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getServletContext().getRealPath("/resources/info/nation");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int oldNo = Integer.parseInt(multiRequest.getParameter("nationNo"));
			int newNationNo = Integer.parseInt(multiRequest.getParameter("newNationNo"));
			int visaNo = Integer.parseInt(multiRequest.getParameter("visaNo"));

			String nationName = multiRequest.getParameter("nationName");
			String nationContent = multiRequest.getParameter("nationContent");
			
			Nation nation = new Nation();
			nation.setNationNo(newNationNo);
			nation.setNationName(nationName);
			nation.setNationContent(nationContent);
			
			String[] volNo = multiRequest.getParameterValues("volNo");
			String[] curNo = multiRequest.getParameterValues("curNo");
			String[] langNo = multiRequest.getParameterValues("langNo");

			AttachmentFile title = null;
			AttachmentFile file = null;
			
			if(multiRequest.getOriginalFileName("newTitleFile") != null) {
				title = new AttachmentFile();
				title.setOriginName(multiRequest.getOriginalFileName("newTitleFile"));
				title.setChangeName(multiRequest.getFilesystemName("newTitleFile"));
				title.setFilePath("/resources/info/nation");
			}
			
			if(multiRequest.getOriginalFileName("newFile") != null) {
				file = new AttachmentFile();
				file.setOriginName(multiRequest.getOriginalFileName("newFile"));
				file.setChangeName(multiRequest.getFilesystemName("newFile"));
				file.setFilePath("/resources/info/nation");
			}

			int result = new NationService().updateNation(oldNo, visaNo, nation, volNo, curNo, langNo, title, file);
		
			if(result > 0) view = "/info.admin?currentPage=1";
		}
		
		return view;
	}

	/***
	 * 국가 추가 페이지로 이동
	 * @param request
	 * @param response
	 * @return
	 */
	public String nationInsertForm(HttpServletRequest request, HttpServletResponse response) {
		
		List<Visa> visaList = new InfoService().visaList();
		List<Language> langList = new InfoService().langList();
		List<Voltage> volList = new InfoService().volList();
		List<Currency> curList = new InfoService().curList();
		
 		request.setAttribute("visaList", visaList);
 		request.setAttribute("langList", langList);
 		request.setAttribute("volList", volList);
 		request.setAttribute("curList", curList);
		
		return "views/admin/nationInsertForm.jsp";
	}
	
	/***
	 * 국가 추가 (국가번호, 국가이름, 국가설명, 전압, 비자, 언어, 화폐)
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public String nationInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		int result = 0;
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getServletContext().getRealPath("/resources/info/nation");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int nationNo = Integer.parseInt(multiRequest.getParameter("nationNo"));
			String nationName = multiRequest.getParameter("nationName");
			String nationContent = multiRequest.getParameter("nationContent");
			
			Nation nation = new Nation();
			nation.setNationNo(nationNo);
			nation.setNationName(nationName);
			nation.setNationContent(nationContent);

			int visaNo = Integer.parseInt(multiRequest.getParameter("visaNo"));
			String[] volNo = multiRequest.getParameterValues("volNo");
			String[] curNo = multiRequest.getParameterValues("curNo");
			String[] langNo = multiRequest.getParameterValues("langNo");
			
			AttachmentFile title = null;
			AttachmentFile file = null;
			
			if(multiRequest.getOriginalFileName("titleFile") != null) {
				title = new AttachmentFile();
				title.setOriginName(multiRequest.getOriginalFileName("titleFile"));
				title.setChangeName(multiRequest.getFilesystemName("titleFile"));
				title.setFilePath("/resources/info/nation");
			}
			
			if(multiRequest.getOriginalFileName("file") != null) {
				file = new AttachmentFile();
				file.setOriginName(multiRequest.getOriginalFileName("file"));
				file.setChangeName(multiRequest.getFilesystemName("file"));
				file.setFilePath("/resources/info/nation");
			}
			result = new NationService().insertNation(nation, visaNo, volNo, curNo, langNo, title, file);
		}
		return "/info.admin?currentPage=1";
	}
	
	/***
	 * 도시 상세페이지
	 * @param request
	 * @param response
	 * @return
	 */
	public String cityinfo(HttpServletRequest request, HttpServletResponse response) {
		
		int cityNo = Integer.parseInt(request.getParameter("cityNo"));
		int nationNo = Integer.parseInt(request.getParameter("nationNo"));
		City city = new CityService().selectCity(cityNo);
		AttachmentFile file = new CityService().selectPhoto(cityNo);
		
		request.setAttribute("city", city);
		request.setAttribute("file", file);
		request.setAttribute("nationNo", nationNo);
		
		return "views/admin/cityInfoDetail.jsp";
	}
	
	/***
	 * 도시 수정 페이지로 이동
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String cityUpdateForm(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		
		int cityNo = Integer.parseInt(request.getParameter("cityNo"));
		int nationNo = Integer.parseInt(request.getParameter("nationNo"));
		City city = new CityService().selectCity(cityNo);
		AttachmentFile file = new CityService().selectPhoto(cityNo);
		List<Nation> list = new NationService().allNationList();
		
		request.setAttribute("city", city);
		request.setAttribute("file", file);
		request.setAttribute("list", list);
		request.setAttribute("cityNo", cityNo);
		request.setAttribute("nationNo", nationNo);
		
		return "views/admin/cityUpdateForm.jsp";
	}
	
	/***
	 * 도시 수정
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public String cityUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String view = "";
	
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getServletContext().getRealPath("/resources/info/city");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int nationNo = Integer.parseInt(multiRequest.getParameter("nationNo"));
			int cityNo = Integer.parseInt(multiRequest.getParameter("cityNo"));
			String nationName = multiRequest.getParameter("nationName");
			String cityName = multiRequest.getParameter("cityName");
			String cityContent = multiRequest.getParameter("cityContent");
			String flyingTime = multiRequest.getParameter("flyingTime");

			City city = new City();
			city.setNationNo(nationNo);
			city.setCityNo(cityNo);
			city.setNationName(nationName);
			city.setCityName(cityName);
			city.setCityContent(cityContent);
			city.setFlyingTime(flyingTime);
						
			AttachmentFile file = null;

			if(multiRequest.getOriginalFileName("newFile") != null) {
				file = new AttachmentFile();
				file.setOriginName(multiRequest.getOriginalFileName("newFile"));
				file.setChangeName(multiRequest.getFilesystemName("newFile"));
				file.setFilePath("/resources/info/city");
			}
			
			int result = new CityService().updateCity(city, file);
			if(result > 0) view = "/cityinfo.admin?nationNo="+ nationNo + "&cityNo=" + cityNo;

		}
		return view;
	}
	
	/***
	 * 회원 목록 + 검색
	 * @param request
	 * @param response
	 * @return
	 */
	public String memberList(HttpServletRequest request, HttpServletResponse response){
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new AdminService().countMember();
		int pageLimit = 10;
		int boardLimit = 20;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		List<Member> list = new AdminService().memberList(pi);
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", list);
		
		return "views/admin/adminMemberList.jsp";
	}
	
	/**
	 * 회원탈퇴
	 * @param request
	 * @param response
	 * @return
	 */
	public String memberDelete(HttpServletRequest request, HttpServletResponse response) {
		String[] userNos = request.getParameterValues("userNo");
		int result = 1;
		for(int i = 0; i<userNos.length; i++) {
			int userNo = Integer.parseInt(userNos[i]);
			int delResult = new AdminService().memberDelete(userNo);
			result = result * delResult;
		}
		return "/member.admin?currentPage=1";
	}
	
	/**
	 * 회원 탈퇴 목록
	 * @param request
	 * @param response
	 * @return
	 */
	public String userDeleteList(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int listCount = new AdminService().countMember();
		int pageLimit = 10;
		int boardLimit = 20;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		List<Member> list = new AdminService().userDeleteList(pi);
		
		request.setAttribute("pageInfo", pi);
		request.setAttribute("list", list);
		
		return "views/admin/adminUserDeleteList.jsp";
	}
	
	/**
	 * 회원 복구
	 * @param request
	 * @param response
	 * @return
	 */
	public String memberRollback(HttpServletRequest request, HttpServletResponse response) {
		String[] userNos = request.getParameterValues("userNo");
		int result = 1;
		for(int i = 0; i < userNos.length; i++) {
			int userNo = Integer.parseInt(userNos[i]);
			int rollbackResult = new AdminService().memberRollback(userNo);
			result = result * rollbackResult;
		}
		
		if(result > 0) {
			
		} else {
			
		}
		return "/notmember.admin?currentPage=1";
	}
	

}

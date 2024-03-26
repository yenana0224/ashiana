package com.kh.semi.customer.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.customer.model.dao.CustomerDao;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.customer.model.vo.NoticeFile;
import com.kh.semi.customer.model.vo.QNA;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class CustomerService {
	
	public Notice[] notice() {
		
		Connection conn = getConnection();
		
		Notice[] notice = new Notice[3]; 
		notice = new CustomerDao().notice(conn);
		close(conn);
		
		return notice;
	}
	
	public int selectCount(String select, String searchContent) {
		
		Connection conn = getConnection();
		
		int result = 0;
		
		
		if(searchContent != null) {
			if(select.equals("title")) {
				result = new CustomerDao().selectTitleCount(conn, searchContent);
			} else {
				result = new CustomerDao().selectContentCount(conn, searchContent);
			}
		}else {
			result = new CustomerDao().selectCount(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	public List<Notice> noticeList(PageInfo pi){
		
		Connection conn = getConnection();
		
		
		List<Notice> list = new CustomerDao().noticeList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public List<Notice> noticeSearch(String search, String searchContent, PageInfo pi){
		
		Connection conn = getConnection();
		
		List<Notice> list = new ArrayList();
		
		if(search.equals("title")) {
			list = new CustomerDao().noticeTitleSearch(conn, searchContent, pi);
		} else {
			list = new CustomerDao().noticeContentSearch(conn, searchContent, pi);
		}
		
		close(conn);
		
		return list;
	}
	
	public int noticeInsert(Notice notice, NoticeFile noticeFile) {
		Connection conn = getConnection();
		int noticeResult = 0;
		int fileResult = 1;
		
		noticeResult = new CustomerDao().noticeInsert(conn, notice);

		if(noticeFile != null) {
			fileResult = new CustomerDao().attInsert(conn, noticeFile);
		} 
		
		int result = noticeResult * fileResult;
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	public Notice noticeDetail(int noticeNo) {
		Connection conn = getConnection();
		
		Notice notice = new CustomerDao().noticeDetail(conn, noticeNo);
		close(conn);
		return notice;
	}
	
	public int insertQa(QNA qna, NoticeFile file) {
		
		Connection conn = getConnection();

		int qnaResult = new CustomerDao().insertQa(conn, qna);
		
		int fileResult = 1;
		if(file != null) {
			fileResult = new CustomerDao().qnaInsertFile(conn, file);
		}
		if((qnaResult * fileResult) > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return (qnaResult * fileResult);
	}
	
	public int selectQnaCount(String select, String searchContent) {
		
		Connection conn = getConnection();
		
		int result = 0;
		
		
		if(searchContent != null) {
			if(select.equals("title")) {
				result = new CustomerDao().qnaTitleCount(conn, searchContent);
			} else {
				result = new CustomerDao().qnaContentCount(conn, searchContent);
			}
		}else {
			result = new CustomerDao().selectQnaCount(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	public List<QNA> qnaSearch(String search, String searchContent, PageInfo pi){
		
		Connection conn = getConnection();
		
		List<QNA> list = new ArrayList();
		
		if(search.equals("title")) {
			list = new CustomerDao().qnaTitleSearch(conn, searchContent, pi);
		} else {
			list = new CustomerDao().qnaContentSearch(conn, searchContent, pi);
		}
		
		close(conn);
		
		return list;
		
	}
	
	public List<QNA> qnaList(PageInfo pi){
		
		Connection conn = getConnection();
		
		
		List<QNA> list = new CustomerDao().qnaList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public NoticeFile selectFile(int noticeNo) {
		Connection conn = getConnection();
		NoticeFile file = new CustomerDao().selectFile(conn, noticeNo);
		close(conn);
		return file;
	}
	
}

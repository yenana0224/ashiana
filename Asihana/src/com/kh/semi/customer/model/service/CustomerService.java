package com.kh.semi.customer.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.customer.model.dao.CustomerDao;
import com.kh.semi.customer.model.vo.Notice;
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
	
}

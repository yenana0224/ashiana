package com.kh.semi.customer.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

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
	
	public int selectCount() {
		
		Connection conn = getConnection();
		
		int result = new CustomerDao().selectCount(conn);
		
		close(conn);
		
		return result;
	}
	
	
	public ArrayList<Notice> noticeList(PageInfo pi){
		
		Connection conn = getConnection();
		
		int holdCount = new CustomerDao().selectHoldCount(conn);
		
		ArrayList<Notice> list = new CustomerDao().noticeList(conn, pi, holdCount);
		
		close(conn);
		
		return list;
	}
	
	
	
}

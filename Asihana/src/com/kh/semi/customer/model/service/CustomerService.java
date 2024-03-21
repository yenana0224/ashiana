package com.kh.semi.customer.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.customer.model.dao.CustomerDao;
import com.kh.semi.customer.model.vo.Notice;

public class CustomerService {
	
	public Notice[] notice() {
		
		Connection conn = getConnection();
		
		Notice[] notice = new Notice[3]; 
		notice = new CustomerDao().notice(conn);
		close(conn);
		
		return notice;
	}
	
	public ArrayList<Notice> noticeList(){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new CustomerDao().noticeList(conn);
		
		close(conn);
		
		return list;
	}
	
	
	
}

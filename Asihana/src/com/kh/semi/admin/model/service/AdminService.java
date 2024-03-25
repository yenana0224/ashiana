package com.kh.semi.admin.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.admin.model.dao.AdminDao;
public class AdminService {
	
	
	public int changeHolds(String[] holds) {
		Connection conn = getConnection();
		int change = 1;
		
		System.out.println(new AdminDao().holdN(conn));
		/*
		if(new AdminDao().holdN(conn) > 0) {
			for(int i = 0; i<holds.length; i++) {
				int hold = Integer.parseInt(holds[i].toString());
				
				change *= new AdminDao().changeHolds(conn, hold);
			}
		}
		*/
		
		close(conn);
		return change;
	}

}

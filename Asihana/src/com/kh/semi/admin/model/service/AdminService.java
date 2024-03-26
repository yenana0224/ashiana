package com.kh.semi.admin.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.admin.model.dao.AdminDao;
public class AdminService {
	
	
	public int changeHolds(String[] holds) {
		Connection conn = getConnection();
		int change = 1;
		
		// 전체 고정 해제
		if(new AdminDao().holdN(conn) > 0) {
			for(int i = 0; i<holds.length; i++) {
				//System.out.println(holds[i]);
				int hold = Integer.parseInt(holds[i]);
				//System.out.println(hold);
				int holdResult = new AdminDao().changeHolds(conn, hold);
				// System.out.println(holdResult);
				change = change*holdResult;
			}
		}
		
		close(conn);
		return change;
		
		}

}

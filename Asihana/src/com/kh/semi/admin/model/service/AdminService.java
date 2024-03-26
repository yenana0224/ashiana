package com.kh.semi.admin.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.admin.model.dao.AdminDao;
import com.kh.semi.customer.model.dao.CustomerDao;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.customer.model.vo.NoticeFile;
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
		if(change > 0) commit(conn);
		close(conn);
		return change;
		
		}
	
	public int updateNotice(Notice notice, NoticeFile noticeFile) {
		Connection conn = getConnection();

		int fileResult = 1;
		
		int noticeResult = new AdminDao().updateNotice(conn, notice);
		
		// 파일이 있다면 update 없다면 insert
		if (noticeFile != null) {
			// 기존 파일이 있는지 확인 == fileNo
			if(noticeFile.getFileNo() > 0) {
				fileResult = new CustomerDao().attUpdate(conn, noticeFile);
			} else {
				fileResult = new CustomerDao().newAttInsert(conn, noticeFile);
			}
		}
		
		int result = fileResult * noticeResult;
		if(result > 0) commit(conn);
		close(conn);
		
		return fileResult * noticeResult;
	}
	
	public int storyDel(String[] storyNos) {
		Connection conn = getConnection();
		int result = 1;
		
		for(int i = 0; i<storyNos.length; i++) {
			int storyNo = Integer.parseInt(storyNos[i]);
			int del = new AdminDao().storyDel(conn, storyNo);
			result = result * del;
		}
		if(result > 0) commit(conn);
		close(conn);
		return result;
	}
	

}

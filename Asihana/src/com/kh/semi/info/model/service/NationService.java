package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.common.AttachmentFile;
import com.kh.semi.info.model.dao.InfoDao;
import com.kh.semi.info.model.dao.NationDao;
import com.kh.semi.info.model.vo.Currency;
import com.kh.semi.info.model.vo.Language;
import com.kh.semi.info.model.vo.Nation;
import com.kh.semi.info.model.vo.Voltage;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class NationService {
	
	// 국가리스트 페이징
	public List<Nation> nationList(PageInfo pi){
		Connection conn = getConnection();
		List<Nation> list = new NationDao().nationList(conn, pi);
		close(conn);
		return list;
	}
	
	// 전체국가리스트
	public List<Nation> allNationList(){
		Connection conn = getConnection();
		List<Nation> list = new NationDao().allNationList(conn);
		close(conn);
		return list;
	}
	
	// 대한민국을 제외한 전체 국가 갯수 조회
	public int countNation() {
		Connection conn = getConnection();
		int count = new NationDao().countNation(conn);
		close(conn);
		return count;
	}
	
	// 하나의 국가정보 : 국가번호, 국가이름, 국가소개, 비자
	public Nation searchNation(int nationNo) {
		Connection conn = getConnection();
		Nation nation = new NationDao().searchNation(conn, nationNo);
		close(conn);
		return nation;
	}
	
	
	// 국가 정보 수정 (정보, 타이틀사진, 정사각형사진)
	public int updateNation(Nation nation, AttachmentFile title, AttachmentFile file) {
		Connection conn = getConnection();
		
		int nationNo = nation.getNationNo();
		
		int nationResult = new NationDao().updateNation(conn, nation);
		
		int titleResult = 1;
		int photoResult = 1;
		
		if(title != null) {
			if(new NationDao().selectTitlePhoto(conn, nationNo) != null ) {
				// 타이틀사진 수정
				titleResult = new NationDao().updateTitlePhoto(conn, nationNo, title);
			} else {
				// 타이틀사진 삽입
				titleResult = new NationDao().insertTitlePhoto(conn, nationNo, title);
			}
		}
		
		if(file != null) {
			if(new NationDao().selectPhoto(conn, nationNo) != null ) {
				// 정사각사진 수정
				photoResult = new NationDao().updatePhoto(conn, nationNo, file);
			} else {
				// 정사각사진 삽입
				photoResult = new NationDao().insertPhoto(conn, nationNo, file);
			}
		}
		int result = nationResult * titleResult * photoResult;
		
		if(result > 0) commit(conn);
		
		close(conn);
		return nationResult * titleResult * photoResult;
	}
	
	// 국가 타이틀 사진 조회
	public AttachmentFile selectTitlePhoto(int nationNo) {
		Connection conn = getConnection();
		AttachmentFile title = new NationDao().selectTitlePhoto(conn, nationNo);
		close(conn);
		return title;
	}
	
	// 국가 정사각형 사진 조회
	public AttachmentFile selectPhoto(int nationNo) {
		Connection conn = getConnection();
		AttachmentFile file = new NationDao().selectPhoto(conn, nationNo);
		close(conn);
		return file;
	}
	
	// 국가이름조회
	public List<Nation> searchName(String keyword){
		Connection conn = getConnection();
		List<Nation> list = new NationDao().searchName(conn, keyword);
		close(conn);
		return list;
	}
	
	

}

package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.common.AttachmentFile;
import com.kh.semi.info.model.dao.InfoDao;
import com.kh.semi.info.model.dao.NationDao;
import com.kh.semi.info.model.vo.Nation;
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
	
	
	// 국가 정보 수정 (국가번호, 국가이름, 국가설명, 타이틀사진, 정사각형사진)
	public int updateNation(int oldNo, int visaNo, Nation nation, String[] volNo, String[] curNo, String[] langNo, AttachmentFile title, AttachmentFile file) {

		Connection conn = getConnection();

		// 기존 번호에 있는 정보가 있다면 전부 삭제
		if(new InfoDao().countCurrency(conn, oldNo) > 0) new InfoDao().deleteCurrency(conn, oldNo);
		if(new InfoDao().countLanguage(conn, oldNo) > 0) new InfoDao().deleteLanguage(conn, oldNo);
		if(new InfoDao().countVoltage(conn, oldNo) > 0) new InfoDao().deleteVoltage(conn, oldNo);
		if(new NationDao().selectTitlePhoto(conn, oldNo) != null) new NationDao().deleteTitlePhoto(conn, oldNo);
		if(new NationDao().selectPhoto(conn, oldNo) != null) new NationDao().deletePhoto(conn, oldNo);
		new InfoDao().deleteVisa(conn, oldNo);
		new NationDao().deleteNation(conn, oldNo);
		
		int result = 0;
		int nationNo = nation.getNationNo();

		int nationResult = new NationDao().insertNation(conn, nation);

		if(nationResult > 0 ) {
			
			int visaResult = new InfoDao().nationVisa(conn, visaNo, nationNo);
			int volResult = 1;
			if(volNo != null) {
				for(int i = 0; i < volNo.length; i++) {
					int voltageNo = Integer.parseInt(volNo[i]);
					volResult = volResult * new InfoDao().nationVol(conn, voltageNo, nationNo);
				}
			}
			
			int curResult = 1;
			if(curNo != null) {
				for(int i = 0; i < curNo.length; i++) {
					int currencyNo = Integer.parseInt(curNo[i]);
					curResult = curResult * new InfoDao().nationCur(conn, currencyNo, nationNo);
				}
			}
			
			int langResult = 1;
			if(langNo != null) {
				for(int i = 0; i < langNo.length; i++) {
					int languageNo = Integer.parseInt(langNo[i]);
					langResult = langResult * new InfoDao().nationLang(conn, languageNo, nationNo);
				}
			}
			
			int titleResult = 1;
			if(title != null) {
				titleResult = new NationDao().insertTitlePhoto(conn, nationNo, title);
			}
			
			int photoResult = 1;
			if(file != null) {
				photoResult = new NationDao().insertPhoto(conn, nationNo, file);
			}
			
			result = nationResult * visaResult * volResult * curResult * langResult * titleResult * photoResult;
		}

		if(result > 0) commit(conn);
		close(conn);
		return result;
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
	public List<Nation> searchName(String keyword, PageInfo pi){
		Connection conn = getConnection();
		List<Nation> list = new NationDao().searchName(conn, keyword, pi);
		close(conn);
		return list;
	}
	
	// 국가 추가
	public int insertNation(Nation nation, int visaNo, String[] volNo, String[] curNo, String[] langNo, AttachmentFile title, AttachmentFile file) {
		Connection conn = getConnection();
		int nationNo = nation.getNationNo();
		int result = 0;
		
		int nationResult = new NationDao().insertNation(conn, nation);
		
		if(nationResult > 0 ) {
				
			int visaResult = new InfoDao().nationVisa(conn, visaNo, nationNo);
			int volResult = 1;
			if(volNo != null) {
				for(int i = 0; i < volNo.length; i++) {
					int voltageNo = Integer.parseInt(volNo[i]);
					volResult = volResult * new InfoDao().nationVol(conn, voltageNo, nationNo);
				}
			}
			
			int curResult = 1;
			if(curNo != null) {
				for(int i = 0; i < curNo.length; i++) {
					int currencyNo = Integer.parseInt(curNo[i]);
					curResult = curResult * new InfoDao().nationCur(conn, currencyNo, nationNo);
				}
			}
			
			int langResult = 1;
			if(langNo != null) {
				for(int i = 0; i < langNo.length; i++) {
					int languageNo = Integer.parseInt(langNo[i]);
					langResult = langResult * new InfoDao().nationLang(conn, languageNo, nationNo);
				}
			}
			
			int titleResult = 1;
			if(title != null) {
				titleResult = new NationDao().insertTitlePhoto(conn, nationNo, title);
			}
			
			int photoResult = 1;
			if(file != null) {
				photoResult = new NationDao().insertPhoto(conn, nationNo, file);
			}
			
			result = nationResult * visaResult * volResult * curResult * langResult * titleResult * photoResult;
		}
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	public int deleteNation(int nationNo) {
		
		Connection conn = getConnection();
		
		int result = 1;
		
		if(new InfoDao().countCurrency(conn, nationNo) > 0) new InfoDao().deleteCurrency(conn, nationNo); 
		if(new InfoDao().countLanguage(conn, nationNo) > 0) new InfoDao().deleteLanguage(conn, nationNo);
		if(new InfoDao().countVoltage(conn, nationNo) > 0) new InfoDao().deleteVoltage(conn, nationNo);
		if(new NationDao().selectTitlePhoto(conn, nationNo) != null) new NationDao().deleteTitlePhoto(conn, nationNo);
		if(new NationDao().selectPhoto(conn, nationNo) != null) new NationDao().deletePhoto(conn, nationNo);
		new InfoDao().deleteVisa(conn, nationNo);
		new NationDao().deleteNation(conn, nationNo);
		
		if(result > 0) commit(conn);
		close(conn);
		
		return result;
	}
	
	

}

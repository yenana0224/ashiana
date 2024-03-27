package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

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
	
	public List<Nation> nationList(PageInfo pi){
		Connection conn = getConnection();
		List<Nation> list = new ArrayList<Nation>();
		list = new NationDao().nationList(conn, pi);
		close(conn);
		return list;
	}
	
	public int countNation() {
		Connection conn = getConnection();
		int count = new NationDao().countNation(conn);
		close(conn);
		return count;
	}
	
	public Nation searchNation(int nationNo) {
		Connection conn = getConnection();
		Nation nation = new NationDao().searchNation(conn, nationNo);
		close(conn);
		return nation;
	}
	
	public Nation nationInfo(int nationNo) {
		Connection conn = getConnection();
		Nation nation = new NationDao().searchNation(conn, nationNo);
		
		if(nation != null) {
			List<Language> langList = new InfoDao().searchLang(conn, nationNo);
			nation.setLanguage(langList.toString());
			List<Voltage> volList = new InfoDao().searchVol(conn, nationNo);
			nation.setVoltage(volList.toString());
			List<Currency> curList = new InfoDao().searchCur(conn, nationNo);
			nation.setCurrency(curList.toString());
		}
		close(conn);
		
		return nation;
	}
	
	public int updateNation(Nation nation, AttachmentFile title, AttachmentFile file) {
		Connection conn = getConnection();
		
		int nationNo = nation.getNationNo();
		
		int nationResult = new NationDao().updateNation(conn, nation);
		
		int titleResult = 1;
		int photoResult = 1;
		
		if(title != null) {
			if(new NationDao().selectTitlePhoto(conn, nationNo) != null ) {
				titleResult = new NationDao().updateTitlePhoto(conn, nationNo, title);
			} else {
				titleResult = new NationDao().insertTitlePhoto(conn, nationNo, title);
			}
		}
		
		if(file != null) {
			if(new NationDao().selectPhoto(conn, nationNo) != null ) {
				photoResult = new NationDao().updatePhoto(conn, nationNo, file);
			} else {
				photoResult = new NationDao().insertPhoto(conn, nationNo, file);
			}
		}
		
		close(conn);
		return nationResult * titleResult * photoResult;
	}
	
	public AttachmentFile selectTitlePhoto(int nationNo) {
		Connection conn = getConnection();
		AttachmentFile title = new NationDao().selectTitlePhoto(conn, nationNo);
		close(conn);
		return title;
	}
	
	public AttachmentFile selectPhoto(int nationNo) {
		Connection conn = getConnection();
		AttachmentFile file = new NationDao().selectPhoto(conn, nationNo);
		close(conn);
		return file;
	}
	
	

}

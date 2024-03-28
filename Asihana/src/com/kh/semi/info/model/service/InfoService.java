package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.common.AttachmentFile;
import com.kh.semi.info.model.dao.InfoDao;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.Currency;
import com.kh.semi.info.model.vo.Language;
import com.kh.semi.info.model.vo.Nation;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.info.model.vo.Voltage;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class InfoService {
	
	public String nationLang(int nationNo) {
		Connection conn = getConnection();
		List<Language> langList = new InfoDao().searchLang(conn, nationNo);
		String arr1 = langList.toString();
		String lang = arr1.substring(arr1.lastIndexOf("[")+1, arr1.lastIndexOf("]"));
		close(conn);
		
		return lang;
	}
	
	public String nationVol(int nationNo) {
		Connection conn = getConnection();
		List<Voltage> volList = new InfoDao().searchVol(conn, nationNo);
		String arr2 = volList.toString();
		String vol = arr2.substring(arr2.lastIndexOf("[")+1, arr2.lastIndexOf("]"));
		close(conn);
		return vol;
	}
	
	public String nationCur(int nationNo) {
		Connection conn = getConnection();
		List<Currency> curList = new InfoDao().searchCur(conn, nationNo);
		String arr3 = curList.toString();
		String cur = arr3.substring(arr3.lastIndexOf("[")+1, arr3.lastIndexOf("]"));
		close(conn);
		
		return cur;
	}


}

package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.info.model.dao.InfoDao;
import com.kh.semi.info.model.vo.Currency;
import com.kh.semi.info.model.vo.Language;
import com.kh.semi.info.model.vo.Visa;
import com.kh.semi.info.model.vo.Voltage;

public class InfoService {
	
	public String nationLang(int nationNo) {
		Connection conn = getConnection();
		List<Language> langList = new InfoDao().searchLang(conn, nationNo);
		List langArr = new ArrayList();
		for(Language l : langList) {
			langArr.add(l.getLanguageName());
		}
		String arr = String.join(",", langArr);

		close(conn);
		return arr;
	}
	public String nationVol(int nationNo) {
		Connection conn = getConnection();
		List<Voltage> volList = new InfoDao().searchVol(conn, nationNo);
		List volArr = new ArrayList();
		for(Voltage v : volList) {
			volArr.add(v.getVolName());
		}
		String arr = String.join(",", volArr);
		close(conn);
		return arr;
	}
	public String nationCur(int nationNo) {
		Connection conn = getConnection();
		List<Currency> curList = new InfoDao().searchCur(conn, nationNo);
		List curArr = new ArrayList();
		for(Currency c : curList) {
			curArr.add(c.getCurrencyName());
		}
		String arr = String.join(",", curArr);
		close(conn);
		return arr;
	}
	
	public List<Visa> visaList(){
		Connection conn = getConnection();
		List<Visa> list = new InfoDao().visaList(conn);
		close(conn);
		return list;
	}
	
	public int updateVisa(int nationNo, int visaNo) {
		Connection conn = getConnection();
		int result = new InfoDao().updateVisa(conn, nationNo, visaNo);
		close(conn);
		return result;
	}
	
	public List<Language> langList(){
		Connection conn = getConnection();
		List<Language> list = new InfoDao().langList(conn);
		close(conn);
		return list;
	}
	
	public List<Voltage> volList(){
		Connection conn = getConnection();
		List<Voltage> list = new InfoDao().volList(conn);
		close(conn);
		return list;
	}
	
	public List<Currency> curList(){
		Connection conn = getConnection();
		List<Currency> list = new InfoDao().curList(conn);
		close(conn);
		return list;
	}
	
	public int insertLang(String langName) {
		Connection conn = getConnection();
		int result = new InfoDao().insertLang(conn, langName);
		if(result > 0) commit(conn);
		close(conn);
		return result;
	}
	
	public int insertCur(String curName) {
		Connection conn = getConnection();
		int result = new InfoDao().insertCur(conn, curName);
		if(result > 0) commit(conn);
		close(conn);
		return result;
	}


}

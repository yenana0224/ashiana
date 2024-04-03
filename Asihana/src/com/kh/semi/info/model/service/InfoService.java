package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
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

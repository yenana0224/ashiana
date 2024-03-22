package com.kh.semi.info.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.info.model.dao.InfoDao;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.Currency;
import com.kh.semi.info.model.vo.Language;
import com.kh.semi.info.model.vo.Nation;
import com.kh.semi.info.model.vo.Voltage;

public class InfoService {
	
	public ArrayList<City> cityList(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<City> list = new ArrayList<City>();
		list = new InfoDao().cityList(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public Nation searchNation(int nationNo) {
		Connection conn = JDBCTemplate.getConnection();
		Nation nation = new InfoDao().searchNation(conn, nationNo);
		
		JDBCTemplate.close(conn);
		
		return nation;
	}
	
	public ArrayList<City> nationCity(int nationNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<City> list = new InfoDao().nationCity(conn, nationNo);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public int increaseCity(City c) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new InfoDao().increaseCity(conn, c);
		if(result > 0) JDBCTemplate.commit(conn);
		JDBCTemplate.close(conn);
		return result;
	}
	
	public City searchCity(City c) {
		Connection conn = JDBCTemplate.getConnection();
		
		// 국가기본정보
		City city = new InfoDao().searchCity(conn, c);
		
		if(city != null) {
			// 사용 언어 조회 
			List<Language> langList = new InfoDao().searchLang(conn, c.getNationNo());
			city.setLanguage(langList.toString());
			// 사용 전압 조회
			List<Voltage> volList = new InfoDao().searchVol(conn, c.getNationNo());
			city.setVoltage(volList.toString());
			// 사용 화폐 조회
			List<Currency> curList = new InfoDao().searchCur(conn, c.getNationNo());
			city.setCurrency(curList.toString());
			
			// 국가 번호 가져가기
			city.setNationNo(c.getNationNo());
		}
		
		JDBCTemplate.close(conn);
		return city;
	}
	
	

}

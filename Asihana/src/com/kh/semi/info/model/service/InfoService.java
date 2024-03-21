package com.kh.semi.info.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.info.model.dao.InfoDao;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.Nation;

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
		return nation;
	}
	
	public City searchCity(City c) {
		Connection conn = JDBCTemplate.getConnection();
		City city = new InfoDao().searchCity(conn, c);
				
		JDBCTemplate.close(conn);
		return city;
	}

}

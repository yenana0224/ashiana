package com.kh.semi.info.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.info.model.dao.CityDao;
import com.kh.semi.info.model.vo.City;

public class CityService {
	
	public ArrayList<City> cityList(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<City> list = new ArrayList<City>();
		list = new CityDao().cityList(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public City searchCity(City c) {
		
	}

}

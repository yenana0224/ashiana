package com.kh.semi.info.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.info.model.dao.InfoDao;
import com.kh.semi.info.model.vo.City;

public class InfoService {
	
	public ArrayList<City> cityList(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<City> list = new ArrayList<City>();
		list = new InfoDao().cityList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}

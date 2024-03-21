package com.kh.semi.info.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.info.model.vo.City;

public class InfoDao {
	
	private Properties prop = new Properties();
	
	public InfoDao() {
		String filePath = InfoDao.class.getResource("/sql/info/info-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<City> cityList(Connection conn){
		ArrayList<City> list = new ArrayList<City>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("cityList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				City c = new City();
				c.setCityNo(rset.getInt("CITY_NO"));
				c.setCityName(rset.getString("CITY_NAME"));
				c.setNationNo(rset.getInt("NATION_NO"));
				c.setNationName(rset.getString("NATION_NAME"));
				c.setCount(rset.getInt("COUNT"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);;
			JDBCTemplate.close(pstmt);
		}		
		return list;
	}

}

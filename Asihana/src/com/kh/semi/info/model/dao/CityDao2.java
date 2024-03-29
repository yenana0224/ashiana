package com.kh.semi.info.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.semi.common.AttachmentFile;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.CityFile;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class CityDao2 {
	
	private Properties prop = new Properties();
	
	public CityDao2() {
		String filePath = CityDao2.class.getResource("/sql/info/city-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<City> allCityList(Connection conn, PageInfo pi){
		List<City> list = new ArrayList<City>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("allCityList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int end = start + pi.getBoardLimit() - 1;
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				City city = new City();
				city.setNationNo(rset.getInt("NATION_NO"));
				city.setNationName(rset.getString("NATION_NAME"));
				city.setCityNo(rset.getInt("CITY_NO"));
				city.setCityName(rset.getString("CITY_NAME"));
				city.setCount(rset.getInt("COUNT"));
				list.add(city);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public City selectCity(Connection conn, int cityNo) {
		City city = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cityNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				city = new City();
				city.setCityNo(rset.getInt("CITY_NO"));
				city.setCityName(rset.getString("CITY_NAME"));
				city.setCityContent(rset.getString("CITY_CONTENT"));
				city.setNationNo(rset.getInt("NATION_NO"));
				city.setNationName(rset.getString("NATION_NAME"));
				city.setFlyingTime(rset.getString("FLYING_TIME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return city;
	}
	
	public City searchCity(Connection conn, City c) {
		City city = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchCity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCityName());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				city = new City();
				city.setCityNo(rset.getInt("CITY_NO"));
				city.setCityName(rset.getString("CITY_NAME"));
				city.setCityContent(rset.getString("CITY_CONTENT"));
				city.setNationName(rset.getString("NATION_NAME"));
				city.setFlyingTime(rset.getString("FLYING_TIME"));
				city.setVisaName(rset.getString("VISA_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return city;
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
			close(rset);
			close(pstmt);
		}		
		return list;
	}
	
	public List<CityFile> nationCity(Connection conn, int nationNo){
		List<CityFile> cityList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("nationCity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nationNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CityFile file = new CityFile();
				file.setNationNo(rset.getInt("NATION_NO"));
				file.setNationName(rset.getString("NATION_NAME"));
				file.setCityNo(rset.getInt("CITY_NO"));
				file.setCityName(rset.getString("CITY_NAME"));
				file.setFileNo(rset.getInt("FILE_NO"));
				file.setFilePath(rset.getString("FILE_PATH"));
				file.setOriginName(rset.getString("ORIGIN_NAME"));
				file.setChangeName(rset.getString("CHANGE_NAME"));
				
				cityList.add(file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cityList;
	}
	
	public int increaseCity(Connection conn, int cityNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cityNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int countCity(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countCity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) count = rset.getInt("COUNT");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return count;
	}
	
	public AttachmentFile selectPhoto(Connection conn, int cityNo) {
		AttachmentFile file = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cityNo);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				file = new AttachmentFile();
				file.setBoardType(rset.getInt("BOARD_TYPE"));
				file.setFileNo(rset.getInt("FILE_NO"));
				file.setOriginName(rset.getString("ORIGIN_NAME"));
				file.setChangeName(rset.getString("CHANGE_NAME"));
				file.setFilePath(rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return file;
	}
	
	public List<CityFile> selectPhotoList(Connection conn){
		List<CityFile> files = new ArrayList<CityFile>();
		CityFile file = null;
		PreparedStatement pstmt = null;  
		ResultSet rset = null;
		String sql = prop.getProperty("selectPhotoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				file = new CityFile();
				file.setNationNo(rset.getInt("NATION_NO"));
				file.setNationName(rset.getString("NATION_NAME"));
				file.setCityNo(rset.getInt("CITY_NO"));
				file.setCityName(rset.getString("CITY_NAME"));
				file.setFileNo(rset.getInt("FILE_NO"));
				file.setFilePath(rset.getString("FILE_PATH"));
				file.setOriginName(rset.getString("ORIGIN_NAME"));
				file.setChangeName(rset.getString("CHANGE_NAME"));
				files.add(file);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return files;
	}
	
	public int updateCity(Connection conn, City city) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, city.getCityName());
			pstmt.setString(2, city.getCityContent());
			pstmt.setInt(3, city.getNationNo());
			pstmt.setString(4, city.getFlyingTime());
			pstmt.setInt(5, city.getCityNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePhoto(Connection conn, int cityNo, AttachmentFile file) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, file.getFilePath());
			pstmt.setString(2, file.getOriginName());
			pstmt.setString(3, file.getChangeName());
			pstmt.setInt(4, cityNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertPhoto(Connection conn, int cityNo, AttachmentFile file) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cityNo);
			pstmt.setString(2, file.getFilePath());
			pstmt.setString(3, file.getOriginName());
			pstmt.setString(4, file.getChangeName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
}

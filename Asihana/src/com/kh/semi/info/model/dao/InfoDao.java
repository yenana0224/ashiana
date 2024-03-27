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
import com.kh.semi.info.model.vo.Currency;
import com.kh.semi.info.model.vo.Language;
import com.kh.semi.info.model.vo.Nation;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.info.model.vo.Voltage;
import com.kh.semi.pageInfo.model.vo.PageInfo;

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
	
	public List<Nation> nationList(Connection conn, PageInfo pi){
		List<Nation> list = new ArrayList<Nation>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("nationList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int start = (pi.getCurrentPage()- 1) * pi.getBoardLimit() + 1;
			int end = start + pi.getBoardLimit() - 1;
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Nation nation = new Nation();
				nation.setNationNo(rset.getInt("NATION_NO"));
				nation.setNationName(rset.getString("NATION_NAME"));
				nation.setNationContent(rset.getString("NATION_CONTENT"));
				list.add(nation);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public List<City> allCityList(Connection conn, PageInfo pi){
		List<City> list = new ArrayList<City>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("allCityList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int start = (pi.getCurrentPage()- 1) * pi.getBoardLimit() + 1;
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
	
	public int countNation(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countNation");
		
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
	
	public Nation searchNation(Connection conn, int nationNo) {
		Nation nation = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchNation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nationNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nation = new Nation();
				nation.setNationNo(rset.getInt("NATION_NO"));
				nation.setNationName(rset.getString("NATION_NAME"));
				nation.setNationContent(rset.getString("NATION_CONTENT"));
				nation.setVisaName(rset.getString("VISA_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return nation;
	}
	
	public ArrayList<City> nationCity(Connection conn, int nationNo){
		ArrayList<City> cityList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("nationCity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nationNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				City city = new City();
				city.setCityNo(rset.getInt("CITY_NO"));
				city.setCityName(rset.getString("CITY_NAME"));
				city.setCityContent(rset.getString("CITY_CONTENT"));
				
				cityList.add(city);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cityList;
	}
	
	public int increaseCity(Connection conn, City c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getNationNo());
			pstmt.setString(2, c.getCityName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
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
	
	public List<Language> searchLang(Connection conn, int nationNo){
		List<Language> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchLang");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nationNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Language lang = new Language();
				lang.setLanguageName(rset.getString("LANGUAGE_NAME"));
				list.add(lang);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	};
	
	public List<Voltage> searchVol(Connection conn, int nationNo){
		List<Voltage> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchVol");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nationNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Voltage vol = new Voltage();
				vol.setVolName(rset.getString("VOL_NAME"));
				list.add(vol);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	};
	
	public List<Currency> searchCur(Connection conn, int nationNo){
		List<Currency> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchCur");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nationNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Currency cur = new Currency();
				cur.setCurrencyName(rset.getString("CURRENCY_NAME"));
				list.add(cur);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int countStory(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countStory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = Integer.parseInt(rset.getString("COUNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	public List<Story> storyList(Connection conn, PageInfo pi){
		List<Story> list = new ArrayList<Story>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("storyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int start = (pi.getCurrentPage()- 1) * pi.getBoardLimit() + 1;
			int end = start + pi.getBoardLimit() - 1;

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Story s = new Story();
				s.setStoryNo(rset.getInt("STORY_NO"));
				s.setStoryTitle(rset.getString("STORY_TITLE"));
				s.setCreateDate(rset.getString("CREATE_DATE"));
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Story detailStory(Connection conn, int storyNo) {
		Story story = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailStory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, storyNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				story = new Story();
				story.setStoryNo(rset.getInt("STORY_NO"));
				story.setStoryTitle(rset.getString("STORY_TITLE"));
				story.setStoryContent(rset.getString("STORY_CN"));
				story.setCreateDate(rset.getString("STORY_DATE"));
				story.setStoryFrom(rset.getString("STORY_FROM"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return story;
	}
	
	public int updateNation(Connection conn, Nation nation) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nation.getNationName());
			pstmt.setString(2, nation.getNationContent());
			pstmt.setInt(3, nation.getNationNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public AttachmentFile selectTitlePhoto(Connection conn, int nationNo) {
		AttachmentFile file = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTitlePhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nationNo);
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
	
	public AttachmentFile selectPhoto(Connection conn, int nationNo) {
		AttachmentFile file = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nationNo);
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
	
	public int insertTitlePhoto(Connection conn, int nationNo, AttachmentFile title) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTitlePhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nationNo);
			pstmt.setString(2, title.getFilePath());
			pstmt.setString(3, title.getOriginName());
			pstmt.setString(4, title.getChangeName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertPhoto(Connection conn, int nationNo, AttachmentFile file) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nationNo);
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
	
	public int updateTitlePhoto(Connection conn, int nationNo, AttachmentFile title) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTitlePhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title.getFilePath());
			pstmt.setString(2, title.getOriginName());
			pstmt.setString(3, title.getChangeName());
			pstmt.setInt(4, nationNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePhoto(Connection conn, int nationNo, AttachmentFile file) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, file.getFilePath());
			pstmt.setString(2, file.getOriginName());
			pstmt.setString(3, file.getChangeName());
			pstmt.setInt(4, nationNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	

}

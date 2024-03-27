package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.info.model.dao.InfoDao;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.Currency;
import com.kh.semi.info.model.vo.Language;
import com.kh.semi.info.model.vo.Nation;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.info.model.vo.Voltage;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class InfoService {
	
	public List<Nation> nationList(PageInfo pi){
		Connection conn = getConnection();
		List<Nation> list = new ArrayList<Nation>();
		list = new InfoDao().nationList(conn, pi);
		close(conn);
		return list;
	}
	
	public List<City> allCityList(PageInfo pi){
		Connection conn = getConnection();
		List<City> list = new ArrayList<City>();
		list = new InfoDao().allCityList(conn, pi);
		close(conn);
		return list;
	}
	 
	
	public int countNation() {
		Connection conn = getConnection();
		int count = new InfoDao().countNation(conn);
		close(conn);
		return count;
	}
	
	public ArrayList<City> cityList(){
		Connection conn = getConnection();
		ArrayList<City> list = new ArrayList<City>();
		list = new InfoDao().cityList(conn);
		close(conn);
		return list;
	}
	
	public Nation searchNation(int nationNo) {
		Connection conn = getConnection();
		Nation nation = new InfoDao().searchNation(conn, nationNo);
		
		close(conn);
		
		return nation;
	}
	
	public ArrayList<City> nationCity(int nationNo){
		Connection conn = getConnection();
		ArrayList<City> list = new InfoDao().nationCity(conn, nationNo);
		close(conn);
		return list;
	}
	
	public int increaseCity(City c) {
		Connection conn = getConnection();
		int result = new InfoDao().increaseCity(conn, c);
		if(result > 0) commit(conn);
		close(conn);
		return result;
	}
	
	public Nation nationInfo(int nationNo) {
		Connection conn = getConnection();
		Nation nation = new InfoDao().searchNation(conn, nationNo);
		
		if(nation != null) {
			List<Language> langList = new InfoDao().searchLang(conn, nationNo);
			nation.setLanguage(langList.toString());
			List<Voltage> volList = new InfoDao().searchVol(conn, nationNo);
			nation.setVoltage(volList.toString());
			List<Currency> curList = new InfoDao().searchCur(conn, nationNo);
			nation.setCurrency(curList.toString());
		}
		
		return nation;
	}
	
	public City searchCity(City c) {
		Connection conn = getConnection();
		
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
		}
		
		close(conn);
		return city;
	}
	
	public int countStory() {
		Connection conn = getConnection();
		int count = new InfoDao().countStory(conn);
		if(count > 0) commit(conn);
		close(conn);
		return count;
	}
	
	public List<Story> storyList(PageInfo pi){
		Connection conn = getConnection();
		List<Story> list = new InfoDao().storyList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public Story detailStory(int storyNo) {
		Connection conn = getConnection();
		Story story = new InfoDao().detailStory(conn, storyNo);
		close(conn);
		return story;
	}
	
	public int countCity() {
		Connection conn = getConnection();
		int count = new InfoDao().countCity(conn);
		close(conn);
		return count;
	}
	
	

}

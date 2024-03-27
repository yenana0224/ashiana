package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.common.AttachmentFile;
import com.kh.semi.info.model.dao.CityDao;
import com.kh.semi.info.model.dao.InfoDao;
import com.kh.semi.info.model.dao.NationDao;
import com.kh.semi.info.model.vo.City;
import com.kh.semi.info.model.vo.Currency;
import com.kh.semi.info.model.vo.Language;
import com.kh.semi.info.model.vo.Voltage;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class CityService {

	public List<City> allCityList(PageInfo pi){
		Connection conn = getConnection();
		List<City> list = new ArrayList<City>();
		list = new CityDao().allCityList(conn, pi);
		close(conn);
		return list;
	}
	
	public City selectCity(int cityNo) {
		Connection conn = getConnection();
		City city = new CityDao().selectCity(conn, cityNo);		
		close(conn);
		return city;
	}
	
	public ArrayList<City> cityList(){
		Connection conn = getConnection();
		ArrayList<City> list = new ArrayList<City>();
		list = new CityDao().cityList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<City> nationCity(int nationNo){
		Connection conn = getConnection();
		ArrayList<City> list = new CityDao().nationCity(conn, nationNo);
		close(conn);
		return list;
	}
	
	public int increaseCity(City c) {
		Connection conn = getConnection();
		int result = new CityDao().increaseCity(conn, c);
		if(result > 0) commit(conn);
		close(conn);
		return result;
	}
	
	public City searchCity(City c) {
		Connection conn = getConnection();
		int nationNo = c.getNationNo();
		// 국가기본정보
		City city = new CityDao().searchCity(conn, c);
		
		if(city != null) {
			// 사용 언어 조회 
			List<Language> langList = new InfoDao().searchLang(conn, nationNo);
			city.setLanguage(langList.toString());
			// 사용 전압 조회
			List<Voltage> volList = new InfoDao().searchVol(conn, nationNo);
			city.setVoltage(volList.toString());
			// 사용 화폐 조회
			List<Currency> curList = new InfoDao().searchCur(conn, nationNo);
			city.setCurrency(curList.toString());
		}
		
		close(conn);
		return city;
	}
	
	public int countCity() {
		Connection conn = getConnection();
		int count = new CityDao().countCity(conn);
		if(count > 0) commit(conn);
		close(conn);
		return count;
	}
	
	public AttachmentFile selectPhoto(int cityNo) {
		Connection conn = getConnection();
		AttachmentFile file = new CityDao().selectPhoto(conn, cityNo);
		close(conn);
		return file;
	}
}

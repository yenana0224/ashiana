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

	// 도시 페이징
	public List<City> allCityList(PageInfo pi){
		Connection conn = getConnection();
		List<City> list = new ArrayList<City>();
		list = new CityDao().allCityList(conn, pi);
		close(conn);
		return list;
	}
	
	// 하나의 도시 정보조회 : 도시번호, 도시이름, 도시소개, 국가번호, 국가이름, 비행시간
	public City selectCity(int cityNo) {
		Connection conn = getConnection();
		City city = new CityDao().selectCity(conn, cityNo);		
		close(conn);
		return city;
	}
	
	// 메인화면노출 : 조회수기준 1-8번째 도시 조회(도시번호, 도시이름, 국가번호, 국가이름, 조회수)
	public ArrayList<City> cityList(){
		Connection conn = getConnection();
		ArrayList<City> list = new ArrayList<City>();
		list = new CityDao().cityList(conn);
		close(conn);
		return list;
	}
	
	// 국가번호에 해당하는 도시 전체 조회 : 도시번호, 도시이름, 도시내용
	public ArrayList<City> nationCity(int nationNo){
		Connection conn = getConnection();
		ArrayList<City> list = new CityDao().nationCity(conn, nationNo);
		close(conn);
		return list;
	}
	
	// 도시 조회수 1 증가
	public int increaseCity(int cityNo) {
		Connection conn = getConnection();
		int result = new CityDao().increaseCity(conn, cityNo);
		if(result > 0) commit(conn);
		close(conn);
		return result;
	}

	// 테이블에 등록된 전체 도시 숫자 
	public int countCity() {
		Connection conn = getConnection();
		int count = new CityDao().countCity(conn);
		if(count > 0) commit(conn);
		close(conn);
		return count;
	}
	
	// 도시 사진 조회
	public AttachmentFile selectPhoto(int cityNo) {
		Connection conn = getConnection();
		AttachmentFile file = new CityDao().selectPhoto(conn, cityNo);
		close(conn);
		return file;
	}
	
	// 도시 정보 수정
	public int updateCity(City city, AttachmentFile file) {
		Connection conn = getConnection();
		int cityNo = city.getCityNo();
		int cityResult = new CityDao().updateCity(conn, city);
		int fileResult = 1;
		
		if(file != null) {
			if(new CityDao().selectPhoto(conn, cityNo) != null) {
				fileResult = new CityDao().updatePhoto(conn, cityNo, file);
			} else {
				fileResult = new CityDao().insertPhoto(conn, cityNo, file);
			}
		}

		int result = cityResult * fileResult;
		if(result > 0) commit(conn);
		close(conn);
		
		return result;
	}
}

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
import com.kh.semi.info.model.vo.Currency;
import com.kh.semi.info.model.vo.Language;
import com.kh.semi.info.model.vo.Nation;
import com.kh.semi.info.model.vo.Voltage;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class NationDao {
	
	private Properties prop = new Properties();
	
	public NationDao() {
		String filePath = NationDao.class.getResource("/sql/info/nation-mapper.xml").getPath();
		
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

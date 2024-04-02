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

import com.kh.semi.info.model.vo.Story;
import com.kh.semi.info.model.vo.StoryFile;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class StoryDao {
	
	private Properties prop = new Properties();
	
	public StoryDao() {
		String filePath = StoryDao.class.getResource("/sql/info/story-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
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
	
	public int countSelectTitle(Connection conn, String keyword) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countSelectTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			if(rset.next()) count = rset.getInt("COUNT");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}	
	
	public int countSelectContent(Connection conn, String keyword) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countSelectContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			if(rset.next()) count = rset.getInt("COUNT");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	public List<StoryFile> storyList(Connection conn, PageInfo pi){
		List<StoryFile> list = new ArrayList<StoryFile>();
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
				StoryFile s = new StoryFile();
				s.setStoryNo(rset.getInt("STORY_NO"));
				s.setStoryTitle(rset.getString("STORY_TITLE"));
				s.setCreateDate(rset.getString("STORY_DATE"));
				s.setFilePath(rset.getString("FILE_PATH"));
				s.setChangeName(rset.getString("CHANGE_NAME"));
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
	
	public List<StoryFile> searchTitle(Connection conn, PageInfo pi, String keyword){
		List<StoryFile> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searhTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int end = start + pi.getBoardLimit() - 1;
			pstmt.setString(1, keyword);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				StoryFile file = new StoryFile();
				file.setStoryNo(rset.getInt("STORY_NO"));
				file.setStoryTitle(rset.getString("STORY_TITLE"));
				file.setCreateDate(rset.getString("STORY_DATE"));
				file.setFilePath(rset.getString("FILE_PATH"));
				file.setChangeName(rset.getString("CHANGE_NAME"));
				list.add(file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
	}
	
	public List<StoryFile> searchContent(Connection conn, PageInfo pi, String keyword){
		List<StoryFile> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int end = start + pi.getBoardLimit() - 1;
			pstmt.setString(1, keyword);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				StoryFile file = new StoryFile();
				file.setStoryNo(rset.getInt("STORY_NO"));
				file.setStoryTitle(rset.getString("STORY_TITLE"));
				file.setCreateDate(rset.getString("STORY_DATE"));
				file.setFilePath(rset.getString("FILE_PATH"));
				file.setChangeName(rset.getString("CHANGE_NAME"));
				list.add(file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
	}
	
	public StoryFile detailStory(Connection conn, int storyNo) {
		StoryFile story = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailStory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, storyNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				story = new StoryFile();
				story.setStoryNo(rset.getInt("STORY_NO"));
				story.setStoryTitle(rset.getString("STORY_TITLE"));
				story.setStoryContent(rset.getString("STORY_CN"));
				story.setCreateDate(rset.getString("STORY_DATE"));
				story.setStoryFrom(rset.getString("STORY_FROM"));
				story.setFilePath(rset.getString("FILE_PATH"));
				story.setChangeName(rset.getString("CHANGE_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return story;
	}
	
	public int insertStory(Connection conn, Story story) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, story.getStoryTitle());
			pstmt.setString(2, story.getStoryContent());
			pstmt.setString(3, story.getStoryFrom());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertFile(Connection conn, StoryFile file) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, file.getFilePath());
			pstmt.setString(2, file.getOriginName());
			pstmt.setString(3, file.getChangeName());
			pstmt.setInt(4, file.getBoardNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateStory(Connection conn, Story story) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateStory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, story.getStoryTitle());
			pstmt.setString(2, story.getStoryContent());
			pstmt.setString(3, story.getStoryFrom());
			pstmt.setInt(4, story.getStoryNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
	public int updateStoryFile(Connection conn, StoryFile file) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateStoryFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, file.getFilePath());
			pstmt.setString(2, file.getOriginName());
			pstmt.setString(3, file.getChangeName());
			pstmt.setInt(4, file.getBoardNo());
			pstmt.setInt(5, file.getStoryNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

}

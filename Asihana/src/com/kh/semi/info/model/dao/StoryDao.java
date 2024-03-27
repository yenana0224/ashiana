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
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class StoryDao {
	
	private Properties prop = new Properties();
	
	public StoryDao() {
		String filePath = InfoDao.class.getResource("/sql/info/info-mapper.xml").getPath();
		
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

}

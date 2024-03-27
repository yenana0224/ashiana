package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.info.model.dao.StoryDao;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class StoryService {
	
	public int countStory() {
		Connection conn = getConnection();
		int count = new StoryDao().countStory(conn);
		if(count > 0) commit(conn);
		close(conn);
		return count;
	}
	
	public List<Story> storyList(PageInfo pi){
		Connection conn = getConnection();
		List<Story> list = new StoryDao().storyList(conn, pi);
		close(conn);
		return list;
	}
	
	public Story detailStory(int storyNo) {
		Connection conn = getConnection();
		Story story = new StoryDao().detailStory(conn, storyNo);
		close(conn);
		return story;
	}

}

package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.info.model.dao.StoryDao;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.info.model.vo.StoryFile;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class StoryService {

	public int countStory() {
		Connection conn = getConnection();
		int count = new StoryDao().countStory(conn);
		close(conn);
		return count;
	}
	
	public List<Story> storyList(PageInfo pi){
		Connection conn = getConnection();
		List<Story> list = new StoryDao().storyList(conn, pi);
		close(conn);
		return list;
	}
	
	/***
	 * 스토리 상세조회
	 * @param storyNo
	 * @return
	 */
	public Story detailStory(int storyNo) {
		Connection conn = getConnection();
		Story story = new StoryDao().detailStory(conn, storyNo);
		close(conn);
		return story;
	}
	
	/***
	 * 스토리작성
	 * @param story
	 * @param file
	 * @return
	 */
	public int insertStory(Story story, StoryFile file) {
		Connection conn = getConnection();
		int fileResult = 1;
		
		int StoryResult = new StoryDao().insertStory(conn, story);
		
		if(file != null) {
			fileResult = new StoryDao().insertFile(conn, file);
		}

		int result = fileResult * StoryResult;
		
		if(result > 0) commit(conn);
		close(conn);
		
		return result;
	}

}

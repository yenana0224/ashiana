package com.kh.semi.info.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.info.model.dao.StoryDao;
import com.kh.semi.info.model.vo.Story;
import com.kh.semi.info.model.vo.StoryFile;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class StoryService {
	
	// 전체 글 수
	public int countStory() {
		Connection conn = getConnection();
		int count = new StoryDao().countStory(conn);
		close(conn);
		return count;
	}
	
	// 제목검색. 해당하는 글의 갯수
	public int countSelectTitle(String keyword) {
		Connection conn = getConnection();
		int count = new StoryDao().countSelectTitle(conn, keyword);
		close(conn);
		return count;
	}
	
	// 내용검색. 해당하는 글의 갯수
	public int countSelectContent(String keyword) {
		Connection conn = getConnection();
		int count = new StoryDao().countSelectContent(conn, keyword);
		close(conn);
		return count;
	}
	
	public List<StoryFile> storyList(PageInfo pi){
		Connection conn = getConnection();
		List<StoryFile> list = new StoryDao().storyList(conn, pi);
		close(conn);
		return list;
	}
	
	/***
	 * 제목으로 검색하는 스토리 목록 
	 */
	public List<StoryFile> searchTitle(PageInfo pi, String keyword){
		Connection conn = getConnection();
		List<StoryFile> list = new StoryDao().searchTitle(conn, pi, keyword);
		close(conn);
		return list;
	}
	
	/***
	 * 내용으로 검색하는 스토리 목록
	 */
	public List<StoryFile> searchContent(PageInfo pi, String keyword){
		Connection conn = getConnection();
		List<StoryFile> list = new StoryDao().searchContent(conn, pi, keyword);
		close(conn);
		return list;
	}

	
	/***
	 * 스토리 상세조회
	 * @param storyNo
	 * @return
	 */
	public StoryFile detailStory(int storyNo) {
		Connection conn = getConnection();
		StoryFile story = new StoryDao().detailStory(conn, storyNo);
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
		else rollback(conn);
		
		close(conn);
		
		return result;
	};
	
	public int updateStory(Story story, StoryFile file) {
		Connection conn = getConnection();
		int fileResult = 1;
		int storyResult = new StoryDao().updateStory(conn, story);
		if(file != null) {
			fileResult = new StoryDao().updateStoryFile(conn, file);
		}
		int result = storyResult * fileResult;
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

}

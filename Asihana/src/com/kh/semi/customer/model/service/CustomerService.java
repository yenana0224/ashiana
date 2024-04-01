package com.kh.semi.customer.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.customer.model.dao.CustomerDao;
import com.kh.semi.customer.model.vo.Answer;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.customer.model.vo.NoticeFile;
import com.kh.semi.customer.model.vo.QNA;
import com.kh.semi.pageInfo.model.vo.PageInfo;

public class CustomerService {
	
	public Notice[] notice() {
		
		Connection conn = getConnection();
		
		Notice[] notice = new Notice[3]; 
		notice = new CustomerDao().notice(conn);
		close(conn);
		
		return notice;
	}
	
	public int selectCount(String select, String searchContent) {
		
		Connection conn = getConnection();
		
		int result = 0;
		
		
		if(searchContent != null) {
			if(select.equals("title")) {
				result = new CustomerDao().selectTitleCount(conn, searchContent);
			} else {
				result = new CustomerDao().selectContentCount(conn, searchContent);
			}
		}else {
			result = new CustomerDao().selectCount(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	public List<Notice> noticeList(PageInfo pi){
		
		Connection conn = getConnection();
		
		
		List<Notice> list = new CustomerDao().noticeList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public List<Notice> noticeSearch(String search, String searchContent, PageInfo pi){
		
		Connection conn = getConnection();
		
		List<Notice> list = new ArrayList();
		
		if(search.equals("title")) {
			list = new CustomerDao().noticeTitleSearch(conn, searchContent, pi);
		} else {
			list = new CustomerDao().noticeContentSearch(conn, searchContent, pi);
		}
		
		close(conn);
		
		return list;
	}
	
	public int noticeInsert(Notice notice, NoticeFile noticeFile) {
		Connection conn = getConnection();
		int noticeResult = 0;
		int fileResult = 1;
		
		noticeResult = new CustomerDao().noticeInsert(conn, notice);

		if(noticeFile != null) {
			fileResult = new CustomerDao().attInsert(conn, noticeFile);
		} 
		
		int result = noticeResult * fileResult;
		
		if(result > 0) commit(conn);
		
		close(conn);
		
		return result;
	}
	
	public Notice noticeDetail(int noticeNo) {
		Connection conn = getConnection();
		
		Notice notice = new CustomerDao().noticeDetail(conn, noticeNo);
		close(conn);
		return notice;
	}
	
	public int insertQa(QNA qna, NoticeFile file) {
		
		Connection conn = getConnection();

		int qnaResult = new CustomerDao().insertQa(conn, qna);
		
		int fileResult = 1;
		if(file != null) {
			fileResult = new CustomerDao().qnaInsertFile(conn, file);
		}
		if((qnaResult * fileResult) > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return (qnaResult * fileResult);
	}
	
	public int selectQnaCount(String select, String searchContent) {
		
		Connection conn = getConnection();
		
		int result = 0;
		
		
		if(searchContent != null) {
			if(select.equals("title")) {
				result = new CustomerDao().qnaTitleCount(conn, searchContent);
			} else {
				result = new CustomerDao().qnaContentCount(conn, searchContent);
			}
		}else {
			result = new CustomerDao().selectQnaCount(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	public List<QNA> qnaSearch(String search, String searchContent, PageInfo pi){
		
		Connection conn = getConnection();
		
		List<QNA> list = new ArrayList();
		
		if(search.equals("title")) {
			list = new CustomerDao().qnaTitleSearch(conn, searchContent, pi);
		} else {
			list = new CustomerDao().qnaContentSearch(conn, searchContent, pi);
		}
		
		close(conn);
		
		return list;
		
	}
	
	public List<QNA> qnaList(PageInfo pi){
		
		Connection conn = getConnection();
		
		
		List<QNA> list = new CustomerDao().qnaList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public NoticeFile selectFile(int noticeNo, int boardType) {
		Connection conn = getConnection();
		
		NoticeFile file = new CustomerDao().selectFile(conn, noticeNo, boardType);
		close(conn);
		return file;
	}
	
	public List<Answer> selectAnswer(int qnaNo){
		
		Connection conn = getConnection();
		
		List<Answer> list = new CustomerDao().selectAnswer(conn, qnaNo);
		
		close(conn);
		
		return list;
	}
	
	public QNA selectQna(int qnaNo) {
		
		Connection conn = getConnection();
		
		QNA qna = new CustomerDao().selectQna(conn, qnaNo);
		
		close(conn);
		
		return qna;
	}
	
	public int qnaDelete(int qnaNo, int qnaFileNo) {
		
		Connection conn = getConnection();
		int fileResult = 1;
		int replyResult = 1;
		
		List<Answer> reply = new CustomerDao().selectAnswer(conn, qnaNo);
		if(!reply.isEmpty()) {
			replyResult = new CustomerDao().qnaReplyDelete(conn, qnaNo);
		}
		
		if(qnaFileNo > 0) {
			fileResult = new CustomerDao().fileDelete(conn, qnaNo);
		}
		
		int qnaResult = new CustomerDao().qnaDelete(conn, qnaNo);
		
		if((qnaResult * fileResult * replyResult) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return (qnaResult * fileResult * replyResult);
	}
	
	public int replyInsert(Answer answer, String qnaStatus) {
		
		Connection conn = getConnection();
		int userNo = answer.getReplyWriter();
		int result = 0;
		if(qnaStatus.equals("Y") && userNo == 1) {
			result = new CustomerDao().replyInsert(conn, answer);
			if(result > 0) {
				new CustomerDao().completed(conn, answer);
			}
		} else {
			result = new CustomerDao().replyInsert(conn, answer);
		}
		
		if(result > 0) commit(conn);

		return result;
	}
	
	public int replyUpdate(Answer answer) {
		
		Connection conn = getConnection();
		
		int result = new CustomerDao().replyUpdate(conn, answer);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int replyDelete(int replyNo) {
		
		Connection conn = getConnection();
		
		int result = new CustomerDao().replyDelete(conn, replyNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int updateQna(QNA qna, NoticeFile newfile, NoticeFile originFile) {
		
		Connection conn = getConnection();
		int fileResult = 1;
		int originFileResult = 1;
		if(newfile != null) {
			if(originFile != null) {
				originFileResult = new CustomerDao().fileDelete(conn, qna.getQnaNo());
			}
			fileResult = new CustomerDao().updateInsertFile(conn, newfile);
		}
		int qnaResult = new CustomerDao().updateQna(conn, qna);
		if((fileResult * qnaResult * originFileResult) > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return (fileResult * qnaResult * originFileResult);
	}
	
	
}

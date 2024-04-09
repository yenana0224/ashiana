package com.kh.semi.customer.model.dao;

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

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.customer.model.vo.Answer;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.customer.model.vo.NoticeFile;
import com.kh.semi.customer.model.vo.QNA;
import com.kh.semi.pageInfo.model.vo.PageInfo;


public class CustomerDao {

	private Properties prop = new Properties();
	
	public CustomerDao() {
		String filePath = CustomerDao.class.getResource("/sql/customer/customer-mapper.xml").getPath();
			
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Notice[] notice(Connection conn) {
		
		Notice[] notice = new Notice[3];
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("notice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			for(int i = 0; i < notice.length; i++) {
				if(rset.next()) {
					Notice n = new Notice();
					n.setNoticeNo(rset.getInt("NOTICE_NO"));
					n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
					notice[i] = n;
				} 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return notice;
	}
	public int selectTitleCount(Connection conn, String searchContent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTitleCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchContent);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public int selectContentCount(Connection conn, String searchContent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectContentCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchContent);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int selectCount(Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	public int selectHoldCount() {
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("selectHoldCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			close(conn);
		}
		
		return result;
	}
	
	
	public List<Notice> noticeList(Connection conn, PageInfo pi){
		
		List<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = 0;
			int holdCount = selectHoldCount();
			if(startRow == 1) {
				endRow = (startRow + pi.getBoardLimit() - 1) - holdCount;
			}else {
				startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1) - holdCount;
				endRow = (startRow + pi.getBoardLimit()) - 1 + holdCount;
			}
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Notice notice = new Notice();
				
				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setCreateDate(rset.getDate("CREATE_DATE"));
				notice.setNoticeHold(rset.getString("NOTICE_HOLD"));
				
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public List<Notice> noticeTitleSearch(Connection conn, String searchContent, PageInfo pi){
		
		List<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeTitleSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, searchContent);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Notice notice = new Notice();
				
				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setCreateDate(rset.getDate("CREATE_DATE"));
				notice.setNoticeHold(rset.getString("NOTICE_HOLD"));
				
				list.add(notice);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public List<Notice> noticeContentSearch(Connection conn, String searchContent, PageInfo pi){
		
		List<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeContentSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, searchContent);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Notice notice = new Notice();
				
				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setCreateDate(rset.getDate("CREATE_DATE"));
				notice.setNoticeHold(rset.getString("NOTICE_HOLD"));
				
				list.add(notice);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int noticeInsert(Connection conn, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("noticeInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setInt(3, Integer.parseInt(notice.getNoticeWriter()));
			pstmt.setString(4, notice.getNoticeHold());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int attInsert(Connection conn, NoticeFile noticeFile) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("attInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeFile.getFilePath());
			pstmt.setString(2, noticeFile.getOriginName());
			pstmt.setString(3, noticeFile.getChangeName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Notice noticeDetail(Connection conn, int noticeNo) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("noticeDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Notice();
				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				notice.setNoticeHold(rset.getString("NOTICE_HOLD"));
				notice.setCdate(rset.getString("CREATE_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return notice;
	}
	
	public int insertQa(Connection conn, QNA qna) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQa");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna.getQnaTitle());
			pstmt.setString(2, qna.getQnaContent());
			pstmt.setInt(3, Integer.parseInt(qna.getQnaWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int qnaInsertFile(Connection conn, NoticeFile file) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("qnaInsertFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, file.getFilePath());
			pstmt.setString(2, file.getOriginName());
			pstmt.setString(3, file.getChangeName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int qnaTitleCount(Connection conn, String searchContent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("qnaTitleCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchContent);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int qnaContentCount(Connection conn, String searchContent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("qnaContentCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchContent);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int selectQnaCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnaCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	
	public List<QNA> qnaTitleSearch(Connection conn,String searchContent, PageInfo pi){
		
		List<QNA> list = new ArrayList<QNA>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("qnaTitleSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, searchContent);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				QNA qna = new QNA();
				
				qna.setQnaNo(rset.getInt("Q_NO"));
				qna.setQnaStatus(rset.getString("QA_STATUS"));
				qna.setQnaTitle(rset.getString("QA_TITLE"));
				qna.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(qna);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public List<QNA> qnaContentSearch(Connection conn,String searchContent, PageInfo pi){
		
		List<QNA> list = new ArrayList<QNA>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("qnaContentSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, searchContent);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				QNA qna = new QNA();
				
				qna.setQnaNo(rset.getInt("Q_NO"));
				qna.setQnaStatus(rset.getString("QA_STATUS"));
				qna.setQnaTitle(rset.getString("QA_TITLE"));
				qna.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(qna);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public List<QNA> qnaList(Connection conn, PageInfo pi){
		
		List<QNA> list = new ArrayList<QNA>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("qnaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				QNA qna = new QNA();
				
				qna.setQnaNo(rset.getInt("Q_NO"));
				qna.setQnaTitle(rset.getString("QA_TITLE"));
				qna.setQnaContent(rset.getString("QA_CONTENT"));
				qna.setCreateDate(rset.getDate("CREATE_DATE"));
				qna.setQnaStatus(rset.getString("QA_STATUS"));
				qna.setStatus(rset.getString("STATUS"));
				qna.setQnaWriter(rset.getString("NICKNAME"));
				
				list.add(qna);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public NoticeFile selectFile(Connection conn, int noticeNo, int boardType) {
		NoticeFile file = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			pstmt.setInt(2, boardType);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				file = new NoticeFile();
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
	
	public int attUpdate(Connection conn, NoticeFile noticeFile) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("attUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeFile.getFilePath());
			pstmt.setString(2, noticeFile.getOriginName());
			pstmt.setString(3, noticeFile.getChangeName());
			pstmt.setInt(4, noticeFile.getBoardNo());
			pstmt.setInt(5, noticeFile.getBoardType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int newAttInsert(Connection conn, NoticeFile noticeFile) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("newAttInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeFile.getBoardNo());
			pstmt.setString(2, noticeFile.getFilePath());
			pstmt.setString(3, noticeFile.getOriginName());
			pstmt.setString(4, noticeFile.getChangeName());
			pstmt.setInt(5, noticeFile.getBoardType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<Answer> selectAnswer(Connection conn, int qnaNo){
		
		List<Answer> list = new ArrayList<Answer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Answer(rset.getInt("REPLY_NO"),
						 			rset.getInt("QNA_NO"),
						 			rset.getString("REPLY_COMMENT"),
						 			rset.getString("NICKNAME"),
						 			rset.getInt("REPLY_WRITER"),
						 			rset.getDate("COMMENT_DATE"),
						 			rset.getString("STATUS")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public QNA selectQna(Connection conn, int qnaNo) {
		
		QNA qna = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				qna = new QNA(rset.getInt("Q_NO"),
						      rset.getString("QA_TITLE"),
						      rset.getString("QA_CONTENT"),
						      rset.getDate("CREATE_DATE"),
						      rset.getString("QA_STATUS"),
						      rset.getString("STATUS"),
						      rset.getString("QA_WRITER"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qna;
	}
	
	public int qnaDelete(Connection conn, int qnaNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("qnaDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int fileDelete(Connection conn, int qnaNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("fileDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int qnaReplyDelete(Connection conn, int qnaNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("qnaReplyDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int replyInsert(Connection conn, Answer answer) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("replyInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, answer.getQnaNo());
			pstmt.setString(2, answer.getReplyComment());
			pstmt.setInt(3, answer.getReplyWriter());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int completed(Connection conn, Answer answer) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("completed");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, answer.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int replyUpdate(Connection conn, Answer answer) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("replyUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, answer.getReplyComment());
			pstmt.setInt(2, answer.getReplyNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
	
	public int replyDelete(Connection conn, int replyNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("replyDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateQna(Connection conn, QNA qna) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qna.getQnaTitle());
			pstmt.setString(2, qna.getQnaContent());
			pstmt.setInt(3, qna.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateInsertFile(Connection conn, NoticeFile file) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateInsertFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, file.getBoardNo());
			pstmt.setString(2, file.getFilePath());
			pstmt.setString(3, file.getOriginName());
			pstmt.setString(4, file.getChangeName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}

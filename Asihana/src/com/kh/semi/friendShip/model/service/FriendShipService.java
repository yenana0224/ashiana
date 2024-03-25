package com.kh.semi.friendShip.model.service;

import java.sql.Connection;
import java.util.ArrayList;


import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.friendShip.model.dao.FriendShipDao;
import com.kh.semi.friendShip.model.vo.FriendShip;
import com.kh.semi.pageInfo.model.vo.PageInfo;




public class FriendShipService {

	/***
	 * 페이징
	 * @param pi
	 * @return
	 */
	public ArrayList<FriendShip> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<FriendShip> list = new FriendShipDao().selectList(conn, pi);

		close(conn);
		return list;

	}
	
	/***
	 * 페이징관련 리스트카운트
	 * @return
	 */
	public int selectListCount() {

		Connection conn = getConnection();

		int result = new FriendShipDao().selectListCount(conn);

		close(conn);

		return result;

	}

	
}

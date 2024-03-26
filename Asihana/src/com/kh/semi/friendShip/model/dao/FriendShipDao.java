package com.kh.semi.friendShip.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.friendShip.model.vo.FriendShip;

public class FriendShipDao {
	
	private Properties prop = new Properties();
	
	public FriendShipDao() {
		String sqlFile = FriendShipDao.class.getResource("/sql/friendShip/friendShip-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(sqlFile));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}

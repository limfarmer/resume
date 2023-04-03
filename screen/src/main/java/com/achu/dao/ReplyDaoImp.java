package com.achu.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.jdbc.OracleTypes;

@Service
public class ReplyDaoImp implements ReplyDao{
	
	@Autowired
	private DataSource ds;
	
	@Override
	public Map<String,Integer> manageMainStatistics() {
		//이 메소드의 위치(클래스)가 여기가 맞는지 모르겠어요...
		CallableStatement cstmt =null;
		Connection conn= null;
		Map<String,Integer> statistics = new HashMap<String,Integer>();
		try {
			conn = ds.getConnection();
			String sql = "call p_reply_count(?,?)";
			//회원수 증감 조회.
			//전주 대비 증가율 구하기 위한 데이터 : 최근 일주일 가입 수
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.NUMBER);
			cstmt.registerOutParameter(2, OracleTypes.NUMBER);
			cstmt.executeQuery();
			
			statistics.put("totalReply", cstmt.getInt(1));
			statistics.put("newReply", cstmt.getInt(2));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			resourceClose(conn,cstmt);
		}
		return statistics;
		
	}
	
	private void resourceClose(Connection conn,CallableStatement csmt) {
		try {
			conn.close();
			csmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}

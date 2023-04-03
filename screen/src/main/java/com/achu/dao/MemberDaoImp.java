package com.achu.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.achu.dto.Criteria;
import com.achu.dto.Member;

import oracle.jdbc.OracleTypes;
@Repository
public class MemberDaoImp implements MemberDao{
	
	@Autowired
	private DataSource ds;

	@Override 
	public Map<String, String> login(String id, String pw) {
		Map<String, String> status =new HashMap<String, String>();
		String sql = "call p_get_member(?,?)";
		Connection conn= null;
		CallableStatement stmt =null;
		try {
			conn = ds.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.setString(1, id);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs = (ResultSet) stmt.getObject(2);
			if (rs.next()) {
				if (rs.getString("pw").equals(pw)) {
					status.put("loginStatus","ok");
					status.put("name",rs.getString("name"));
					if(rs.getString("auth").equals("A")||rs.getString("auth").equals("M")) {
						status.put("auth","manager");
					}
				} else {
					status.put("loginStatus","pwFail");
				}
			} else {
				status.put("loginStatus","fail");
			}
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resourceClose(conn,stmt);
		}
		return status;
	}
	@Override
	public Map<String,Integer> manageMainStatistics() {
		//이 메소드의 위치(클래스)가 여기가 맞는지 모르겠어요...
		CallableStatement cstmt =null;
		Connection conn= null;
		Map<String,Integer> statistics = new HashMap<String,Integer>();
		try {
			conn = ds.getConnection();
			String sql = "call p_member_count(?,?)";
			//회원수 증감 조회.
			//전주 대비 증가율 구하기 위한 데이터 : 최근 일주일 가입 수
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.NUMBER);
			cstmt.registerOutParameter(2, OracleTypes.NUMBER);
			cstmt.executeQuery();
			
			statistics.put("totalMember", cstmt.getInt(1));
			statistics.put("newMember", cstmt.getInt(2));
			
			cstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			resourceClose(conn,cstmt);
		}
		return statistics;
		
	}
	@Override
	public List<Member> list(Criteria mCri){
		List<Member> members=new ArrayList<Member>();
		CallableStatement cstmt =null;
		Connection conn= null;
		try {
			String sql = "call p_get_member(?,?,?,?)";
			conn = ds.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, mCri.getKind());
			cstmt.setString(2, mCri.getSearchField());
			cstmt.setString(3, mCri.getKeyword());
			cstmt.registerOutParameter(4, OracleTypes.CURSOR);
			cstmt.executeQuery();
			
			ResultSet rs = (ResultSet)cstmt.getObject(4);
			
			Member member = null;
			while(rs.next()) {
				member = new Member();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setAuth(rs.getString("auth"));
				member.setWdate(rs.getString("wdate"));
				member.setBirth(rs.getString("birth"));
				members.add(member);
			}
			
			cstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resourceClose(conn,cstmt);
		}
		
		return members;
	}
	
	//
	private void resourceClose(Connection conn, PreparedStatement stmt) {
		try {
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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


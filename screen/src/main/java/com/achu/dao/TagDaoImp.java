package com.achu.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.achu.common.OracleConn;

import com.achu.dto.Tag;

import oracle.jdbc.OracleTypes;

@Repository
public class TagDaoImp implements TagDao{
	@Autowired	
	DataSource ds;
	
	@Override
	public List<Tag> tagList(){
		List<Tag> searchTag = new ArrayList<Tag>();
		Connection conn = null;
		CallableStatement stmt = null;
		String sql ="call p_get_tag_list(?)";
	
		try {
			conn = ds.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs = (ResultSet)stmt.getObject(1);
	
		
			while(rs.next()) {
				Tag sd = new Tag();
				sd.setTop(rs.getString("top"));
				sd.setMid(rs.getString("mid"));
				sd.setName(rs.getString("name"));
				sd.setMidSeq(rs.getString("mid_seq"));
				sd.setTopSeq(rs.getString("top_seq"));
				sd.setSeqno(rs.getString("seqno"));
				searchTag.add(sd);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	         resourceClose(conn,stmt);
	      }
		return searchTag;
	
	}
	@Override
	public int insert(String tagName) {
		int rs=0;
		Connection conn = null;
		CallableStatement stmt = null;
		String sql ="call p_insert_tag(?,?)";
		try {
			conn=ds.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.setString(1, tagName);
			stmt.registerOutParameter(2, OracleTypes.INTEGER);
			stmt.executeQuery();
			rs=(int) stmt.getInt(2);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	         resourceClose(conn,stmt);
	      }
	
		return rs;
	}
	@Override
	public int modify(String seqno, String newName) {
		int rs=0;
		Connection conn = null;
		CallableStatement stmt = null;
		String sql ="call p_modify_tag(?,?,?)";
		try {
			conn =ds.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.setString(1, seqno);
			stmt.setString(2, newName);
			stmt.registerOutParameter(3, OracleTypes.INTEGER);
			stmt.executeUpdate();
			rs=stmt.getInt(3);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	         resourceClose(conn,stmt);
	      }
		return rs;
	}
	@Override
	public void delete(String seqno) {
		String sql ="call p_delete_tag(?)";
		Connection conn = null;
		CallableStatement stmt = null;
		try {
			conn =ds.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.setString(1, seqno);
			stmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	         resourceClose(conn,stmt);
	      }
	}
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
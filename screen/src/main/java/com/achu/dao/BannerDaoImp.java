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

import com.achu.dto.BannerImage;
import com.achu.dto.File;

import oracle.jdbc.OracleTypes;
@Repository
public class BannerDaoImp implements BannerDao {
	
	@Autowired
	private DataSource ds;
	
	public List<File> banner() {
		Connection conn = null;
		CallableStatement stmt = null;
		List<File> bannerImage = new ArrayList<File>();
		String sql = "call p_get_banner(?)";
		try {
			conn = ds.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs = (ResultSet)stmt.getObject(1);

			while(rs.next()) {
				BannerImage bi = new BannerImage();
				bi.setRoute(rs.getString("route"));
				bi.setSaveName(rs.getString("save_name"));
				bi.setFileType(rs.getString("file_type"));
				bi.setLinkAddress(rs.getString("link_address"));
				bi.setSlideArrNum(rs.getString("slide_arr_num"));
				bannerImage.add(bi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resourceClose(conn,stmt);
		}
		return bannerImage;
	}
	

	private void resourceClose(Connection conn,CallableStatement csmt) {
		try {
			if(csmt != null || conn != null) {
				csmt.close();
				conn.close();
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
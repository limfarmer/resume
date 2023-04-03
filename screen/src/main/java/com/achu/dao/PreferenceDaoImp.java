package com.achu.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.achu.dto.Artwork;
import com.achu.dto.Average;
import com.achu.dto.Tag;

import oracle.jdbc.OracleTypes;

@Repository
public class PreferenceDaoImp implements PreferenceDao{
   
	@Autowired
    private DataSource ds;
   //취향분석-나의 평가 현황
   public Average MyRatingInfo(String userId) {
      Connection conn= null;
      CallableStatement stmt = null;
      Average average = new Average();
      String sql ="call p_get_my_rating_info(?,?,?)";
      try {
         conn = ds.getConnection();
         stmt = conn.prepareCall(sql);
         stmt.setString(1, userId);
         stmt.registerOutParameter(2, OracleTypes.CURSOR);
         stmt.registerOutParameter(3, OracleTypes.CURSOR);
         stmt.executeQuery();
         ResultSet rs =(ResultSet)stmt.getObject(2);
         while(rs.next()) {
            average.setArtRatingAvg(rs.getString("ArtRatingAvg"));
            average.setArtCount(rs.getString("artCount"));
         }
         
         rs = (ResultSet) stmt.getObject(3);
         while(rs.next()) {
            average.setReplyCount(rs.getString("rcnt"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         resourceClose(conn,stmt);
      }
      return average;
   }
   // 취향분석-나의선호태그
   public List<Tag> MyRatingFavoriteTag(String id) {
      Connection conn= null;
      CallableStatement stmt = null;
      List<Tag> tagDto = new ArrayList<Tag>();
      
      String sql="call p_get_my_rating_favorite(?,?)";
      try {
         conn = ds.getConnection();
         stmt = conn.prepareCall(sql);
         stmt.setString(1, id);
         stmt.registerOutParameter(2, OracleTypes.CURSOR);
         stmt.executeQuery();
         ResultSet rs =(ResultSet)stmt.getObject(2);
         while(rs.next()) {
            Tag tag = new Tag();
            tag.setName(rs.getString("name"));
            tag.setArtRatingAvg(rs.getString("avg_rating"));
            tagDto.add(tag);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         resourceClose(conn,stmt);
      }
      
      return tagDto;
   }
   // 취향분석-가장많이본 장르,이름
   public List<Tag> MyRatingMostGenre(String userId) {
      List<Tag> genre = new ArrayList<Tag>();
      Connection conn= null;
      CallableStatement stmt = null;
      String sql="call p_get_my_rating_most_genre(?,?)";

      try {
         conn =ds.getConnection();
         stmt = conn.prepareCall(sql);
         stmt.setString(1,userId);
         stmt.registerOutParameter(2, OracleTypes.CURSOR);
         stmt.executeQuery();
         ResultSet rs =(ResultSet)stmt.getObject(2);
         while(rs.next()) {
            Tag tag = new Tag();
            tag.setName(rs.getString("name"));
            tag.setArtRatingAvg(rs.getString("cnt"));
            genre.add(tag);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         resourceClose(conn,stmt);
      }

      return genre;
   }
   // 수정해야됨
   public List<Tag> MyRatingCountGenre(String userId) {
      List<Tag> genre = new ArrayList<Tag>();
      Connection conn= null;
      CallableStatement stmt = null;
      String sql="call get_myart_rating_cnt(?,?)";
      
      try {
         conn = ds.getConnection();
         stmt = conn.prepareCall(sql);
         stmt.setString(1, userId );
         stmt.registerOutParameter(2, OracleTypes.CURSOR);
         stmt.executeQuery();
         ResultSet rs =(ResultSet) stmt.getObject(2);
         while(rs.next()) {
            Tag tag = new Tag();
            tag.setName(rs.getString("cnt_name"));
            tag.setArtCount(rs.getString("cnt"));
            genre.add(tag);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         resourceClose(conn,stmt);
      }
      return genre;
   }
   public List<Tag> MyRatingFavoriteGenre(String userId) {
      List<Tag> genre = new ArrayList<Tag>();
      Connection conn= null;
      CallableStatement stmt = null;
      String sql="call get_myart_rating_favorite(?,?)";
      
      try {
      conn = ds.getConnection();
      stmt = conn.prepareCall(sql);
      stmt.setString(1, userId );
      stmt.registerOutParameter(2, OracleTypes.CURSOR);
      stmt.executeQuery();
      ResultSet rs =(ResultSet) stmt.getObject(2);
      while(rs.next()) {
         Tag tag = new Tag();
         tag.setName(rs.getString("avg_name"));
         tag.setArtRatingAvg(rs.getString("avg"));
         genre.add(tag);
      }
   } catch (SQLException e) {
      e.printStackTrace();
   }finally {
      resourceClose(conn,stmt);
   }
   return genre;
   }
   public List<Artwork> MyRatingPlatform(String userId) {
      List<Artwork> platform = new ArrayList<Artwork>();
      Connection conn= null;
      CallableStatement stmt = null;
      String sql ="call get_myplatform_rating(?,?)";
      
      try {
         conn = ds.getConnection();
         stmt = conn.prepareCall(sql);
         stmt.setString(1, userId);
         stmt.registerOutParameter(2, OracleTypes.CURSOR);
         stmt.executeQuery();
         ResultSet rs = (ResultSet) stmt.getObject(2);
         
         while(rs.next()) {
            Artwork artwork= new Artwork();
            artwork.setPlatform(rs.getString("platform"));
            artwork.setCnt(rs.getInt("cnt"));
            platform.add(artwork);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         resourceClose(conn,stmt);
      }
      return platform;
   }
   public List<Artwork> Chart(String userId){
      List<Artwork> chart = new ArrayList<Artwork>();
      Connection conn= null;
      CallableStatement stmt = null;
      String sql="call get_chart_cnt(?,?)";
      
      try {
         conn = ds.getConnection();
         stmt = conn.prepareCall(sql);
         stmt.setString(1, userId);
         stmt.registerOutParameter(2, OracleTypes.CURSOR);
         stmt.executeQuery();
         ResultSet rs = (ResultSet) stmt.getObject(2);
         
         while(rs.next()) {
            Artwork a = new Artwork();
            a.setCnt(rs.getInt("cnt"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         resourceClose(conn,stmt);
      }
      
      return chart;
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
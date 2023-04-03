package com.achu.www;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.ContextConfiguration;
	
	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
	public class DataSourceTest {
		private static final Logger log = LoggerFactory.getLogger("JDBCtest.class");
		
		@Autowired
		DataSource ds;
		
		@Test
		public void test() {
			
			try {
				Connection conn = ds.getConnection();
				log.info(conn.toString());
			} catch (SQLException e) {
				e.printStackTrace();
		}
	}
}

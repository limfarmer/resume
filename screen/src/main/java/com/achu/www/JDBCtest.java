package com.achu.www;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.*;
	
	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
	public class JDBCtest {
		private static final Logger log = LoggerFactory.getLogger("JDBCtest.class");
		@Test
		public void test() {
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn= DriverManager.getConnection(
						"jdbc:oracle:thin:@JCLASS10:1521:achu",
						"achu",
						"1234"
						);
				log.info(conn.toString());
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}

}

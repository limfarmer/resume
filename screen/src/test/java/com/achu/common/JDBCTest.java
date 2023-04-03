package com.achu.common;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class JDBCTest {

	private static final Logger log = LoggerFactory.getLogger("JDBCTest.class");
	
	@Test
	public void test() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@jclass10:1521:achu",
					"achu",
					"1234"
					);
			log.info(conn.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

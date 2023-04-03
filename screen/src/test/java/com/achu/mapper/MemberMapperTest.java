package com.achu.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.achu.dto.Member;
	
	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
	public class MemberMapperTest {
		private static final Logger log = LoggerFactory.getLogger("MemberMapperTest.class");
		
		@Autowired
		private MemberMapper mp;
		
		@Test
		public void test() {
			Member m =mp.getById("dlaa");
			log.info("나 임정후 가끔 감상에 젖어 눈물을 흘리곤하지★ "+ m.getName());
			
		}
}

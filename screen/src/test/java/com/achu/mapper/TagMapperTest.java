

package com.achu.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.achu.dto.Tag;
	
	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
	public class TagMapperTest {
		private static final Logger log = LoggerFactory.getLogger("TagMapperTest.class");
		
		@Autowired
		private TagMapper mapper;
		
		@Test
		public void test() {
			log.info("TagInsert called...");
			/*Map<String,Object> rs = new HashMap<String,Object>();
			rs.put("tagName", "test33as3");*/
			mapper.insert("test-true");
			//성공했을때: result=1
			//실패했을때: sql 에러남... 중복처리 별도 분리로 처리하기...
		}
		
		@Test
		public void listTest() {
			log.info("TagList called...");
			List<Tag> result = mapper.list();
			for(Tag t : result) {
				log.info("태그이름 : "+t.getName());
			}
		}
		
		@Test
		public void editTest() {
			log.info("Tag edit called...");
			log.info("Tag edit result : " +mapper.edit("110","edit-test"));
			
		}
		
		@Test
		public void removeTest() {
			log.info("Tag remove called...");
			log.info("Tag remove result : " +mapper.remove("110"));
			
		}
}

package com.achu.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
	
	@RunWith(SpringJUnit4ClassRunner.class)
	@WebAppConfiguration
	@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
										"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
	public class TagControllerTest {
		private static final Logger log = LoggerFactory.getLogger("TagControllerTest.class");
		
		@Autowired
		private WebApplicationContext wac;
		
		private MockMvc mockMvc;
		
		@Before
		public void setup() {
			this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
			log.info("mockMvc setup....");
		}
		// 일반 컨트롤러
			@Test
			public void test() {
				
				try {
					String rs = mockMvc.perform(
									MockMvcRequestBuilders.post("/login").param("id", "shiri").param("pw", "1234")
								).andReturn().getModelAndView().getViewName();
					log.info("ControllerTest : "+rs);
				} catch (Exception e) {
					e.printStackTrace();
			}
		}
		// Rest 컨트롤러
		@Test
		public void test2() {
			
			try {
				mockMvc.perform(
						MockMvcRequestBuilders.get("/adminRest/tagInsert/ControllerTest2")
						).andExpect(status().is(200));
				log.info("ControllerTest : ");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
}

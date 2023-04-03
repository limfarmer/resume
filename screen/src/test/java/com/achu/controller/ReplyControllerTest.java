package com.achu.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.achu.dto.Reply;
import com.google.gson.Gson;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
									"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class ReplyControllerTest {
	private static final Logger log = LoggerFactory.getLogger("ReplyControllerTest.class");

	
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
							MockMvcRequestBuilders.get("/artDetail/detail").param("seqno", "1")
						).andReturn().getModelAndView().getViewName();
			System.out.println(rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//REST 컨트롤러
	@Test
	public void test2() throws Exception {
		Reply reply = new Reply();
		reply.setId("user2");
		reply.setContent("restcon 테스트");
		reply.setArt_seqno("1");
		String jsonStr = new Gson().toJson(reply);
		log.info(jsonStr);
		mockMvc.perform(MockMvcRequestBuilders.post("/reply/add")
				.contentType(MediaType.APPLICATION_JSON)
				.content(jsonStr)).andExpect(status().is(200));
	}
}

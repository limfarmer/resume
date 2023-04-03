package com.achu.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.achu.dto.Reply;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReplyMapperTest {
	@Autowired
	private ReplyMapper mapper;
	
	// 댓글 등록 테스트
//	@Test
//	public void test() {
//
//	     Reply r = new Reply();
//	     r.setContent("댓글 댓글");
//	     r.setArt_seqno("1");
//	     r.setId("user2");
//	     
//	     mapper.insert(r);
//	}	
//	// 댓글 조회 테스트
	@Test
	public void testList() {
	   List<Reply> list = mapper.getReplyList(1);
	   for(Reply r : list) {
		  System.out.println("댓글 조회 테스트 : " +r.getContent());
	   }
  }
//	 @Test
//	   public void testUpdate() {
//		   Reply r = new Reply();
//		   r.setSeqno("1");
//		   r.setAno(4L);
//		   r.setId("user2");
//		   r.setContent("댓글 수정합니다.");
//		   r.setArt_seqno("1");
//		   int count = mapper.modify(r);
//		   System.out.println("업데이트 카운트" + count);
//		   
//	   }
//	@Test
//	public void testDel() {
//		int rs = mapper.remove(1);
//		System.out.println("삭제 테스트 : " + rs);
//	}
//	
}

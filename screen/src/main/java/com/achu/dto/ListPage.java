package com.achu.dto;

import java.util.List;

public class ListPage {
	
	//페이징 관련 멤버변수
	
	//전체 글의 행의 수
	private int total;
	
	private Criteria cri;
	
	//현재 페이지 번호
	//private int currentPage;
	
	//전체 페이지 개수
	private int totalPages;
	
	//시작 페이지 번호
	private int startPage;
	
	//종료 페이지 번호
	private int endPage;
	
	//페이징의 개수
	//private int pagingCount;
	
	//게시글 데이터
	private List<?> content;

	public ListPage() {
	}
	
	//생성자
	//size : 한 화면에 보여질 행의 개수
	public ListPage(int total, Criteria cri, List<?> content) {
		super();
		this.total = total;
		this.cri = cri;
		this.content = content;
		int currentPage = cri.getCurrentPage();
		int pagingCount=cri.getPagingCount();
		int size=cri.getLength();
		
		if(total==0) {//select 결과가 없다면
			totalPages=0;
			startPage=0;
			endPage=0;
		}else {
		
		//전체페이지 개수 구하기(전체 글의 수/ 한 화면에 보여질 행의 수)
		//정수와 정수의 나눗셈의 결과는 정수이므로 13/7=>1
		totalPages = total/size;
		//보정해줘야 할 경우는? 15/7=2 경우처럼 나머지가 0보다 클 때			
		if(total%size>0) {
			//전체 페이지수를 1증가 처리
			totalPages++;
		}
		
		//startPage : [1][2][3][4][5] 일때 1을 의미
		//공식 : startPage = 현재페이지/페이징의 개수*페이징의 개수+1;
		startPage = currentPage/pagingCount*pagingCount+1;
		//보정해줘야 할 경우는?5/5*5+1 =>6 처럼 현재페이지%5==0일 때
		if(currentPage%pagingCount==0) {
			//startPage= startPage-5(페이징의 개수);
			startPage-=pagingCount;
		}
		
		//endPage : [1][2][3][4][5] 일때 5를 의미
		endPage=startPage+(pagingCount-1);
		//보정해줘야 할 경우는? endPage>totalPages일 때
		//				 endPage를 totalPages로 바꿔줘야 함
		if(endPage>totalPages) {
			endPage=totalPages;
			}
		
		}//end outer if
		
	}

	//전체 행의 수를 리턴
	public int getTotal() {
		return this.total;
	}

	//select결과가 없는가? : true가 리턴되면 결과가 없는 것
	public boolean hasNoArticles() {
		return this.total ==0;
	}

	//select결과가 있는가? : true가 리턴되면 결과가 있는 것
	public boolean hasArticles() {
		return this.total>0;
	}

	//현재 페이지 번호 리턴
	/*public int getCurrentPage() {
		return currentPage;
	}
	*/
	//데이터 VO List 리턴
	public List<?> getContent(){
		return this.content;
	}

	//목록 하단의 시작 번호를 리턴
	public int getStartPage() {
		return this.startPage;
	}

	//목록 하단의 종료 번호를 리턴
	public int getEndPage() {
		return this.endPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public Criteria getCri() {
		return cri;
	}

	/*	public int getPagingCount() {
			return pagingCount;
		}*/
	
	

}

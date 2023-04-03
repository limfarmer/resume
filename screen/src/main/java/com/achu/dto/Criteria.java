package com.achu.dto;

public class Criteria {
	
	private String kind;
	private int length;
	private int currentPage;
	private String searchField;
	private String keyword;
	private int[] lengthOpt = {10,25,50,100};
	private int pagingCount=5;
	
	public Criteria() {
		super();
	}
	
	public Criteria(String length, String currentPage, String searchField, String keyword) {
		super();
		this.length = Integer.parseInt(length);
		this.currentPage = Integer.parseInt(currentPage);
		this.searchField = searchField;
		this.keyword = keyword;

	}
	
	public Criteria(String kind, String length, String currentPage, String searchField, String keyword) {
		super();
		this.kind = kind;
		this.length = Integer.parseInt(length);
		this.currentPage = Integer.parseInt(currentPage);
		this.searchField = searchField;
		this.keyword = keyword;
		
		if(kind==null) {
			this.kind="all";
		}
		
		if(keyword==null) {
			this.keyword="";
		}
	}
	
	public Criteria(String kind, String searchField, String keyword) {
		super();
		this.kind = kind;
		this.searchField = searchField;
		this.keyword = keyword;
	}

	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getSearchField() {
		return searchField;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int[] getLengthOpt() {
		return lengthOpt;
	}

	public void setLengthOpt(int[] lengthOpt) {
		this.lengthOpt = lengthOpt;
	}

	public int getPagingCount() {
		return pagingCount;
	}

	public void setPagingCount(int pagingCount) {
		this.pagingCount = pagingCount;
	}
	
}

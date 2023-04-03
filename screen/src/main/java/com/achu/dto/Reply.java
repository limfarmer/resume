package com.achu.dto;

public class Reply {
	
	private int no;
	private String seqno;
	private String content;
	private String wdate;
	private String art_seqno;
	private String id;
	private long ano;

	public Reply() {
	}

	public String getSeqno() {
		return seqno;
	}

	public void setSeqno(String seqno) {
		this.seqno = seqno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getArt_seqno() {
		return art_seqno;
	}

	public void setArt_seqno(String art_seqno) {
		this.art_seqno = art_seqno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public long getAno() {
		return ano;
	}

	public void setAno(long ano) {
		this.ano = ano;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
}

package com.achu.dto;
public class Rating {
	private String seqno;
	private double value;
	private String id;
	private String wdate;
	private String artSeqno;

	
	public Rating(){ 
	}

	public String getSeqno() {
		return seqno;
	}

	public void setSeqno(String seqno) {
		this.seqno = seqno;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getArtSeqno() {
		return artSeqno;
	}

	public void setArtSeqno(String art_seqno) {
		this.artSeqno = art_seqno;
	}

}

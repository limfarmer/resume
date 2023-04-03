package com.achu.dto;

import java.util.List;

public class Tag {
	private String seqno;
	private String name;
	private String top;
	private String mid;
	private String topSeq;
	private String midSeq;
	private List<Artwork> artwork; //이거 이용해서 toptagart랑 toptag 합칠수있음 (고쳐야됨)
	private String artRatingAvg;
	private String artCount;
	private String replyCount;
	private String linkAddress;
	
	public List<Artwork> getArtwork() {
		return artwork;
	}
	public void setArtwork(List<Artwork> artwork) {
		this.artwork = artwork;
	}
	public String getSeqno() {
		return seqno;
	}
	public void setSeqno(String seqno) {
		this.seqno = seqno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTop() {
		return top;
	}
	public void setTop(String top) {
		this.top = top;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTopSeq() {
		return topSeq;
	}
	public void setTopSeq(String topSeq) {
		this.topSeq = topSeq;
	}
	public String getMidSeq() {
		return midSeq;
	}
	public void setMidSeq(String midSeq) {
		this.midSeq = midSeq;
	}
	public String getArtRatingAvg() {
		return artRatingAvg;
	}
	public void setArtRatingAvg(String artRatingAvg) {
		this.artRatingAvg = artRatingAvg;
	}
	public String getArtCount() {
		return artCount;
	}
	public void setArtCount(String artCount) {
		this.artCount = artCount;
	}
	public String getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(String replyCount) {
		this.replyCount = replyCount;
	}
	public String getLinkAddress() {
		return linkAddress;
	}
	public void setLinkAddress(String linkAddress) {
		this.linkAddress = linkAddress;
	}
	
}

package com.khbill.dto;

public class ReviewScrap {

	private int scrapNo;
	private int reviewNo;
	private int userNo;
	@Override
	public String toString() {
		return "ReviewScrap [scrapNo=" + scrapNo + ", reviewNo=" + reviewNo + ", userNo=" + userNo + "]";
	}
	public int getScrapNo() {
		return scrapNo;
	}
	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	

	
	
}

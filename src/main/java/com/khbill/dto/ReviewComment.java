package com.khbill.dto;

import java.util.Date;

public class ReviewComment {

	
	private int reviewComNo;
	private int reviewNo;
	private int userNo;
	private String reviewComContent;
	private Date reviewComDate;
	private int tradeComLike;
	private int tradeComHate;
	@Override
	public String toString() {
		return "ReviewComment [reviewComNo=" + reviewComNo + ", reviewNo=" + reviewNo + ", userNo=" + userNo
				+ ", reviewComContent=" + reviewComContent + ", reviewComDate=" + reviewComDate + ", tradeComLike="
				+ tradeComLike + ", tradeComHate=" + tradeComHate + "]";
	}
	public int getReviewComNo() {
		return reviewComNo;
	}
	public void setReviewComNo(int reviewComNo) {
		this.reviewComNo = reviewComNo;
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
	public String getReviewComContent() {
		return reviewComContent;
	}
	public void setReviewComContent(String reviewComContent) {
		this.reviewComContent = reviewComContent;
	}
	public Date getReviewComDate() {
		return reviewComDate;
	}
	public void setReviewComDate(Date reviewComDate) {
		this.reviewComDate = reviewComDate;
	}
	public int getTradeComLike() {
		return tradeComLike;
	}
	public void setTradeComLike(int tradeComLike) {
		this.tradeComLike = tradeComLike;
	}
	public int getTradeComHate() {
		return tradeComHate;
	}
	public void setTradeComHate(int tradeComHate) {
		this.tradeComHate = tradeComHate;
	}
	
	
	
}

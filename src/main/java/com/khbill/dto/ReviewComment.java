package com.khbill.dto;

import java.util.Date;

public class ReviewComment {

	
	private int reviewComNo;
	private int reviewNo;
	private int userNo;
	private String reviewComContent;
	private Date reviewComDate;
	private int reviewComLike;
	private int reviewComHate;
	@Override
	public String toString() {
		return "ReviewComment [reviewComNo=" + reviewComNo + ", reviewNo=" + reviewNo + ", userNo=" + userNo
				+ ", reviewComContent=" + reviewComContent + ", reviewComDate=" + reviewComDate + ", reviewComLike="
				+ reviewComLike + ", reviewComHate=" + reviewComHate + "]";
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
	public int getReviewComLike() {
		return reviewComLike;
	}
	public void setReviewComLike(int reviewComLike) {
		this.reviewComLike = reviewComLike;
	}
	public int getReviewComHate() {
		return reviewComHate;
	}
	public void setReviewComHate(int reviewComHate) {
		this.reviewComHate = reviewComHate;
	}
	
	
	
}

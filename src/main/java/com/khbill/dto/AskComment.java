package com.khbill.dto;

import java.util.Date;

public class AskComment {

	private int askComNo;
	private int askNo;
	private int userNo;
	private String askComContent;
	private Date askComDate;
	private int askComLike;
	private int askComHate;
	@Override
	public String toString() {
		return "AskComment [askComNo=" + askComNo + ", askNo=" + askNo + ", userNo=" + userNo + ", askComContent="
				+ askComContent + ", askComDate=" + askComDate + ", askComLike=" + askComLike + ", askComHate="
				+ askComHate + "]";
	}
	public int getAskComNo() {
		return askComNo;
	}
	public void setAskComNo(int askComNo) {
		this.askComNo = askComNo;
	}
	public int getAskNo() {
		return askNo;
	}
	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getAskComContent() {
		return askComContent;
	}
	public void setAskComContent(String askComContent) {
		this.askComContent = askComContent;
	}
	public Date getAskComDate() {
		return askComDate;
	}
	public void setAskComDate(Date askComDate) {
		this.askComDate = askComDate;
	}
	public int getAskComLike() {
		return askComLike;
	}
	public void setAskComLike(int askComLike) {
		this.askComLike = askComLike;
	}
	public int getAskComHate() {
		return askComHate;
	}
	public void setAskComHate(int askComHate) {
		this.askComHate = askComHate;
	}
	
	

	
	
}

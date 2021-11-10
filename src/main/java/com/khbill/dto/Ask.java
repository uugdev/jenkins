package com.khbill.dto;

import java.util.Date;

public class Ask {

	
	private int askNo;
	private int userNo;
	private int productNo;
	private String askTitle;
	private String askContent;
	private Date askDate;
	private int askHit;
	@Override
	public String toString() {
		return "Ask [askNo=" + askNo + ", userNo=" + userNo + ", productNo=" + productNo + ", askTitle=" + askTitle
				+ ", askContent=" + askContent + ", askDate=" + askDate + ", askHit=" + askHit + "]";
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
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getAskTitle() {
		return askTitle;
	}
	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}
	public String getAskContent() {
		return askContent;
	}
	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}
	public Date getAskDate() {
		return askDate;
	}
	public void setAskDate(Date askDate) {
		this.askDate = askDate;
	}
	public int getAskHit() {
		return askHit;
	}
	public void setAskHit(int askHit) {
		this.askHit = askHit;
	}
	
	
}

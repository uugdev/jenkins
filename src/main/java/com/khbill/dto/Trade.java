package com.khbill.dto;

import java.util.Date;

public class Trade {

	private int tradeNo;
	private int userNo;
	private int fileNo;
	private int tradeCategory;
	private String tradeTitle;
	private String tradeContent;
	private Date tradeDate;
	private int tradeHit;
	@Override
	public String toString() {
		return "Trade [tradeNo=" + tradeNo + ", userNo=" + userNo + ", fileNo=" + fileNo + ", tradeCategory="
				+ tradeCategory + ", tradeTitle=" + tradeTitle + ", tradeContent=" + tradeContent + ", tradeDate="
				+ tradeDate + ", tradeHit=" + tradeHit + "]";
	}
	public int getTradeNo() {
		return tradeNo;
	}
	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getTradeCategory() {
		return tradeCategory;
	}
	public void setTradeCategory(int tradeCategory) {
		this.tradeCategory = tradeCategory;
	}
	public String getTradeTitle() {
		return tradeTitle;
	}
	public void setTradeTitle(String tradeTitle) {
		this.tradeTitle = tradeTitle;
	}
	public String getTradeContent() {
		return tradeContent;
	}
	public void setTradeContent(String tradeContent) {
		this.tradeContent = tradeContent;
	}
	public Date getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(Date tradeDate) {
		this.tradeDate = tradeDate;
	}
	public int getTradeHit() {
		return tradeHit;
	}
	public void setTradeHit(int tradeHit) {
		this.tradeHit = tradeHit;
	}
	
	
}

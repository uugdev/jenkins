package com.khbill.dto;

public class AskScrap {

	
	private int scrapNo;
	private int askNo;
	private int userNo;
	@Override
	public String toString() {
		return "AskScrap [scrapNo=" + scrapNo + ", askNo=" + askNo + ", userNo=" + userNo + "]";
	}
	public int getScrapNo() {
		return scrapNo;
	}
	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
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
	
	
	
}

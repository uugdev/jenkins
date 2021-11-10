package com.khbill.dto;

public class TradeScrap {

	
	private int scrapNo;
	private int tradeNo;
	private int userNo;
	@Override
	public String toString() {
		return "TradeScrap [scrapNo=" + scrapNo + ", tradeNo=" + tradeNo + ", userNo=" + userNo + "]";
	}
	public int getScrapNo() {
		return scrapNo;
	}
	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
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

	
}

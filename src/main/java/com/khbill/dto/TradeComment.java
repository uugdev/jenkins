package com.khbill.dto;

import java.util.Date;

public class TradeComment {

	
	private int tradeComNo;
	private int tradeNo;
	private int userNo;
	private String tradeComContent;
	private Date tradeComDate;
	private String tradeComSecret;
	private int tradeComLike;
	private int tradeComHate;
	@Override
	public String toString() {
		return "TradeComment [tradeComNo=" + tradeComNo + ", tradeNo=" + tradeNo + ", userNo=" + userNo
				+ ", tradeComContent=" + tradeComContent + ", tradeComDate=" + tradeComDate + ", tradeComSecret="
				+ tradeComSecret + ", tradeComLike=" + tradeComLike + ", tradeComHate=" + tradeComHate + "]";
	}
	public int getTradeComNo() {
		return tradeComNo;
	}
	public void setTradeComNo(int tradeComNo) {
		this.tradeComNo = tradeComNo;
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
	public String getTradeComContent() {
		return tradeComContent;
	}
	public void setTradeComContent(String tradeComContent) {
		this.tradeComContent = tradeComContent;
	}
	public Date getTradeComDate() {
		return tradeComDate;
	}
	public void setTradeComDate(Date tradeComDate) {
		this.tradeComDate = tradeComDate;
	}
	public String getTradeComSecret() {
		return tradeComSecret;
	}
	public void setTradeComSecret(String tradeComSecret) {
		this.tradeComSecret = tradeComSecret;
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

	

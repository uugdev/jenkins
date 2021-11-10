package com.khbill.dto;

import java.util.Date;

public class AskComment {

	private int askComNo;
	private int askNo;
	private int userNo;
	private String askComContent;
	private Date askComDate;
	private int tradeComLike;
	private int tradeComHate;
	@Override
	public String toString() {
		return "AskComment [askComNo=" + askComNo + ", askNo=" + askNo + ", userNo=" + userNo + ", askComContent="
				+ askComContent + ", tradeComLike=" + tradeComLike + ", tradeComHate=" + tradeComHate + "]";
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

package com.khbill.dto;

import java.util.Date;

public class TradeReport {

	private int reportNo;
	private int tradeNo;
	private int reporterNo;
	private int respondentNo;
	private String reportCategory;
	private String reportContent;
	private Date reportDate;
	private String reportStatus;
	@Override
	public String toString() {
		return "TradeReport [reportNo=" + reportNo + ", tradeNo=" + tradeNo + ", reporterNo=" + reporterNo
				+ ", respondentNo=" + respondentNo + ", reportCategory=" + reportCategory + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", reportStatus=" + reportStatus + "]";
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getTradeNo() {
		return tradeNo;
	}
	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}
	public int getReporterNo() {
		return reporterNo;
	}
	public void setReporterNo(int reporterNo) {
		this.reporterNo = reporterNo;
	}
	public int getRespondentNo() {
		return respondentNo;
	}
	public void setRespondentNo(int respondentNo) {
		this.respondentNo = respondentNo;
	}
	public String getReportCategory() {
		return reportCategory;
	}
	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}
	
	
	
	
}

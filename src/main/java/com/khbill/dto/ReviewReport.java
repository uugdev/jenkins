package com.khbill.dto;

import java.util.Date;

public class ReviewReport {

	private int reportNo;
	private int reviewNo;
	private int reporterNo;
	private int respondentNo;
	private String reportCategory;
	private String reportContent;
	private Date reportDate;
	private String reportStatus;
	@Override
	public String toString() {
		return "ReviewReport [reportNo=" + reportNo + ", reviewNo=" + reviewNo + ", reporterNo=" + reporterNo
				+ ", respondentNo=" + respondentNo + ", reportCategory=" + reportCategory + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", reportStatus=" + reportStatus + "]";
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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

package com.khbill.dto;

import java.util.Date;

public class QnaComment {

	private int qnaComNo;
	private int qnaNo;
	private int adminNo;
	private String qnaComContent;
	private Date qnaComDate;
	@Override
	public String toString() {
		return "QnaComment [qnaComNo=" + qnaComNo + ", qnaNo=" + qnaNo + ", adminNo=" + adminNo + ", qnaComContent="
				+ qnaComContent + ", qnaComDate=" + qnaComDate + "]";
	}
	public int getQnaComNo() {
		return qnaComNo;
	}
	public void setQnaComNo(int qnaComNo) {
		this.qnaComNo = qnaComNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getQnaComContent() {
		return qnaComContent;
	}
	public void setQnaComContent(String qnaComContent) {
		this.qnaComContent = qnaComContent;
	}
	public Date getQnaComDate() {
		return qnaComDate;
	}
	public void setQnaComDate(Date qnaComDate) {
		this.qnaComDate = qnaComDate;
	}

	
	
}

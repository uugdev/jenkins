package com.khbill.dto;

import java.util.Date;

public class Message {
	
	private int msgNo;
	private int receiverNo;
	private int senderNo;
	private String msgTitle;
	private String msgContent;
	private Date msgDate;
	private String msgCheck;
	private String receiverShow;
	private String senderShow;
	
	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", receiverNo=" + receiverNo + ", senderNo=" + senderNo + ", msgTitle="
				+ msgTitle + ", msgContent=" + msgContent + ", msgDate=" + msgDate + ", msgCheck=" + msgCheck
				+ ", receiverShow=" + receiverShow + ", senderShow=" + senderShow + "]";
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public int getReceiverNo() {
		return receiverNo;
	}

	public void setReceiverNo(int receiverNo) {
		this.receiverNo = receiverNo;
	}

	public int getSenderNo() {
		return senderNo;
	}

	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Date getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}

	public String getMsgCheck() {
		return msgCheck;
	}

	public void setMsgCheck(String msgCheck) {
		this.msgCheck = msgCheck;
	}

	public String getReceiverShow() {
		return receiverShow;
	}

	public void setReceiverShow(String receiverShow) {
		this.receiverShow = receiverShow;
	}

	public String getSenderShow() {
		return senderShow;
	}

	public void setSenderShow(String senderShow) {
		this.senderShow = senderShow;
	}
	
	
}

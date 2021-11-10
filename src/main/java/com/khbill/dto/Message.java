package com.khbill.dto;

import java.util.Date;

public class Message {
	
	private int msgNo;
	private int receiverNo;
	private int senderNo;
	private String msgTitle;
	private String msgContent;
	private Date msgDate;
	private String msgcheck;
	
	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", receiverNo=" + receiverNo + ", senderNo=" + senderNo + ", msgTitle="
				+ msgTitle + ", msgContent=" + msgContent + ", msgDate=" + msgDate + ", msgcheck=" + msgcheck + "]";
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

	public String getMsgcheck() {
		return msgcheck;
	}

	public void setMsgcheck(String msgcheck) {
		this.msgcheck = msgcheck;
	}
	
}

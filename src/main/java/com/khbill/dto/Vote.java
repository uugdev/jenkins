package com.khbill.dto;

import java.util.Date;

public class Vote {

	private int voteNo;
	private int userNo;
	private int askNo;
	private String voteState;
	private Date voteStart;
	private Date voteEnd;
	@Override
	public String toString() {
		return "Vote [voteNo=" + voteNo + ", userNo=" + userNo + ", askNo=" + askNo + ", voteState=" + voteState
				+ ", voteStart=" + voteStart + ", voteEnd=" + voteEnd + "]";
	}
	public int getVoteNo() {
		return voteNo;
	}
	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getAskNo() {
		return askNo;
	}
	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}
	public String getVoteState() {
		return voteState;
	}
	public void setVoteState(String voteState) {
		this.voteState = voteState;
	}
	public Date getVoteStart() {
		return voteStart;
	}
	public void setVoteStart(Date voteStart) {
		this.voteStart = voteStart;
	}
	public Date getVoteEnd() {
		return voteEnd;
	}
	public void setVoteEnd(Date voteEnd) {
		this.voteEnd = voteEnd;
	}

	


}
package com.khbill.dto;

import java.util.Date;

public class User {

	
	private int userNo;
	private String userId;
	private String userPw;
	private String userNick;
	private String userMail;
	private Date joinDate;
	private int extraMoney;
	private String userBday;
	private String userGender;
	private int userPoint;
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userNick=" + userNick
				+ ", userMail=" + userMail + ", joinDate=" + joinDate + ", extraMoney=" + extraMoney + ", userBday="
				+ userBday + ", userGender=" + userGender + ", userPoint=" + userPoint + "]";
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public int getExtraMoney() {
		return extraMoney;
	}
	public void setExtraMoney(int extraMoney) {
		this.extraMoney = extraMoney;
	}
	public String getUserBday() {
		return userBday;
	}
	public void setUserBday(String userBday) {
		this.userBday = userBday;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	
	
	
	
	
}
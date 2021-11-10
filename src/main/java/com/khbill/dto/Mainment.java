package com.khbill.dto;

public class Mainment {

	private int mentNo;
	private String mentContent;
	private int percentLowest;
	private int percentHighest;
	@Override
	public String toString() {
		return "Mainment [mentNo=" + mentNo + ", mentContent=" + mentContent + ", percentLowest=" + percentLowest
				+ ", percentHighest=" + percentHighest + "]";
	}
	public int getMentNo() {
		return mentNo;
	}
	public void setMentNo(int mentNo) {
		this.mentNo = mentNo;
	}
	public String getMentContent() {
		return mentContent;
	}
	public void setMentContent(String mentContent) {
		this.mentContent = mentContent;
	}
	public int getPercentLowest() {
		return percentLowest;
	}
	public void setPercentLowest(int percentLowest) {
		this.percentLowest = percentLowest;
	}
	public int getPercentHighest() {
		return percentHighest;
	}
	public void setPercentHighest(int percentHighest) {
		this.percentHighest = percentHighest;
	}
	
	
	
	
}

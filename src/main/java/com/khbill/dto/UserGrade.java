package com.khbill.dto;

public class UserGrade {

	
	private String grade;
	private int lowPoint;
	private int highPoint;
	@Override
	public String toString() {
		return "UserGrade [grade=" + grade + ", lowPoint=" + lowPoint + ", highPoint=" + highPoint + "]";
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getLowPoint() {
		return lowPoint;
	}
	public void setLowPoint(int lowPoint) {
		this.lowPoint = lowPoint;
	}
	public int getHighPoint() {
		return highPoint;
	}
	public void setHighPoint(int highPoint) {
		this.highPoint = highPoint;
	}
	

	
}

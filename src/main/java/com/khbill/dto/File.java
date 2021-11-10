package com.khbill.dto;

import java.util.Date;

public class File {

	
	private int fileNo;
	private String fileOrigin;
	private String fileStored;
	private int fileSize;
	private Date fileDate;
	@Override
	public String toString() {
		return "File [fileNo=" + fileNo + ", fileOrigin=" + fileOrigin + ", fileStored=" + fileStored + ", fileSize="
				+ fileSize + ", fileDate=" + fileDate + "]";
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileOrigin() {
		return fileOrigin;
	}
	public void setFileOrigin(String fileOrigin) {
		this.fileOrigin = fileOrigin;
	}
	public String getFileStored() {
		return fileStored;
	}
	public void setFileStored(String fileStored) {
		this.fileStored = fileStored;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public Date getFileDate() {
		return fileDate;
	}
	public void setFileDate(Date fileDate) {
		this.fileDate = fileDate;
	}
	
	
	
	
}

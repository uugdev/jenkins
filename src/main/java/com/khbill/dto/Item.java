package com.khbill.dto;

public class Item {

	private int itemNo;
	private int userNo;
	private int fileNo;
	private String itemBrand;
	private String itemName;
	private int itemPrice;
	private String itemStatus;
	@Override
	public String toString() {
		return "Item [itemNo=" + itemNo + ", userNo=" + userNo + ", fileNo=" + fileNo + ", itemBrand=" + itemBrand
				+ ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", itemStatus=" + itemStatus + "]";
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getItemBrand() {
		return itemBrand;
	}
	public void setItemBrand(String itemBrand) {
		this.itemBrand = itemBrand;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemStatus() {
		return itemStatus;
	}
	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}

	
	
	
	
}

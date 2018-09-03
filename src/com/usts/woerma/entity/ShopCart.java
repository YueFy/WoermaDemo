package com.usts.woerma.entity;

public class ShopCart {
	private int gId;
	private String gName;
	private String gType;
	private double gPrice;
	private String gBuyDate;
	private int gBuyAmount;
	public ShopCart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShopCart(int gId, String gName, String gType, double gPrice, String gBuyDate, int gBuyAmount) {
		super();
		this.gId = gId;
		this.gName = gName;
		this.gType = gType;
		this.gPrice = gPrice;
		this.gBuyDate = gBuyDate;
		this.gBuyAmount = gBuyAmount;
	}
	public int getgId() {
		return gId;
	}
	public void setgId(int gId) {
		this.gId = gId;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getgType() {
		return gType;
	}
	public void setgType(String gType) {
		this.gType = gType;
	}
	public double getgPrice() {
		return gPrice;
	}
	public void setgPrice(double gPrice) {
		this.gPrice = gPrice;
	}
	public String getgBuyDate() {
		return gBuyDate;
	}
	public void setgBuyDate(String gBuyDate) {
		this.gBuyDate = gBuyDate;
	}
	public int getgBuyAmount() {
		return gBuyAmount;
	}
	public void setgBuyAmount(int gBuyAmount) {
		this.gBuyAmount = gBuyAmount;
	}
	@Override
	public String toString() {
		return "ShopCart [gId=" + gId + ", gName=" + gName + ", gType=" + gType + ", gPrice=" + gPrice + ", gBuyDate="
				+ gBuyDate + ", gBuyAmount=" + gBuyAmount + "]";
	}
	
}

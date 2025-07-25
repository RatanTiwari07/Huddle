package com.shp.beans;

public class CartBean {
	private String userId;
	private String prodId;
	private int quantity;

	public CartBean() {
	}

	public CartBean(String userId, String prodId, int quantity) {
		this.userId = userId;
		this.prodId = prodId;
		this.quantity = quantity;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}

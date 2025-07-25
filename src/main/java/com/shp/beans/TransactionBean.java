package com.shp.beans;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.shp.util.IdUtil;

public class TransactionBean {

	private String transactionId;
	private String userName;
	private Timestamp transDateTime;
	private double transAmount;

	public TransactionBean() {
		this.transactionId = IdUtil.generateTransId();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");

		Timestamp tstmp = new Timestamp(System.currentTimeMillis());

		sdf.format(tstmp);

		this.transDateTime = tstmp;
	}

	public TransactionBean(String userName, double transAmount) {
		this.transactionId = IdUtil.generateTransId();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");

		Timestamp tstmp = new Timestamp(System.currentTimeMillis());

		sdf.format(tstmp);

		this.transDateTime = tstmp;
		this.userName = userName;
		this.transAmount = transAmount;
	}

	public TransactionBean(String transactionId, String userName, double transAmount) {
		this.transactionId = transactionId;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");

		Timestamp tstmp = new Timestamp(System.currentTimeMillis());

		sdf.format(tstmp);

		this.transDateTime = tstmp;
		this.userName = userName;
		this.transAmount = transAmount;
	}

	public TransactionBean(String userName, Timestamp transDateTime, double transAmount) {
		this.transactionId = IdUtil.generateTransId();
		this.transDateTime = transDateTime;
		this.userName = userName;
		this.transAmount = transAmount;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Timestamp getTransDateTime() {
		return transDateTime;
	}

	public void setTransDateTime(Timestamp transDateTime) {
		this.transDateTime = transDateTime;
	}

	public double getTransAmount() {
		return transAmount;
	}

	public void setTransAmount(double transAmount) {
		this.transAmount = transAmount;
	}
}

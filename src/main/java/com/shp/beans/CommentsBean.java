package com.shp.beans;

import java.sql.Timestamp;

public class CommentsBean {

	private String email;
	private String comment;
	private Timestamp comment_date;

	public CommentsBean() {
		email = null;
		comment = null;
	}

	public CommentsBean(String email, String comment) {
		this.email = email;
		this.comment = comment;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Timestamp getComment_date () {
		return comment_date;
	}

	public void setComment_date (Timestamp comment_date) {
		this.comment_date = comment_date;
	}
}

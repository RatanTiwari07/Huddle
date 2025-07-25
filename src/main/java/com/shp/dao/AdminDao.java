package com.shp.dao;

import com.shp.beans.AdminBean;

public interface AdminDao {

	public String registerAdmin (String name , String address, String email, String password);
	
	public String registerAdmin (AdminBean admin);
	
	public boolean isRegistered (String email);
	
	public String isValidCredentials (String email, String password);
	
}

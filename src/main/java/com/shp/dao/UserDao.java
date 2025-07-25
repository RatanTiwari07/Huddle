package com.shp.dao;

import com.shp.beans.UserBean;

public interface UserDao {

	public String registerUser (String userName, Long Mobile, String emailId, String address,
						int pincode, String password);

	public String registerUser (UserBean user);

	public boolean isRegistered (String emailId);

	public String isValidCredentials (String emailId, String password);

	public UserBean getUserDetails (String emailId, String password);

	public String getFName (String emailId);

	public String getUserAddr (String userId);

}

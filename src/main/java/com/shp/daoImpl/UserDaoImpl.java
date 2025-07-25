package com.shp.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.shp.beans.UserBean;
import com.shp.dao.UserDao;
import com.shp.util.DbUtil;
import com.shp.util.MailMessage;

public class UserDaoImpl implements UserDao {


	
	@Override
	public String registerUser(String userName, Long Mobile, String emailId, String address, int pincode, String password) {

		UserBean user = new UserBean (userName, Mobile, emailId, address, pincode, password);

		return registerUser (user);

	}

	@Override
	public String registerUser(UserBean user) {

		AdminDaoImpl adminDao = new AdminDaoImpl();
		
		String status = "User registration failed ";

		boolean isUserRegtd = isRegistered (user.getEmail());
		boolean isAdminRegtd = adminDao.isRegistered(user.getEmail());			
		
		if (isUserRegtd) {
			return status += "Email already registered as user";
		} else if (isAdminRegtd) {
			return status += "Email already registered as admin";
		}

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {
																				
			ps = con.prepareStatement("Insert into users values (?,?,?,?,?,?)"); //1  
																		
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getName());
			ps.setLong(3, user.getMobile());
			ps.setString(4, user.getAddress());
			ps.setInt(5, user.getPincode());
			ps.setString(6, user.getPassword());

			int k = ps.executeUpdate();

			if (k > 0) {

				status = "User registeration succesfull !";

				MailMessage.registrationSuccess(user.getEmail(), getFName(user.getEmail()));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}

		return status;
	}

	@Override
	public boolean isRegistered(String emailId) {

		boolean flag = false;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement ("Select * from users where email = ?"); //2

			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next())
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return flag;
	}

	@Override
	public String isValidCredentials(String emailId, String password) {

		String status = "Login Denied ! Email is not yet registered";

		boolean checkReg = isRegistered(emailId);
		
		if (checkReg == true) {
			
			Connection con = DbUtil.provideConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;

			try {

				ps = con.prepareStatement ("Select * from users where email = ? and password = ?");  //3

				ps.setString(1, emailId);
				ps.setString(2, password);

				rs = ps.executeQuery();

				if (rs.next()) {				
					status = "valid";
				} else {
					status = "Login Denied ! Incorrect username or password";
				}

			} catch (Exception e ) {
				e.printStackTrace();
			} finally {
				DbUtil.closeConnection(con);
				DbUtil.closeConnection(ps);
				DbUtil.closeConnection(rs);
			}
		} 

		return status;
	}

	@Override
	public UserBean getUserDetails(String emailId, String password) {

		UserBean user = null;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement ("Select * from users where email = ? and password = ?");

			ps.setString(1, emailId);
			ps.setString(2, password);

			rs = ps.executeQuery();

			if (rs.next()) {

				user = new UserBean ();

				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setMobile(rs.getLong("mobile"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setPincode(rs.getInt("pincode"));

			}

		} catch (Exception e ) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return user;
	}

	@Override
	public String getFName(String emailId) {

		String fname = "";

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement ("Select name from users where email = ?"); //4
			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next()) {

				fname = rs.getString (1);

				fname = fname.split(" ")[0];

			}

		} catch (Exception e ) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return fname;
	}

	@Override
	public String getUserAddr(String userId) {

		String add = "";

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement ("Select address from users where email = ?");  //5
			ps.setString(1, userId);

			rs = ps.executeQuery();

			if (rs.next()) {

				add = rs.getString (1);

			}

		} catch (Exception e ) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return add;
	}

}

package com.shp.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.shp.beans.AdminBean;
import com.shp.dao.AdminDao;
import com.shp.util.DbUtil;

public class AdminDaoImpl implements AdminDao {
	
//	private String name;
//	private String address;
//	private String email;
//	private String password;
	
	@Override
	public String registerAdmin (String name , String address, String email, String password) {
		
		return registerAdmin(new AdminBean(name, address, email, password));
		
	}
	
	@Override
	public String registerAdmin (AdminBean admin) {
		
		String status = "Registeration Failed ! ";
		UserDaoImpl userDao = new UserDaoImpl();
		
		boolean adminCheck = isRegistered(admin.getEmail());
		boolean userCheck = userDao.isRegistered(admin.getEmail());
		
		if (adminCheck == true) {
			
			return status += "Email id already registered as admin";
			
		} else if (userCheck == true) {
			
			return status += "Email id already registered as user";
			
		} 
			
			Connection con = DbUtil.provideConnection();
			PreparedStatement ps = null;
			
			try {
				
				ps = con.prepareStatement("Insert into admin values (?,?,?,?)");
				ps.setString(1, admin.getName());
				ps.setString(2, admin.getAddress());
				ps.setString(3, admin.getEmail());
				ps.setString(4, admin.getPassword());
				
				int k = ps.executeUpdate();
				
				if (k > 0) {
					status = "Admin Registration Succesfull !";
					
					//  To do message transfer;
					
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
	public boolean isRegistered (String email) {
		
		boolean status =  false;
		
		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		System.out.println("in admin isregistered");
		
		try {
			
			ps = con.prepareStatement("Select * from admin where email = ?");
			ps.setString(1, email);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				status = true;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}
		
		return status;
	}
	
	@Override
	public String isValidCredentials (String email, String password) {
		
		String status = "Login Denied ! Email is not yet registered";

		boolean checkReg = isRegistered(email);
		
		if (checkReg == true) {
			
			Connection con = DbUtil.provideConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;

			try {

				ps = con.prepareStatement ("Select * from admin where email = ? and password = ?");  //3

				ps.setString(1, email);
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
}
















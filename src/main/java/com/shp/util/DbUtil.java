package com.shp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUtil {

	public static Connection provideConnection () {

		Connection con = null;
		String user = System.getenv("DB_USERNAME");
		String password = System.getenv("DB_PASSWORD");

		if(user==null || user.isEmpty() || password==null || password.isEmpty()) {
			System.err.println("Database environment variables are not set!");
		}

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping-cart",user,password);
			if (con == null) {
				System.out.println("............con is null...........2");
			}
		} catch (ClassNotFoundException e ) {
			System.out.println("exception in class not found");
		} catch (SQLException e2) {
			System.out.println("exception in sql exception");
		} 

		return con;
	}

	public static void closeConnection (PreparedStatement ps) {

		try {
			if (ps != null)
				ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void closeConnection (ResultSet rs) {

		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void closeConnection (Connection con) {

		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

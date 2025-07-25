package com.shp.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.shp.dao.TransactionDao;
import com.shp.util.DbUtil;

public class TransactionDaoImpl implements TransactionDao {

	@Override
	public String getUserId(String transId) {

		String userId = "";

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement ("Select username from transactions where transid = ?");

			ps.setString(1, transId);												//   1

			rs = ps.executeQuery();

			if (rs.next()) {
				userId = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return userId;
	}

}

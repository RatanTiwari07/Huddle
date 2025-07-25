package com.shp.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shp.beans.DemandBean;
import com.shp.dao.DemandDao;
import com.shp.util.DbUtil;

public class DemandDaoImpl implements DemandDao {

	@Override
	public boolean addProduct(String userId, String prodId, int demandQty) {

		boolean flag = false;
		
		System.out.println(userId);

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from user_demand where username = ? and prodid = ?");

			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

				flag = true;
			} else {

				ps2 = con.prepareStatement("insert into user_demand values (?,?,?)");

				ps2.setString(1, userId);
				ps2.setString(2, prodId);
				ps2.setInt(3, demandQty);

				int k = ps2.executeUpdate();

				if (k > 0)
					flag = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(ps2);
			DbUtil.closeConnection(rs);
		}

		return flag;
	}

	@Override
	public boolean removeProduct(String userId, String prodId) {

		boolean flag = false;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from user_demand where username = ? and prodid = ?");

			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

				ps2 = con.prepareStatement("Delete from user_demand where username = ? and prodid = ? ");

				ps2.setString (1,userId);
				ps2.setString(2, prodId);

				int k = ps2.executeUpdate();

				if (k > 0)
					flag = true;

			} else {

				flag = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(ps2);
			DbUtil.closeConnection(rs);
		}

		return flag;
	}

	@Override
	public boolean addProduct(DemandBean demand) {

		return addProduct (demand.getUserName(), demand.getProdId(), demand.getDemandQty());

	}

	@Override
	public List<DemandBean> haveDemanded(String prodId) {

		List<DemandBean> demandList = new ArrayList<> ();

		Connection con = DbUtil.provideConnection();
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Select * from user_demand where prodId = ?");

			ps.setString(1, prodId);

			rs = ps.executeQuery();

			while (rs.next()) {

				DemandBean demand = new DemandBean (rs.getString("username"), rs.getString("prodId"), rs.getInt ("quantity"));

				demandList.add(demand);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs) ;
		}

		return demandList;
	}

}

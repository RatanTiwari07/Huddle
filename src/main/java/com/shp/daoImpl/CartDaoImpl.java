package com.shp.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shp.beans.CartBean;
import com.shp.beans.DemandBean;
import com.shp.beans.ProductBean;
import com.shp.dao.CartDao;
import com.shp.util.DbUtil;

public class CartDaoImpl implements CartDao {

	@Override
	public String addProductToCart(String userId, String prodId, int prodQty) {
		
		String status = "Failed to add into cart";
		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from usercart where prodid = ? and username = ?");   // 1

			ps.setString(1, prodId);
			ps.setString(2, userId);

			rs = ps.executeQuery();

			if (rs.next()) {

				int cartQty = rs.getInt("quantity");

				ProductBean product = new ProductDaoImpl().getProductDetails(prodId);

				int availQty = product.getProdQuantity();

				prodQty += cartQty;

				if (availQty < prodQty) {

					status = "only " + availQty + " no of " + product.getProdName() + " are available in the shop ! "
							+ "So we are adding only " + availQty + " no of " + product.getProdName()
							+ " into your cart " + "";

					DemandBean demandBean = new DemandBean(userId, product.getProdId(), prodQty - availQty);

					DemandDaoImpl demand = new DemandDaoImpl();

					boolean flag = demand.addProduct(demandBean);

					if (flag) {
						status += "<br/> We will mail you when " + product.getProdName()
								+ " will be available into the Store !";
					}

				} else {
					status = updateProductToCart(userId, prodId, prodQty);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(rs);
			DbUtil.closeConnection(ps);
		}

		return status;
	}

	@Override
	public List<CartBean> getAllCartItems(String userId) {

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		List<CartBean> items = new ArrayList<>();
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from usercart where username = ?");
			ps.setString(1, userId);

			rs = ps.executeQuery();

			while (rs.next()) {

				CartBean cart = new CartBean();

				cart.setProdId(rs.getString("prodid"));
				cart.setUserId(rs.getString("username"));
				cart.setQuantity(rs.getInt("quantity"));

				items.add(cart);
			}

			ps.close();
			rs.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return items;
	}

	@Override
	public int getCartCount(String userId) {

		int count = 0;
		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select sum(quantity) from usercart where username = ?");
			ps.setString(1, userId);

			rs = ps.executeQuery();

			if (rs.next() && !rs.wasNull()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return count;
	}

	@Override
	public String removeProductFromCart(String userId, String prodId) {

		String status = "Product removal failed ";
		ResultSet rs = null;
		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;

		try {

			ps = con.prepareStatement("Select * from usercart where username = ? and prodid = ?");

			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

				int prodQuantity = rs.getInt("quantity");

				prodQuantity -= 1;

				if (prodQuantity > 1) {

					ps2 = con.prepareStatement(
							"Update usercart set quantity = ? where" + " username = ? and prodid = ?");

					ps2.setInt(1, prodQuantity);
					ps2.setString(2, userId);
					ps2.setString(3, prodId);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product Succesfully removed from cart";

				} else if (prodQuantity <= 0) {

					ps2 = con.prepareStatement("Delete from usercart where " + "username = ? and prodid = ?");

					ps2.setString(1, userId);
					ps2.setString(2, prodId);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product succesfully removed form cart";
				}

			} else {

				status += " Product not available in cart";

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(rs);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(ps2);
		}

		return status;
	}

	@Override
	public boolean removeAProduct(String userId, String prodId) {

		boolean flag = false;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Delete from usercart where username = ? and prodId = ?");

			ps.setString(1, userId);
			ps.setString(2, prodId);

			int k = ps.executeUpdate();

			if (k > 0)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}

		return flag;
	}

	@Override
	public String updateProductToCart(String userId, String prodId, int prodQty) {

		String status = "Failed to add into cart";

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from usercart where username = ? and prodId =?");

			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

				if (prodQty > 0) {

					ps2 = con.prepareStatement(
							"Update usercart set quantity = ? where " + "username = ? and prodId = ?");
					ps2.setInt(1, prodQty);
					ps2.setString(2, userId);
					ps2.setString(3, prodId);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product succesfully updated to cart";
				} else if (prodQty == 0) {

					ps2 = con.prepareStatement("Delete from usercart where username = ? " + " and prodid = ?");
					ps2.setString(1, userId);
					ps2.setString(2, prodId);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product succesfully updated to cart";
				}

			} else {

				ps2 = con.prepareStatement("Insert into usercart values (?,?,?)");

				ps2.setString(1, userId);
				ps2.setString(2, prodId);
				ps2.setInt(3, prodQty);

				int k = ps2.executeUpdate();

				if (k > 0)
					status = "Product Succesfully updated to cart";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(ps2);
			DbUtil.closeConnection(rs);
		}

		return status;
	}

	@Override
	public int getProductCount(String userId, String prodId) {

		int count = 0;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select sum(quantity) from usercart where username = ? " + "and prodId = ?");
			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			if (rs.next() && !rs.wasNull()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return count;
	}

	@Override
	public int getCartItemsCount(String userId, String itemId) {
		int count = 0;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select quantity from usercart where username = ? " + "and prodId = ?");
			ps.setString(1, userId);
			ps.setString(2, itemId);

			rs = ps.executeQuery();

			if (rs.next() && !rs.wasNull()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return count;
	}

}

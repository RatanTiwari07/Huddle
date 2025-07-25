package com.shp.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shp.beans.CartBean;
import com.shp.beans.OrderBean;
import com.shp.beans.OrderDetails;
import com.shp.beans.TransactionBean;
import com.shp.dao.OrderDao;
import com.shp.util.DbUtil;
import com.shp.util.MailMessage;

public class OrderDaoImpl implements OrderDao {

	@Override
	public String paymentSuccess(String userName, double paidAmount) {

		String status = "Order Placement Failed";

		List<CartBean> cartItems = new ArrayList<>();
		cartItems = new CartDaoImpl().getAllCartItems(userName);

		System.out.println(cartItems.size());

		if (cartItems.size() == 0) {
			System.out.println("cart length is zero");
			return status;
		}

		TransactionBean transaction = new TransactionBean(userName, paidAmount);

		String transactionId = transaction.getTransactionId();

		boolean ordered = false;

		for (CartBean item : cartItems) {

			double amount = new ProductDaoImpl().getProductPrice(item.getProdId()) * item.getQuantity();

			OrderBean order = new OrderBean(transactionId, item.getProdId(), item.getQuantity(), amount);

			ordered = addOrder(order);

			System.out.println(ordered);

			if (!ordered)
				break;
			else {
				ordered = new CartDaoImpl().removeAProduct(item.getUserId(), item.getProdId());
				System.out.println(ordered);
			}

			if (!ordered)
				break;
			else {
				ordered = new ProductDaoImpl().sellNProduct(item.getProdId(), item.getQuantity());
				System.out.println(ordered);
			}
		}

		if (ordered) {

			ordered = new OrderDaoImpl().addTransaction(transaction);

			if (ordered) {

				status = "Order placed succesfully !";

				MailMessage.transactionSuccess(userName, new UserDaoImpl().getFName(userName), transactionId, transaction.getTransAmount());
			}

		}

		return status;
	}

	@Override
	public boolean addOrder(OrderBean order) {

		boolean flag = false;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Insert into orders values (?,?,?,?,?)");
																				//    1 
			ps.setString(1, order.getTransactionId());
			ps.setString(2, order.getProductId());
			ps.setInt(3, order.getQuantity());
			ps.setDouble(4, order.getAmount());
			ps.setInt(5, 0);

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
	public boolean addTransaction(TransactionBean transaction) {

		boolean flag = false;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
 
		try {

			ps = con.prepareStatement("insert into transactions values (?,?,?,?)");			//   2

			ps.setString(1, transaction.getTransactionId());
			ps.setString(2, transaction.getUserName());
			ps.setTimestamp(3, transaction.getTransDateTime());
			ps.setDouble(4, transaction.getTransAmount());

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
	public int countSoldItems(String prodId) {

		int count = 0;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select sum(quantity) from orders where prodId = ?");

			ps.setString(1, prodId);											//  3

			rs = ps.executeQuery();

			if (rs.next()) {

				count = rs.getInt(1);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(rs);
			DbUtil.closeConnection(ps);
		}

		return count;
	}

	@Override
	public List<OrderBean> getAllOrders() {

		List<OrderBean> products = new ArrayList<>();

		Connection con = DbUtil.provideConnection();
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Select * from orders");

			rs = ps.executeQuery();

			while (rs.next()) {

				OrderBean order = new OrderBean(rs.getString("orderId"), rs.getString("prodId"), rs.getInt("quantity"),
						rs.getDouble("amount"), rs.getInt("shipped"));

				products.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return products;
	}

	@Override
	public List<OrderBean> getAllShippedOrders () {

		List<OrderBean> products = new ArrayList<>();

		Connection con = DbUtil.provideConnection();
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Select * from orders  where shipped = 1 order by orderid desc");

			rs = ps.executeQuery();

			while (rs.next()) {

				OrderBean order = new OrderBean(rs.getString("orderId"), rs.getString("prodId"), rs.getInt("quantity"),
						rs.getDouble("amount"), rs.getInt("shipped"));

				products.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return products;

	}

	@Override
	public List<OrderBean> getAllUnshippedOrders () {

		List<OrderBean> products = new ArrayList<>();

		Connection con = DbUtil.provideConnection();
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Select * from orders  where shipped = 0");

			rs = ps.executeQuery();

			while (rs.next()) {

				OrderBean order = new OrderBean(rs.getString("orderId"), rs.getString("prodId"), rs.getInt("quantity"),
						rs.getDouble("amount"), rs.getInt("shipped"));

				products.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return products;

	}

	@Override
	public List<OrderBean> getOrdersByUserId(String emailId) {

		List<OrderBean> orderList = new ArrayList<>();

		Connection con = DbUtil.provideConnection();
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Select * from orders o inner join transaction t "
					+ "on  o.orderId = t.transId where username = ?");
			ps.setString(1,emailId);

			rs = ps.executeQuery ();

			while (rs.next()) {

				OrderBean order = new OrderBean (rs.getString("transid"), rs.getString("prodid"),
						rs.getInt ("quantity"), rs.getDouble("t.amount"), rs.getInt("shipped"));

				orderList.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(rs);
			DbUtil.closeConnection(ps);
		}

		return orderList;
	}

	@Override
	public List<OrderDetails> getAllOrderDetails(String userEmailId) {

		List<OrderDetails> orderList = new ArrayList<>();

		Connection con = DbUtil.provideConnection();
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Select p.pid as prodId, o.orderId as orderId, o.shipped as shipped, p.image as image, "
					+ " p.pname as pname, o.quantity as qty, o.amount as amount, t.time as time "
					+ " FROM orders o, product p, transactions t "
					+ " where o.orderId=t.transId and "
					+ " p.pid = o.prodid "
					+ " and t.username = ? ");

			System.out.println("Query Executed");

			ps.setString(1,userEmailId);

			rs = ps.executeQuery();

			while (rs.next()) {

				OrderDetails order =  new OrderDetails ();

				order.setOrderID(rs.getString("orderId"));
				order.setProductId(rs.getString("prodId"));
				order.setProdName(rs.getString("pname"));
				order.setQuantity(rs.getString("qty"));
				order.setAmount(rs.getString("amount"));
				order.setShipped(rs.getInt("shipped"));
				order.setTime(rs.getTimestamp("time"));
				order.setProdImage(rs.getAsciiStream("image"));

				orderList.add(order);
			}

 		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return orderList;

	}

	@Override
	public String shipNow(String orderId, String prodId) {

		String status = "FAILURE";

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Update orders set shipped = 1 where orderId = ? and prodId = ? and shipped = 0");
			ps.setString(1,orderId);
			ps.setString(2,prodId);

			int k = ps.executeUpdate();

			if (k > 0)
				status = "Order has been shipped succesfully";

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}

		return status;
	}

}

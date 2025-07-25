package com.shp.dao;

import java.util.List;

import com.shp.beans.OrderBean;
import com.shp.beans.OrderDetails;
import com.shp.beans.TransactionBean;

public interface OrderDao {

	public String paymentSuccess (String userName, double paidAmount);

	public boolean addOrder (OrderBean order);

	public boolean addTransaction (TransactionBean transaction);

	public int countSoldItems (String prodId);

	public List<OrderBean> getAllOrders ();

	public List<OrderBean> getAllShippedOrders();

	public List<OrderBean> getAllUnshippedOrders();

	public List<OrderBean> getOrdersByUserId (String emailId);

	public List<OrderDetails> getAllOrderDetails (String userEmailId);

	public String shipNow (String orderId, String prodId);
}

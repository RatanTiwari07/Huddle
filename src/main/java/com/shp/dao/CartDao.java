package com.shp.dao;

import java.util.List;

import com.shp.beans.CartBean;

public interface CartDao {

	public String addProductToCart (String userId, String prodId, int ProdQty);

	public List<CartBean> getAllCartItems (String userId);

	public int getCartCount (String userId);

	public String removeProductFromCart (String userId, String prodId );

	public boolean removeAProduct (String userId, String prodId);

	public String updateProductToCart (String userId, String prodId, int prodQty);

	public int getProductCount (String userId, String prodId);

	public int getCartItemsCount (String userId, String itemId);
}

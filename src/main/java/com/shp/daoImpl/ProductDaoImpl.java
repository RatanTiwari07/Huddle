package com.shp.daoImpl;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shp.beans.DemandBean;
import com.shp.beans.ProductBean;
import com.shp.dao.ProductDao;
import com.shp.util.DbUtil;
import com.shp.util.IdUtil;
import com.shp.util.MailMessage;

public class ProductDaoImpl implements ProductDao {

	@Override
	public String addProduct(String prodName, String prodType, String prodInfo, double productPrice, int prodQuantity,
			InputStream prodImage) {

		String prodId = IdUtil.generateId();

		ProductBean product = new ProductBean (prodId,prodName,prodType, prodInfo, productPrice, prodQuantity, prodImage);

		return addProduct (product);
	}

	@Override
	public String addProduct(ProductBean product) {

		String status = "Product Registration failed !";

		if (product.getProdId() == null)
			product.setProdId(IdUtil.generateId());

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("insert into product  values (?,?,?,?,?,?,?)");  // 1

			ps.setString(1, product.getProdId());
			ps.setString(2, product.getProdName());
			ps.setString(3, product.getProdType());
			ps.setString(4, product.getProdInfo());
			ps.setDouble(5, product.getProdPrice());
			ps.setInt(6, product.getProdQuantity());
			ps.setBlob(7, product.getProdImage());

			int k = ps.executeUpdate();

			if (k > 0)
				status = "Product updated succesfully with product id = " + product.getProdId();
			else
				status = "Product updation failed";

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}

		return status;
	}

	@Override
	public String removeProduct(String prodId) {

		String status = "Product removal failed";

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;

		try {

			ps = con.prepareStatement("Delete from product where pid = ?");    //  2
			ps.setString(1, prodId);

			int k = ps.executeUpdate();

			if (k > 0)
				status = "Product removed succesfully ";

				ps2 = con.prepareStatement("Delete from usercart where prodid = ?");

				ps2.setString(1, prodId);

				k = ps2.executeUpdate();

				if (k > 0)
					status += "from usercarts also";

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}

		return status;

	}

	@Override
	public String updateProduct(ProductBean prevProduct, ProductBean updatedProduct) {

		String status = "Product Updation Failed ";

		if (!(prevProduct.getProdId() == updatedProduct.getProdId()))
			return status += "Both products are different";

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Update product set pname=? , ptype=? , pinfo=? , pprice=? , pquantity=? , image=? "
					                + "where pid = ?");
			ps.setString(1, updatedProduct.getProdName());
			ps.setString(2, updatedProduct.getProdType());     // 3
			ps.setString(3, updatedProduct.getProdInfo());
			ps.setDouble(4, updatedProduct.getProdPrice());
			ps.setInt(5, updatedProduct.getProdQuantity());
			ps.setBlob(6, updatedProduct.getProdImage());
			ps.setString(7, prevProduct.getProdId());

			int k = ps.executeUpdate();

			if (k > 0)
				status = "Product Updated Succesfully";

		} catch (Exception e ) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}

		return status;
	}

	@Override
	public String updateProductPrice(String prodId, double updatedPrice) {

		String status = "Product Updation Failed ";

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Update product set pprice=? where pid = ?");

			ps.setDouble(1,updatedPrice);
			ps.setString(2, prodId);

			int k = ps.executeUpdate();

			if (k > 0)
				status = "Product Updated Succesfully";

		} catch (Exception e ) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}

		return status;
	}

	@Override
	public List<ProductBean> getAllProducts() {

		List<ProductBean> productsList = new ArrayList<>();

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from product");   // 3

			rs = ps.executeQuery();

			while (rs.next()) {

				ProductBean product = new ProductBean ();

				product.setProdId(rs.getString("pid"));
				product.setProdImage(rs.getAsciiStream("image"));
				product.setProdType(rs.getString("ptype"));
				product.setProdInfo(rs.getString("pinfo"));
				product.setProdPrice(rs.getDouble("pprice"));
				product.setProdQuantity(rs.getInt("pquantity"));
				product.setProdName(rs.getString("pname"));

				productsList.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return productsList;
	}

	@Override
	public List<ProductBean> getAllProductsByType(String type) {

		List<ProductBean> productsList = new ArrayList<>();

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from product where lower(ptype) like ?;");   // 4

			ps.setString(1, "%" + type + "%");

			rs = ps.executeQuery();

			while (rs.next()) {

				ProductBean product = new ProductBean ();

				product.setProdId(rs.getString("pid"));
				product.setProdImage(rs.getAsciiStream("image"));
				product.setProdType(rs.getString("ptype"));
				product.setProdInfo(rs.getString("pinfo"));
				product.setProdPrice(rs.getDouble("pprice"));
				product.setProdQuantity(rs.getInt("pquantity"));
				product.setProdName(rs.getString("pname"));

				productsList.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return productsList;
	}

	@Override
	public List<ProductBean> searchAllProducts(String search) {

		List<ProductBean> productsList = new ArrayList<>();

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from product where ptype like ? or pinfo like ? or pname like ?");
																							// 5 
			ps.setString(1, "%" + search + "%");
			ps.setString(2, "%" + search + "%");
			ps.setString(3, "%" + search + "%");

			rs = ps.executeQuery();

			while (rs.next()) {

				ProductBean product = new ProductBean ();

				product.setProdId(rs.getString("pid"));
				product.setProdImage(rs.getAsciiStream("image"));
				product.setProdType(rs.getString("ptype"));
				product.setProdInfo(rs.getString("pinfo"));
				product.setProdPrice(rs.getDouble("pprice"));
				product.setProdQuantity(rs.getInt("pquantity"));
				product.setProdName(rs.getString("pname"));

				productsList.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return productsList;
	}

	@Override
	public byte [] getImage(String prodId) {

		byte[] image = null;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select image from product where pid = ?");	//  6

			ps.setString(1, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

//				System.out.println(image.length());
				image = rs.getBytes("image");

//				System.out.println(image.length());

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return image;
	}

	@Override
	public ProductBean getProductDetails(String prodId) {

		ProductBean product = null;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from product where pid = ?");    //  7

			ps.setString(1, prodId);

			rs = ps.executeQuery();

			while (rs.next()) {

				product = new ProductBean ();

				product.setProdId(rs.getString("pid"));
				product.setProdImage(rs.getAsciiStream("image"));
				product.setProdType(rs.getString("ptype"));
				product.setProdInfo(rs.getString("pinfo"));
				product.setProdPrice(rs.getDouble("pprice"));
				product.setProdQuantity(rs.getInt("pquantity"));
				product.setProdName(rs.getString("pname"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return product;

	}

	@Override
	public String updateProductWithoutImage(String prevProductId, ProductBean updatedProduct) {

		boolean flag = false;
		String status = "Product Updation Failed ";

		if (!(prevProductId == updatedProduct.getProdId()))
			return status += "Both products are different ";

		ProductBean prevProduct = getProductDetails(prevProductId);

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Update product set pname=? , ptype=? , pinfo=? , pprice=? , pquantity=? where pid = ?");

			ps.setString(1, updatedProduct.getProdName());
			ps.setString(2, updatedProduct.getProdType());
			ps.setString(3, updatedProduct.getProdInfo());                    //  8
			ps.setDouble(4, updatedProduct.getProdPrice());
			ps.setInt(5, updatedProduct.getProdQuantity());
			ps.setString(6, prevProductId);

			int k = ps.executeUpdate();

			if ((k > 0) && (prevProduct.getProdQuantity() < updatedProduct.getProdQuantity())) {

				status += "Product updated succesfully ";

				List<DemandBean> demandList = new ArrayList<>();

				demandList = new DemandDaoImpl().haveDemanded(prevProductId);

				for (DemandBean demand : demandList) {

					String userFName = new UserDaoImpl().getFName(demand.getUserName());

					try {

						MailMessage.productAvailableNow(demand.getUserName(), userFName, updatedProduct.getProdName(),
																prevProductId);

					} catch (Exception e) {
						System.out.println("Mail sending failed + " + e.getMessage());
					}

					flag = new DemandDaoImpl().removeProduct(demand.getUserName(), prevProductId);
				}

				if (flag) {
					status += "And mail will be send to customers who are waiting for availability of this product";
				}

			} else if (k > 0) {

				status = "Product Updated Succesfully";

			} else {

				status = "Product is not available in the store";
			}

		} catch (Exception e ) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}

		return status;
	}

	@Override
	public double getProductPrice(String prodId) {

		double price = 0;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from product where pid = ?");

			ps.setString(1, prodId);

			rs = ps.executeQuery();

			if (rs.next())
				price = rs.getDouble("pprice");

 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			DbUtil.closeConnection(con);
 			DbUtil.closeConnection(ps);
 			DbUtil.closeConnection(rs);
 		}

		return price;

	}


	@Override
	public boolean sellNProduct(String prodId, int n) {

		boolean flag = false;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("Update product set pquantity = (pquantity - ?) where pid = ?");

			ps.setInt(1, n);															//  9
			ps.setString(2, prodId);

			int k = ps.executeUpdate();

			if ( k > 0)
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
	public int getProductQuantity(String prodId) {

		int qty = 0;

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("Select * from product where pid = ?");

			ps.setString(1, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

				qty = rs.getInt("pquantity");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return qty;
	}

}









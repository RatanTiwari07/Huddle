package com.shp.dao;

import java.util.List;

import com.shp.beans.DemandBean;

public interface DemandDao {

	public boolean addProduct (String userId, String prodId, int demandQty);

	public boolean removeProduct (String userId, String prodId);

	public boolean addProduct (DemandBean demand);

	public List<DemandBean> haveDemanded (String prodId);

}

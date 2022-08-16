package com.kh.campervalley.usedProduct.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.usedProduct.model.dto.ProductCategory;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;
import com.kh.campervalley.usedProduct.model.dto.WishProduct;

@Mapper
public interface UsedProductDao {

	int productInsert(UsedProduct usedProduct);

	int getProductNo();

	List<UsedProduct> getProductList(Map<String, Object> param);

	List<ProductCategory> cateList();

	List<UsedProduct> cateProductList(Map<String, Object> map);

	int cateProductCount(Map<String, Object> map);

	String cateName(String cateNo);

	void viewUpdate(String no);

	UsedProduct productDetail(String no);

	void updateUpHeart(UsedProduct usedProduct);

	int insertHeart(WishProduct wishProduct);

	UsedProduct getHeartCount(UsedProduct usedProduct);

	void updateDownHeart(UsedProduct usedProduct);

	int deleteHeart(WishProduct wishProduct);

	WishProduct findHeart(Map<String, Object> map);

}
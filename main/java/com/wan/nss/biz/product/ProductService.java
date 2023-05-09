package com.wan.nss.biz.product;

import java.util.ArrayList;

public interface ProductService {
	public ArrayList<ProductVO> selectAll(ProductVO pvo);
	public ProductVO selectOne(ProductVO pvo);
	public boolean insert(ProductVO pvo);
	public boolean update(ProductVO pvo);
	public boolean delete(ProductVO pvo);
}

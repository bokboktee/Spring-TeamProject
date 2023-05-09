package com.wan.nss.biz.product;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public ArrayList<ProductVO> selectAll(ProductVO pvo){
		return productDAO.selectAll(pvo);
	}
	@Override
	public ProductVO selectOne(ProductVO pvo) {
		return productDAO.selectOne(pvo);
	}
	@Override
	public boolean insert(ProductVO pvo) {
		return productDAO.insert(pvo);
	}
	@Override
	public boolean update(ProductVO pvo) {
		return productDAO.update(pvo);
	}
	@Override
	public boolean delete(ProductVO pvo) {
		return productDAO.delete(pvo);
	}
}

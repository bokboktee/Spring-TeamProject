package com.wan.nss.biz.orderdetail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService {
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;

	@Override
	public boolean insert(OrderDetailVO vo) {
		return orderDetailDAO.insert(vo);
	}
	
	@Override
	public List<OrderDetailVO> selectAll(OrderDetailVO vo) {
		return orderDetailDAO.selectAll(vo);
	}

	@Override
	public OrderDetailVO selectOne(OrderDetailVO vo) {
		return orderDetailDAO.selectOne(vo);
	}

}

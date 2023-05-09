package com.wan.nss.biz.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public boolean insert(OrderVO vo) {
		return orderDAO.insert(vo);
	}

	@Override
	public boolean delete(OrderVO vo) {
		return orderDAO.delete(vo);
	}
	
	@Override
	public List<OrderVO> selectAll(OrderVO vo) {
		return orderDAO.selectAll(vo);
	}

	@Override
	public OrderVO selectOne(OrderVO vo) {
		return orderDAO.selectOne(vo);
	}

}

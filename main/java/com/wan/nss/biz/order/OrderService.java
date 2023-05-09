package com.wan.nss.biz.order;

import java.util.List;

public interface OrderService {
	public boolean insert(OrderVO vo);
	public boolean delete(OrderVO vo);
	public List<OrderVO> selectAll(OrderVO vo);
	public OrderVO selectOne(OrderVO vo);
}

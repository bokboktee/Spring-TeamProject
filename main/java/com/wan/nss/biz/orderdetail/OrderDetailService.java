package com.wan.nss.biz.orderdetail;

import java.util.List;

public interface OrderDetailService {
	public boolean insert(OrderDetailVO vo);
	public List<OrderDetailVO> selectAll(OrderDetailVO vo);
	public OrderDetailVO selectOne(OrderDetailVO vo);
}

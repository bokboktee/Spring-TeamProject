package com.wan.nss.biz.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reviewService" )
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public ArrayList<ReviewVO> selectAll(ReviewVO rvo){
		return reviewDAO.selectAll(rvo);
	}
	@Override
	public boolean insert(ReviewVO rvo) {
		return reviewDAO.insert(rvo);
	}
	@Override
	public boolean delete(ReviewVO rvo) {
		return reviewDAO.delete(rvo);
	}
}

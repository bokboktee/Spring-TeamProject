package com.wan.nss.biz.review;

import java.util.ArrayList;

public interface ReviewService {
	public ArrayList<ReviewVO> selectAll(ReviewVO rvo);
	public boolean insert(ReviewVO rvo);
	public boolean delete(ReviewVO rvo);
}

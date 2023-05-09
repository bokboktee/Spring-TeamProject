package com.wan.nss.biz.blike;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("blikeService")
public class BlikeServiceImpl implements BlikeService {

	@Autowired
	BlikeDAO blikeDAO;

	@Override
	public boolean delete(BlikeVO vo) {
		return blikeDAO.delete(vo);
	}

	@Override
	public boolean insert(BlikeVO vo) {
		return blikeDAO.insert(vo);
	}

}

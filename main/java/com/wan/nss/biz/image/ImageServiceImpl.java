package com.wan.nss.biz.image;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ImageService")
public class ImageServiceImpl implements ImageService {
	
	@Autowired
	private ImageDAO imageDAO;
	
	@Override
	public ArrayList<ImageVO> selectAll(ImageVO pvo){
		return imageDAO.selectAll(pvo);
	}
	@Override
	public ImageVO selectOne(ImageVO pvo) {
		return imageDAO.selectOne(pvo);
	}
	@Override
	public boolean insert(ImageVO pvo) {
		return imageDAO.insert(pvo);
	}
//	@Override
//	public boolean update(ImageVO pvo) {
//		return imageDAO.update(pvo);
//	}
	@Override
	public boolean delete(ImageVO pvo) {
		return imageDAO.delete(pvo);
	}
}

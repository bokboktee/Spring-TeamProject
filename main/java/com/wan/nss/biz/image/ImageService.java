package com.wan.nss.biz.image;

import java.util.ArrayList;

public interface ImageService {
	public ArrayList<ImageVO> selectAll(ImageVO pvo);
	public ImageVO selectOne(ImageVO pvo);
	public boolean insert(ImageVO pvo);
//	public boolean update(ImageVO pvo);
	public boolean delete(ImageVO pvo);
}

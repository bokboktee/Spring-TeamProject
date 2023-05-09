package com.wan.nss.biz.image;

public class ImageVO {
	private int imageNum; // 이미지 PK
	private int targetNum; // 게시판 혹은 상품 데이터의 PK
	private int typeNum; // 이미지 사용하는 테이블 구분
	private String imageName; // 이미지 파일 이름

	public int getImageNum() {
		return imageNum;
	}

	public void setImageNum(int imageNum) {
		this.imageNum = imageNum;
	}

	public int getTargetNum() {
		return targetNum;
	}

	public void setTargetNum(int targetNum) {
		this.targetNum = targetNum;
	}

	public int getTypeNum() {
		return typeNum;
	}

	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	@Override
	public String toString() {
		return "ImageVO [targetNum=" + targetNum + ", imageNum=" + imageNum +  ", typeNum=" + typeNum + ", imageName="
				+ imageName + "]";
	}

}
package com.wan.nss.biz.blike;

public class BlikeVO {
	private int likeNum; // 좋아요 PK
	private int boardNum; // 글 번호
	private int userNum; // 좋아요 누른 회원의 회원 번호.
	private String upOrDown;

	public String getUpOrDown() {
		return upOrDown;
	}

	public void setUpOrDown(String upOrDown) {
		this.upOrDown = upOrDown;
	}

	// vo에만 존재하는 멤버변수
	private String userId; // 좋아요 누른 회원의 ID

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "BlikeVO [likeNum=" + likeNum + ", boardNum=" + boardNum + ", userNum=" + userNum + ", upOrDown=" + upOrDown + ", userId=" + userId
				+ "]";
	}

}

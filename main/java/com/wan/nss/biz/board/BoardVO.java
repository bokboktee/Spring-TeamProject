package com.wan.nss.biz.board;

import java.util.ArrayList;

public class BoardVO {
	private int boardNum; // 글 번호
	private int userNum; // 글 작성자 번호
	private String boardTitle; // 글 제목
	private String boardContent; // 글 내용
	private String boardDate; // 글 작성일
	private int boardStatus; // 글 상태 (0 : 정상, 1 : 신고, 2 : 삭제)
	private int boardView; // 조회수

	// vo에만 존재하는 멤버변수들
	private String userId; // 회원 id
	private int likeCnt; // 좋아요 수
	private String imageName; // 대표 이미지 이름
	private boolean isChecked; // 해당 회원이 좋아요 했으면 true, 아니면 false
	private int replyCnt; // 댓글 수
	private ArrayList<String> imageNames; // 이미지 이름들
	private String searchCondition; // 검색 카테고리
	private String searchContent; // 검색어
	private String catName; // top3 고양이 이름

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

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(int boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getBoardView() {
		return boardView;
	}

	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public boolean getIsChecked() {
		return isChecked;
	}

	public void setChecked(boolean isChecked) {
		this.isChecked = isChecked;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public ArrayList<String> getImageNames() {
		return imageNames;
	}

	public void setImageNames(ArrayList<String> imageNames) {
		this.imageNames = imageNames;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", userNum=" + userNum + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardDate=" + boardDate + ", boardStatus=" + boardStatus
				+ ", boardView=" + boardView + ", userId=" + userId + ", likeCnt=" + likeCnt + ", imageName="
				+ imageName + ", isChecked=" + isChecked + ", replyCnt=" + replyCnt + ", imageNames=" + imageNames
				+ ", searchCondition=" + searchCondition + ", searchContent=" + searchContent + ", catName=" + catName
				+ "]";
	}
	
}
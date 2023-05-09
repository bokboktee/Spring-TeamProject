package com.wan.nss.biz.product;

public class ProductVO {
	private int pNum; // 상품 번호
	private String pName; // 상품이름
	private String category; // 상품 카테고리
	private int price; // 가격
	private int pAmt; // 재고
	private String pDetail; // 상품 상세 설명
	private int pDcPercent; // 할인율

	private int searchLowPrice; // 가격 슬라이더 : 최소 가격
	private int searchHighPrice; // 가격 슬라이더 : 최대 가격
	private int total; // 구매 총액
	private int dc_price; // 할인 가격
	private int pCnt; // 장바구니용 임시 cnt
	private String pSearchCondition; // 검색 카테고리
	private String pSearchContent; // 검색어
	private String sort; // 정렬 기준 구분 하기 위해 사용
	private String imageName; // 대표 이미지
	private String imageName2; // 상세 이미지

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getpAmt() {
		return pAmt;
	}

	public void setpAmt(int pAmt) {
		this.pAmt = pAmt;
	}

	public String getpDetail() {
		return pDetail;
	}

	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}

	public int getpDcPercent() {
		return pDcPercent;
	}

	public void setpDcPercent(int pDcPercent) {
		this.pDcPercent = pDcPercent;
	}

	public int getSearchLowPrice() {
		return searchLowPrice;
	}

	public void setSearchLowPrice(int searchLowPrice) {
		this.searchLowPrice = searchLowPrice;
	}

	public int getSearchHighPrice() {
		return searchHighPrice;
	}

	public void setSearchHighPrice(int searchHighPrice) {
		this.searchHighPrice = searchHighPrice;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getDc_price() {
		return dc_price;
	}

	public void setDc_price(int dc_price) {
		this.dc_price = dc_price;
	}

	public int getpCnt() {
		return pCnt;
	}

	public void setpCnt(int pCnt) {
		this.pCnt = pCnt;
	}

	public String getpSearchCondition() {
		return pSearchCondition;
	}

	public void setpSearchCondition(String pSearchCondition) {
		this.pSearchCondition = pSearchCondition;
	}

	public String getpSearchContent() {
		return pSearchContent;
	}

	public void setpSearchContent(String pSearchContent) {
		this.pSearchContent = pSearchContent;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImageName2() {
		return imageName2;
	}

	public void setImageName2(String imageName2) {
		this.imageName2 = imageName2;
	}

	@Override
	public String toString() {
		return "ProductVO [pNum=" + pNum + ", pName=" + pName + ", category=" + category + ", price=" + price
				+ ", pAmt=" + pAmt + ", pDetail=" + pDetail + ", pDcPercent=" + pDcPercent + ", searchLowPrice="
				+ searchLowPrice + ", searchHighPrice=" + searchHighPrice + ", total=" + total + ", dc_price="
				+ dc_price + ", pCnt=" + pCnt + ", pSearchCondition=" + pSearchCondition + ", pSearchContent="
				+ pSearchContent + ", sort=" + sort + ", imageName=" + imageName + ", imageName2=" + imageName2 + "]";
	}
}
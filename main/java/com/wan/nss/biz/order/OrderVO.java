package com.wan.nss.biz.order;

public class OrderVO {
	private int oNum; // 주문 번호
	private int userNum; // 주문자 회원 번호
	private String oDate; // 주문 날짜
	private String rcvName; // 수령인 이름
	private String rcvPhoneNum; // 수령인 핸드폰 번호
	private String rcvAddress; // 수령인 주소
	private String oPay; // 결제방법
	
	private int oPrice; // 주문 당 총 결제 금액
	private String oSearchCondition;  // 주문 내역 검색
	private String userId; // 회원 아이디
	
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}

	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public String getRcvName() {
		return rcvName;
	}
	public void setRcvName(String rcvName) {
		this.rcvName = rcvName;
	}
	public String getRcvPhoneNum() {
		return rcvPhoneNum;
	}
	public void setRcvPhoneNum(String rcvPhoneNum) {
		this.rcvPhoneNum = rcvPhoneNum;
	}
	public String getRcvAddress() {
		return rcvAddress;
	}
	public void setRcvAddress(String rcvAddress) {
		this.rcvAddress = rcvAddress;
	}
	public String getoPay() {
		return oPay;
	}
	public void setoPay(String oPay) {
		this.oPay = oPay;
	}
	public int getoPrice() {
		return oPrice;
	}
	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}
	public String getoSearchCondition() {
		return oSearchCondition;
	}
	public void setoSearchCondition(String oSearchCondition) {
		this.oSearchCondition = oSearchCondition;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "OrderVO [oNum=" + oNum + ", userNum=" + userNum + ", oDate=" + oDate + ", rcvName=" + rcvName
				+ ", rcvPhoneNum=" + rcvPhoneNum + ", rcvAddress=" + rcvAddress + ", oPay=" + oPay + ", oPrice="
				+ oPrice + ", oSearchCondition=" + oSearchCondition + ", userId=" + userId + "]";
	}

	
	
}
package com.wan.nss.biz.sms;

public class SmsVO {
	private String phoneNum; // 사용자 전화번호
	private String randNum; // 랜덤인증번호
	private String checkNum; // 사용자가 입력한 번호

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getRandNum() {
		return randNum;
	}

	public void setRandNum(String randNum) {
		this.randNum = randNum;
	}

	public String getCheckNum() {
		return checkNum;
	}

	public void setCheckNum(String checkNum) {
		this.checkNum = checkNum;
	}

	@Override
	public String toString() {
		return "SmsVO [phoneNum=" + phoneNum + ", randNum=" + randNum + ", checkNum=" + checkNum + "]";
	}
}

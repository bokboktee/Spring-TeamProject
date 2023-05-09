package com.wan.nss.biz.sms;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository("smsDAO")
public class SmsDAO {

	// 문자 전송 메서드
	public int sms(SmsVO svo) {
		int randomNum = (int) (Math.random() * (89999)) + 10000; // 인증번호는 5자리 랜덤 숫자
		
		String api_key = "NCSSQY674X4XMFAJ"; // 발급받은 api_key
		String api_secret = "HDZVQDOTUZ8IFBCWZQACLEDDG4HLITRN"; // 발급받은 api_secret
		
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("to", svo.getPhoneNum()); // 수신번호(문자 받을 사람)
		params.put("from", "01065851164"); // 발신번호(CoolSms에 등록된 번호와 동일해야 함)
		params.put("type", "sms"); // 문자 타입
		params.put("text", "[냥신사] 본인 인증 번호는 \n" + randomNum + " 입니다."); // 문자 내용
		params.put("app_version", "test app 1.2"); 
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params); // 보내기&전송결과받기
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		return randomNum; // 인증번호 리턴
	}
}

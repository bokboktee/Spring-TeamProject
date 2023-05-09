package com.wan.nss.biz.sms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("smsService")
public class SmsServiceImpl implements SmsService {
	
	@Autowired
	private SmsDAO smsDAO;

	@Override
	public int sms(SmsVO svo) {
		return smsDAO.sms(svo);
	}
	

}

package com.wan.nss.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class LogAdvice { // Advice : 횡단관심(공통로직)	
//	@Before("PointcutCommon.aPointcut()")
//	public void controllerPrintLog(JoinPoint jp) {
//		System.out.println("[Service 메서드 실행 전 로그] " + jp.getTarget() + "." + jp.getSignature().getName() + "() 진입 예정");
//	}
}
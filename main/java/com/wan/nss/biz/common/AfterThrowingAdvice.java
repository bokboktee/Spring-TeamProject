package com.wan.nss.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterThrowingAdvice {
	@AfterThrowing(pointcut="PointcutCommon.aPointcut()", throwing="excepObj")
	public void printLogATA(JoinPoint jp, Exception excepObj) {
	
		System.out.println("[Service 메서드 예외 로그] "+jp.getSignature().getName()+" 비즈니스 메서드를 수행하던중 "+excepObj.getMessage()+" 예외발생");
	}
}

package com.wan.nss.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	@Pointcut("execution(* com.wan.nss.biz..*Impl.*(..))")
	public void aPointcut() {} // 포인트컷 선언
}
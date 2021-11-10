package com.khbill.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);
	
	@Before("within(com.khbill.controller.*)")
	public void logBefore(JoinPoint joinPoint) {	//joinPoint: 현재 실행되고 있는 정보가 들어있는 곳을 이름을 반환해준다
//		logger.info("----- BEFORE -----");
		logger.debug("----- START -----");
		logger.debug("[class] {}", joinPoint.getTarget().getClass());
		logger.debug("[method] {}", joinPoint.getSignature().getName() + "()");
		
	}

	@After("within(com.khbill.controller.*)")
	public void logAfter() {
//		logger.info("----- AFTER -----");
		logger.debug("----- END -----");
	}
	
	@Around("within(com.khbill.service..*)")
	public Object logAround(ProceedingJoinPoint joinPoint) {	//ProceedingJoinPoint:  
		
		//실행 전 시간 체크 - @Before
		long beforeTime = System.currentTimeMillis();

		//메소드 실행- 기능이 실행되는 곳
		Object obj = null;
		try {
			//서비스 메소드 실행
			obj = joinPoint.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	
		//실행 후 시간 체크 - @After
		long afterTime = System.currentTimeMillis();

		logger.info("[소요시간]{}ms", afterTime-beforeTime);
		
		return obj;
	}
}

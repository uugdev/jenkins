package com.khbill.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class UserInterceptor implements HandlerInterceptor {
	
	private static final Logger logger = LoggerFactory.getLogger(UserInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if( null == session.getAttribute("login") ) { //비로그인 상태
//			String referer = request.getHeader("referer").substring(21);
//			logger.info("interceptor referer : {}", referer);
//			session.setAttribute("referer", referer);
			request.getRequestDispatcher("/WEB-INF/views/layout/userError.jsp").forward(request, response);
			return false;
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}
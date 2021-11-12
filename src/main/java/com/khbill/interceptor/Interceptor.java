package com.khbill.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class Interceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if( null == session.getAttribute("login") ) { //비로그인 상태
			response.sendRedirect("/layout/error");
			
			return false;
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}
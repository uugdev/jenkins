package com.khbill.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khbill.dto.User;
import com.khbill.service.face.MemberService;


@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService memberService;
	
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login( ) {	}

	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProc(User user, HttpSession session ) {
//		logger.info("{}", user);
//		logger.info("member login post");
		boolean login = memberService.isLogin(user);
		
		//임시 로그인
		if( login == true ) {
			logger.info("Login Successed");
			
			User userInfo = memberService.getUserInfo(user);
			session.setAttribute("login", true);
			session.setAttribute("userNick", userInfo.getUserNick());
			session.setAttribute("userNo", userInfo.getUserNo());
			
			return "/main";
		} else {
			//
			logger.info("Login Failed");
			session.invalidate();
			return "/main";
		}
		
	}
	
	
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session ) {
		logger.info("/member/logout");
		session.invalidate();
		return "/main";
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join( ) {	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinProc(User user) {
//		logger.info("/member/join [POST]");
//		logger.info("{}", user);
		
		boolean join = memberService.checkInfo(user);
		
		if( join == true) {
			memberService.join(user);
			return "member/login";
		} else {
			logger.info("JOIN failed");
			return "/main";
		}
		
		
	}
	
}

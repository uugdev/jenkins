package com.khbill.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khbill.dto.Admin;
import com.khbill.dto.User;
import com.khbill.service.face.AdminLoginService;

@Controller
public class AdminLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	@Autowired AdminLoginService adminLoginService;

	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public void login() {	}
	
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	public String loginProc(Admin admin, HttpSession session ) {
		boolean login = adminLoginService.isLogin(admin);

		if( login == true ) {
			logger.info("Admin Login Successed");
			
			Admin adminInfo = adminLoginService.getAdminInfo(admin);
			session.setAttribute("adminLogin", true);
			session.setAttribute("adminNick", adminInfo.getAdminNick());
			session.setAttribute("adminNo", adminInfo.getAdminNo());
			
			return "redirect:/admin/user/list";
		} else {
			//
			logger.info("Admin Login Failed");
			session.invalidate();
			return "redirect:/admin/login";
		}
		
	}
	
	@RequestMapping(value="/admin/logout")
	public String logout(HttpSession session ) {
		session.invalidate();
		return "redirect:/admin/login";
	}
}

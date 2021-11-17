package com.khbill.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khbill.service.face.AccountService;

@Controller
public class AccountController {

	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	
	@Autowired
	AccountService accountService;
	
	@RequestMapping(value = "/account/main", method = RequestMethod.GET)
	public void accountMain() {
		logger.info("/account/main [GET]");
		
		
		
		
		
	
	}
	
	
	
	
}

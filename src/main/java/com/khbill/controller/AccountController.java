package com.khbill.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {

	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	
	@RequestMapping(value = "/account/main", method = RequestMethod.GET)
	public void accountMail() {
		logger.info("/account/main [GET]");
	}
	
	
	
	
}

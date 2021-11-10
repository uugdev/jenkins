package com.khbill.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/main")
	public void main() {
		logger.info("메인 테스트");
		logger.debug("메인 테스트 디버그");
		logger.info("파이널 테스트");
		System.out.println("하이");
	}
	
}

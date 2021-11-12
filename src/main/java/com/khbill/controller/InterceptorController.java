package com.khbill.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InterceptorController {

	@RequestMapping(value="/layout/error")
	public void errorPage() {	}
}

package com.khbill.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khbill.dto.Ask;
import com.khbill.dto.User;
import com.khbill.service.face.AdminAskService;
import com.khbill.util.Paging;

@Controller
@RequestMapping(value = "/admin/ask")
public class AdminAskController {

	private static final Logger logger = LoggerFactory.getLogger(AskController.class);
	
	@Autowired
	AdminAskService adminAskService;
	
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void adminAskList(Paging paramData, Model model) {
		logger.info("/admin/ask/list [GET]");
		
		Paging paging = adminAskService.getPaging(paramData);
		List<Ask> list = adminAskService.getAskList(paging);
		List<User> user = adminAskService.getUserList();
		
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	
	}
	
	
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public void adminAskDetail() {
		logger.info("/admin/ask/detail [GET]");
		
	}
	
	@RequestMapping(value = "/delete")
	public String adminAskDelete(int[] askNo) {
		logger.info("/admin/ask/delete");
		
		int size = askNo.length;
		for(int i=0; i<size; i++) {
			
			adminAskService.setAskComDelete(askNo[i]);
			adminAskService.setAskDelete(askNo[i]);
			
		}
		
		
		return "redirect:/admin/ask/list";
		
	}
	
	
	
	
}//class

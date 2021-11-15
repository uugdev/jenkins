package com.khbill.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.khbill.dto.User;
import com.khbill.service.face.AdminUserService;
import com.khbill.util.Paging;


@Controller
public class AdminUserController {

	private static final Logger logger = LoggerFactory.getLogger(AdminUserController.class);
	@Autowired AdminUserService adminUserService;
	
	@RequestMapping(value="admin/user/list")
	public void userList(Paging paramData, Model model) {
		//페이징 계산
		Paging paging = adminUserService.getPaging( paramData );
		
		//게시글 목록 조회		
		List<User> userList = adminUserService.getUserlist(paging);
		
//		logger.info("list : {}", userList);
		
		model.addAttribute("userList", userList);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/admin/user/delete")
	public String userDelete(int[] userNo) {
		int size = userNo.length;
		for(int i=0 ; i<size ; i++) {
			adminUserService.setUserDelete(userNo[i]);
		}
		return "redirect:/admin/user/list";
	}
}

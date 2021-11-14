package com.khbill.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khbill.dto.Notice;
import com.khbill.service.face.AdminNoticeService;
import com.khbill.util.Paging;

@Controller
public class AdminNoticeController {

	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	@Autowired AdminNoticeService adminNoticeService;
	
	@RequestMapping(value="/admin/notice/list")
	public void noticeList(Paging paramData, Model model) {
		Paging paging = adminNoticeService.getPaging(paramData);
		List<Notice> list = adminNoticeService.getNoticeList(paging);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
}

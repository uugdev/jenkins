package com.khbill.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khbill.dto.Notice;
import com.khbill.service.face.NoticeService;
import com.khbill.util.Paging;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired private NoticeService noticeService;
	
	@RequestMapping(value="/notice/list")
	public void noticeList(Paging paramData, Model model) {
		logger.info("/notice/list [GET]");
		
		//페이징 계산
		Paging paging = noticeService.getPaging(paramData);
		logger.info("{} : ", paging);
		
		//공지사항 목록 조회
		List<Notice> list = noticeService.getNoticeList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value="/notice/detail")
	public String noticeDetail(Notice notice, Model model, HttpSession session) {
		logger.info("/notice/detail [GET]");
		
		if(notice.getNoticeNo() < 1 ) {
			return "redirect:/noptice/list";
		}
		
		notice = noticeService.getNoticeDetail(notice);
		logger.info("공지사항 상세 정보 {} : ", notice);
		
		model.addAttribute("notice", notice);
		
		return "notice/detail";
	}
	
}

package com.khbill.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="/admin/notice/detail")
	public void noticeDetail(int noticeNo, Model model) {
		Notice notice = adminNoticeService.getNoticeDetail(noticeNo);
		String adminNick = adminNoticeService.getAdminNick(notice.getAdminNo());
		
		model.addAttribute("notice", notice);
		model.addAttribute("adminNick", adminNick);
	}
	
	@RequestMapping(value="/admin/notice/write", method=RequestMethod.GET)
	public void noticeWrite() {	}
	
	@RequestMapping(value="/admin/notice/write", method=RequestMethod.POST)
	public String noticeWriteProc(Notice notice) {
//		logger.info("writeProc() : {}", notice);
		adminNoticeService.setNoticeWrite(notice);
		return "redirect:/admin/notice/detail?noticeNo="+notice.getNoticeNo();
	}
	
	@RequestMapping(value="/admin/notice/update", method=RequestMethod.GET)
	public void noticeUpdate(int noticeNo, Model model) {
		Notice notice = adminNoticeService.getNoticeDetail(noticeNo);
		
		model.addAttribute("notice", notice);
	}
	
	@RequestMapping(value="/admin/notice/update", method=RequestMethod.POST)
	public String noticeUpdateProc(Notice notice) {
//		logger.info("notice Update : {}", notice);
		adminNoticeService.setNoticeUpdate(notice);
		return "redirect:/admin/notice/detail?noticeNo="+notice.getNoticeNo();
	}
	
	@RequestMapping(value="/admin/notice/delete")
	public String noticeDelete(int noticeNo) {
		adminNoticeService.setNoticeDelete(noticeNo);
		return "redirect:/admin/notice/list";
	}
}

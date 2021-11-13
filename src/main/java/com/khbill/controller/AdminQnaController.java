package com.khbill.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khbill.dto.Qna;
import com.khbill.dto.QnaComment;
import com.khbill.service.face.AdminQnaService;
import com.khbill.util.Paging;

@Controller
public class AdminQnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminQnaController.class);
	@Autowired AdminQnaService adminQnaService;

	@RequestMapping(value="/admin/qna/list")
	public void qnaList(Paging paramData, Model model) {
		Paging paging = adminQnaService.getPaging(paramData);
		List<Qna> list = adminQnaService.getQnaList(paging);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}
	
	@RequestMapping(value="/admin/qna/detail")
	public void qnaDetail(int qnaNo, Model model) {
		Qna qna = adminQnaService.getQnaDetail(qnaNo);
		String nick = adminQnaService.getNickByUserNo(qna.getUserNo());
		QnaComment qnaComment = adminQnaService.getQnaComment(qnaNo);
		
		model.addAttribute("qna", qna);
		model.addAttribute("nick", nick);
		model.addAttribute("qnaComment", qnaComment);
	}
	
	@RequestMapping(value="/admin/qna/delete")
	public String qnaDelete(int[] qnaNo) {
//		logger.info("qnaNo[] : {}", qnaNo);
		int size = qnaNo.length;
		for(int i=0 ; i<size ; i++) {
			adminQnaService.setQnaDelete(qnaNo[i]);
		}
		return "redirect:/admin/qna/list";
	}
}

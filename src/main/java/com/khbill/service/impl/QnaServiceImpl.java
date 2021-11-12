package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.QnaDao;
import com.khbill.dto.Qna;
import com.khbill.dto.QnaComment;
import com.khbill.service.face.QnaService;
import com.khbill.util.Paging;

@Service
public class QnaServiceImpl implements QnaService {

	private static final Logger logger = LoggerFactory.getLogger(QnaServiceImpl.class);
	
	@Autowired QnaDao qnaDao;
	
	@Override
	public List<Qna> getQnaList(HashMap<String, Object> map) {
		return qnaDao.selectQnaListByUserNo(map);
	}

	@Override
	public Paging getPaging(Paging paramData, int userNo) {
		
		//총 게시글 수 조회
		int totalCount = qnaDao.selectCntAll(userNo);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}

	@Override
	public Qna getQnaDetail(int qnaNo) {
		return qnaDao.selectQnaDetailByQnaNo(qnaNo);
	}

	@Override
	public QnaComment getQnaComment(int qnaNo) {
		return qnaDao.selectQnaCommentByQnaNo(qnaNo);
	}

	@Override
	public void setQnaWrite(Qna qna) {
		qnaDao.insertQna(qna);
	}

	@Override
	public void setQnaUpdate(Qna qna) {
		qnaDao.updateQna(qna);
	}

	@Override
	public void setQnaDelete(int qnaNo) {
		qnaDao.deleteQnaComment(qnaNo);
		qnaDao.deleteQna(qnaNo);
	}

}

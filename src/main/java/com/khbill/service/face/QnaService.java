package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Qna;
import com.khbill.dto.QnaComment;
import com.khbill.util.Paging;

public interface QnaService {

	/**
	 * 
	 * @param paramData
	 * @return
	 */
	public Paging getPaging(Paging paramData, int userNo);

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<Qna> getQnaList(HashMap<String, Object> map);

	/**
	 * 
	 * @param qnaNo
	 * @return
	 */
	public Qna getQnaDetail(int qnaNo);

	/**
	 * 
	 * @param qnaNo
	 * @return
	 */
	public QnaComment getQnaComment(int qnaNo);

	/**
	 * 
	 * @param qna
	 */
	public void setQnaWrite(Qna qna);

}

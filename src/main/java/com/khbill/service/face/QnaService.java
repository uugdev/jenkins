package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Qna;
import com.khbill.dto.QnaComment;
import com.khbill.util.Paging;

public interface QnaService {

	/**
	 * 페이징 정보 얻기
	 * 
	 * @param paramData
	 * @return Paging
	 */
	public Paging getPaging(Paging paramData, int userNo);

	/**
	 * 페이징과 회원 번호로 해당 회원의 문의 목록 조회
	 * 
	 * @param map - 페이징, 회원 번호
	 * @return List<Qna>
	 */
	public List<Qna> getQnaList(HashMap<String, Object> map);

	/**
	 * 문의글 번호로 문의 상세 정보 불러오기
	 * 
	 * @param qnaNo - 문의글 번호
	 * @return Qna
	 */
	public Qna getQnaDetail(int qnaNo);

	/**
	 * 문의글 번호로 해당 문의글 답변 불러오기
	 * 
	 * @param qnaNo - 문의글 번호
	 * @return QnaComment
	 */
	public QnaComment getQnaComment(int qnaNo);

	/**
	 * 문의글 작성하기
	 * 
	 * @param qna - 문의글 작성 정보
	 */
	public void setQnaWrite(Qna qna);

}

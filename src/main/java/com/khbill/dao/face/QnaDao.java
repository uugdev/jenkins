package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Qna;
import com.khbill.dto.QnaComment;

public interface QnaDao {

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<Qna> selectQnaListByUserNo(HashMap<String, Object> map);

	/**
	 * 전체 게시글 수 조회
	 * 
	 * @param userNo
	 * @return
	 */
	public int selectCntAll(int userNo);

	/**
	 * 
	 * @param qnaNo
	 * @return
	 */
	public Qna selectQnaDetailByQnaNo(int qnaNo);

	/**
	 * 
	 * @param qnaNo
	 * @return
	 */
	public QnaComment selectQnaCommentByQnaNo(int qnaNo);

}

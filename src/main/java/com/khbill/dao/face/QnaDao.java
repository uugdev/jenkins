package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Qna;
import com.khbill.dto.QnaComment;

public interface QnaDao {

	/**
	 * 회원 번호로 회원이 작성한 문의 목록 페이징과 함께 불러오기
	 * 
	 * @param map - 페이징, 회원 번호
	 * @return List<Qna>
	 */
	public List<Qna> selectQnaListByUserNo(HashMap<String, Object> map);

	/**
	 * 페이징을 위한 전체 게시글 수 조회
	 * 
	 * @param userNo - 회원 번호
	 * @return int totalCount
	 */
	public int selectCntAll(int userNo);

	/**
	 * 문의글 번호로 해당 문의글 전체 정보 불러오기
	 * 
	 * @param qnaNo - 문의글 번호
	 * @return Qna
	 */
	public Qna selectQnaDetailByQnaNo(int qnaNo);

	/**
	 * 문의글 번호로 해당 문의글의 댓글 불러오기
	 * 
	 * @param qnaNo - 문의글 번호
	 * @return QnaComment
	 */
	public QnaComment selectQnaCommentByQnaNo(int qnaNo);

	/**
	 * 문의글 작성하기
	 * 
	 * @param qna - 문의글 작성 정보
	 */
	public void insertQna(Qna qna);

}

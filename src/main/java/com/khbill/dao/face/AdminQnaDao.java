package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Qna;
import com.khbill.dto.QnaComment;
import com.khbill.util.Paging;

public interface AdminQnaDao {

	/**
	 * 전체 게시글 수 조회
	 * 
	 * @return int
	 */
	public int selectCntAll();

	/**
	 * 문의 게시글 목록 조회
	 * 
	 * @param paging - 페이징
	 * @return List<Qna>
	 */
	public List<Qna> selectQnaList(Paging paging);

	/**
	 * 문의 게시글 상세 조회
	 * 
	 * @param qnaNo - 문의글 번호
	 * @return Qna
	 */
	public Qna selectQnaDetail(int qnaNo);

	/**
	 * 문의 게시글 답변 조회
	 * 
	 * @param qnaNo - 문의글 번호
	 * @return QnaComment
	 */
	public QnaComment selectQnaComment(int qnaNo);

	/**
	 * 닉네임 불렁
	 * @param userNo - 유저번호
	 * @return 닉네임이겠지..
	 */
	public String selectNickByUserNo(int userNo);

	/**
	 * 문의글 삭제
	 * @param i - 문의글 번호
	 */
	public void deleteQna(int i);

	/**
	 * 문의글 답변 작성
	 * 
	 * @param qnaComment - 답변 정보
	 */
	public void insertQnaComment(QnaComment qnaComment);

	/**
	 * 답변 작성 후 문의글 답변 여부 y로 변경
	 * 
	 * @param qnaNo - 문의글 번호
	 */
	public void updateQnaStatusToY(int qnaNo);

	/**
	 * 문의글 답변 수정
	 * 
	 * @param qnaComment - 답변 정보
	 */
	public void updateQnaComment(QnaComment qnaComment);

	/**
	 * 문의글 답변 삭제
	 * 
	 * @param qnaNo - 문의글 번호
	 */
	public void deleteQnaComment(int qnaNo);

	/**
	 * 답변 삭제 후 문의글 답변 여부 n으로 변경
	 * 
	 * @param qnaNo - 문의글 번호
	 */
	public void updateQnaStatusToN(int qnaNo);

	public List<Qna> selectQnaListStatus(Paging paging);


}

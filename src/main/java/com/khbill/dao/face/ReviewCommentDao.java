package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;

public interface ReviewCommentDao {

	/**
	 * 댓글 목록을 조회한다
	 * 
	 * @param review - 댓글조회 대상 게시글 정보
	 * @return 조회된 댓글 목록
	 */
	public List<ReviewComment> selectReviewCommentByReview(Review review);

	/**
	 * 신규 댓글 삽입
	 * 
	 * @param reviewComment - 삽입하려는 댓글 정보
	 */
	public void insertReviewComment(ReviewComment reviewComment);
	
	/**
	 * 댓글 삭제
	 * 
	 * @param reviewComment - 삭제하려는 댓글 정보
	 */
	public void deleteReviewComment(ReviewComment reviewComment);

	
	/**
	 * 댓글 수 구하기
	 * 
	 * @param reviewComment - 게시글에 작성된 댓글 개수 구하기
	 * @return 댓글 개수
	 */
	public int selectCountComment(ReviewComment reviewComment);

}

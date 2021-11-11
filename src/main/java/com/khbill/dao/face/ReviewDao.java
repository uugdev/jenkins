package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Review;
import com.khbill.util.Paging;

public interface ReviewDao {

	/**
	 * 페이징을 적용하여 후기게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Review> selectReviewList(Paging paging);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param detailReview - 게시글 번호 객체
	 */
	public void updatehit(Review detailReview);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param detailReview- 조회하려는 게시글의 글 번호 객체
	 * @return 조회된 게시글 정보
	 */
	public Review selectReviewByReviewNo(Review detailReview);

}

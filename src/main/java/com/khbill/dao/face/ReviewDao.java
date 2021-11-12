package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.util.Paging;

public interface ReviewDao {

	/**
	 * 페이징을 적용하여 후기게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param map  - 페이징, 회원 번호
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Review> selectReviewList(Paging paging);

	/**
	 * 페이징을 위한 전체 게시글 수 조회
	 * 
	 * @return  int totalCount
	 */
	public int selectCntAll(Paging paging);

	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param detailReview - 게시글 번호 객체
	 */
	public void updatehit(Review detailReview);
	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param detailReview - 조회하려는 게시글의 글 번호 객체
	 * @return 조회된 게시글 정보
	 */
	public Review selectReviewByReviewNo(Review detailReview);

	/**
	 * 상품번호로 상품조회
	 * 
	 * @param itemNo
	 * @return
	 */
	public Item selectItemByItemNo(int itemNo);

	/**
	 * 파일번호로 파일조회
	 * 
	 * @param fileNo
	 * @return
	 */
	public File selectFileByFileNo(int fileNo);

}

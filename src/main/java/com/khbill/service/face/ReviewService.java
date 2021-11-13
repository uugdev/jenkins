package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.util.Paging;

public interface ReviewService {
	
	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 페이징이 적용된 후기 게시글 목록 조회
	 * 
	 * @param paging -  페이징 정보 객체
	 * @return List<Review>
	 */
	public List<Review> getReviewList(Paging paging);
	
	//---detail 페이지 -------------------------------
	
	/**
	 * 후기 게시글 상세보기
	 * 
	 * @param detailReview - 상세 조회할 게시글 번호 DTO
	 * @return 조회된 상세 게시글 정보
	 */
	public HashMap<String, Object> getReviewDetail(Review review);
	
	/**
	 *  후기 글번호롤 상품조회
	 * 
	 * @param itemNo - 상세 조회할 상품 번호 DTO
	 * @return 조회된 상세 게시글 정보
	 */
	public Item getReviewItem(int itemNo);

	/**
	 * 후기 글의 파일번호로 파일조회
	 * 
	 * @param fileNo - 상세 조회할 파일 번호 DTO
	 * @return 조회된 상세 게시글 정보
	 */
	public File getReviewFile(int fileNo);


}

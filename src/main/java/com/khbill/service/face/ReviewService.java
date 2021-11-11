package com.khbill.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.User;
import com.khbill.util.Paging;

public interface ReviewService {
	
	/**
	 * 페이징이 적용된 후기 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Review> getReviewList(Paging paging);

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
	 * 게시글 상세보기
	 * 
	 * @param detailReview - 상세 조회할 게시글 번호 DTO
	 * @return 조회된 상세 게시글 정보
	 */
	public Review getReviewDetail(Review detailReview);

	/**
	 * 게시글번호를 이용하여 업로드된 파일의 정보를 조회한다
	 * 
	 * @param detailReview - 조회할 게시글 번호를 가진 객체
	 * @return 첨부파일 정보
	 */
	public File getAttachFile(Review detailReview);

	/**
	 * 후기 게시판 글쓰기
	 * 
	 * @param review - 전달 받은 게시글 객체
	 * @param user - 전달 받은 사용자 객체
	 * @param item - 전달 받은 상품 객체 
	 * @param file - 전달 받은 파일 객체
	 */
	public void setReviewWrite(Review review, User user, Item item, MultipartFile file);


}

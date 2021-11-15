package com.khbill.dao.face;

import java.util.HashMap;
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
	 * @param review - 조회하려는 게시글의 글 번호 객체
	 * @return 조회된 게시글 정보
	 */
	public HashMap<String, Object> selectReviewByReviewNo(Review review);

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

	/**
	 * 상품 번호를 이용하여 질문게시글에 작성한 내용 불러오기
	 * 
	 * @param item
	 * @param file
	 * @return
	 */
	public HashMap<String, Object> selectReviewByItemNo(Item item, File file);


	//-----writeProc 처리 -----------------------
	
	/**
	 * 다음 파일번호 조회
	 * 
	 * @return
	 */
	public int getNextFileNo();

	/**
	 * 다음 상품번호 조회
	 * 
	 * @return
	 */
	public int getNextItemNo();

	/**
	 * 다음 질문글번호 조회
	 * 
	 * @return
	 */
	public int getNextReviewNo();

	/**
	 * 첨부파일 삽입
	 * 
	 * @param reviewFile
	 */
	public void insertFile(File reviewFile);

	/**
	 * 상품 삽입
	 * 
	 * @param item
	 */
	public void insertItem(Item item);

	/**
	 * 후기글 삽입
	 * 
	 * @param review
	 */
	public void insertReview(Review review);

}

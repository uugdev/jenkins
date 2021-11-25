package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewReport;
import com.khbill.dto.ReviewScrap;
import com.khbill.util.Paging;

public interface ReviewDao {

	/**
	 * 페이징을 적용하여 후기게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging  - 페이징, 회원 번호
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Review> selectReviewList(Paging paging);

	/**
	 * 페이징을 적용하여 후기게시글 조회순 목록 조회
	 * 
	 * paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Review> selectReviewHitList(Paging paging);

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

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param review - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public File selectReviewFileByReviewNo(Review review);
	
	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param fileNo - 조회할 파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public File selectFileByFile(int fileNo);

	/**
	 * 게시글정보를 수정
	 * 
	 * @param review - 수정할 게시글의 글객체
	 */
	public void update(Review review);

	
	
	
	//---delete -----------------------------------
	
	/**
	 * 신고 게시물 삭제
	 * 
	 * @param review
	 */
	public void deleteReport(Review review);
	
	/**
	 * 스크랩 게시물 삭제
	 * 
	 * @param review
	 */
	public void deleteScrap(Review review);
	
	/**
	 * 후기게시글 삭제
	 * 
	 * @param review
	 */
	public void deleteReview(Review review);
	
	/**
	 * 후기게시글 상품 삭제
	 * 
	 * @param itemNo
	 */
	public void deleteItem(int itemNo);
	
	/**
	 * 후기게시글 파일 삭제
	 * 
	 * @param fileNo
	 */
	public void deleteFile(int fileNo);
	/**
	 * 게시글번호로 댓글 삭제
	 * 
	 * @param review - 삭제할 내용을 가진 게시글 객체
	 */
	public void deleteReviewCommentByReviewNo(Review review);

	
	//------ scrap ----------------------------------------

	/**
	 * 스크랩 정보 삽입
	 * 
	 * @param reviewScrap
	 */
	public void insertReviewScrap(ReviewScrap reviewScrap);
	
	/**
	 * 스크랩 정보 삭제
	 * 
	 * @param reviewScrap
	 */
	public void deleteReviewScrap(ReviewScrap reviewScrap);


	/**
	 * 게시글 스크랩 수 조회
	 * 
	 * @param reviewScrap - 스크랩을 조회할 
	 * @return 전체 스크랩 수
	 */
	public int selectCountScrap(ReviewScrap reviewScrap);
	
	/**
	 * 후기 글번호로 조회
	 * 
	 * @param reviewNo
	 * @return 
	 */
	public Review selectReviewByReview(int reviewNo);
	
	/**
	 * review 신고 객체 삽입
	 * 
	 * @param reviewReport
	 */
	public void insertReviewReport(ReviewReport reviewReport);
	
	/**
	 * 신고한 게시물인지 체크
	 * 
	 * @param reviewReport
	 * @return 신고한게시글 - 1 , 안한게시글 - 0 반환
	 */
	public int selectCntReviewReportCheck(ReviewReport reviewReport);
	
	/**
	 * 마이페이지 삭제용 메소드 따로
	 * 
	 * @param reviewNo
	 */
	public Review selectDeleteReviewByReviewNo(int reviewNo);


}

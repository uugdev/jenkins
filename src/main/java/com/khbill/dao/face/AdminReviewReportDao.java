package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;
import com.khbill.dto.ReviewReport;
import com.khbill.util.Paging;

public interface AdminReviewReportDao {

	 /**
		 * 페이징을 적용하여 후기게시글 목록 조회
		 * 
		 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
		 * 
		 * @param paging  - 페이징, 회원 번호
		 * @return 페이징이 적용된 게시글 목록
		 */
	public List<ReviewReport> selectReviewReportList(Paging paging);

	/**
	 * 페이징을 위한 전체 게시글 수 조회
	 * 
	 * @return  int totalCount
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 신고처리여부를 'n'에서 'y'로 변경
	 * 
	 * @param reviewReport - 신고 상태
	 */
	public void updateReviewReportByStatusY(ReviewReport reviewReport);

	/**
	 * 신고처리여부를 위한 review_no과 report_status가 'y'인  게시글 수 조회
	 * 
	 * @param reviewReport - report_status
	 * @return count 처리
	 */
	public int selectCntReviewReportByStatusY(ReviewReport reviewReport);

	
	/**
	 * 신고처리여부를 'y'에서 'n'로 변경
	 * 
	 * @param reviewReport - 신고 상태
	 */
	public void updateReviewReportByStatusN(ReviewReport reviewReport);

	/**
	 * 신고처리여부를 위한 review_no과 report_status가 'n'인  게시글 수 조회
	 * 
	 * @param reviewReport - report_status
	 * @return count 처리
	 */
	public int selectCntReviewReportByStatusN(ReviewReport reviewReport);

	
	//------detail --------------------------------------
	
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
	public File selectFileByFile(int fileNo);

	/**
	 * 댓글 목록을 조회한다
	 * 
	 * @param review - 댓글조회 대상 게시글 정보
	 * @return 조회된 댓글 목록
	 */
	public List<HashMap<String, Object>> selectReviewCommentByReview(ReviewComment reviewComment);

	/**
	 * 허위로 신고된 신고글을 삭제한다
	 * 
	 * @param reviewReport
	 */
	public void deleteReviewReportByReportNo(ReviewReport reviewReport);

}

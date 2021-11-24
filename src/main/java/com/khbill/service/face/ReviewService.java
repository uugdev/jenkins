package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;
import com.khbill.dto.ReviewReport;
import com.khbill.dto.ReviewScrap;
import com.khbill.dto.TradeComment;
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
	 * 페이징이 적용된 후기 게시글 최신순으로 조회
	 * 
	 * @param paging -  페이징 정보 객체
	 * @return List<Review>
	 */
	public List<Review> getReviewList(Paging paging);

	/**
	 * 페이징이 적용된 후기 게시글 조회순으로 조회
	 * 
	 * @param paging - 페이징 정보 객
	 * @return List<Review>
	 */
	public List<Review> getReviewHitList(Paging paging);
	//--- detail ----------------------------------------
	
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
	 * 후기 글의 파일번호로 파일 정보 조회
	 * 
	 * @param fileNo - 상세 조회할 파일 번호 DTO
	 * @return 첨부파일 정보
	 */
	public File getReviewFile(int fileNo);
	
	/**
	 * 댓글 목록을 조회한다
	 * 
	 * @param review - 댓글을 조회할 게시글 정보
	 * @return 조회된 댓글 목록
	 */
	public List<HashMap<String, Object>> getReviewComList(ReviewComment reviewComment);

	/**
	 * 댓글을 삭제한다
	 * 
	 * @param reviewComment - 삭제하려는 댓글의 정보
	 * @return 삭제 성공 여부
	 */
	public boolean deleteReviewComment(ReviewComment reviewComment);

	/**
	 * 후기 게시판 글쓰기
	 * 
	 * @param review - 전달받은 질문 게시글 객체
	 * @param item - 전달 받은 상품 객체
	 * @param file - 전달 받은 파일 객체
	 * @return
	 */
	public void setReviewWrite(Review review, Item item, MultipartFile file);

	/**
	 * 게시글번호를 이용하여 업로드된 파일의 정보를 조회한다
	 * 
	 * @param review - 조회할 게시글 번호를 가진 객체
	 * @return 첨부파일 정보
	 */
	public File getAttachFile(Review review);

	/**
	 *  게시글 + 첨부파일 수정 처리
	 * 
	 * @param review - 게시글 정보 객체 DTO
	 * @param item - 상품 정보 객체 DTO
	 * @param file - 파일업로드 객체
	 */
	public void setReviewUpdate(Review review, MultipartFile file);

	/**
	 * 후기 게시판 글 번호로 게시글 삭제
	 * 
	 * @param reviewNo - 삭제할 게시글의 게시글번호 객체
	 */
	public void setReviewDelete(Review review);
	
	/**
	 * 새로운 댓글을 삽입한다 
	 * 
	 * @param reviewComment - 입력된 댓글 정보
	 */
	public void setReviewCommentWrite(ReviewComment reviewComment);
	
	/**
	 * 유저번호에 해당하는 유저의 가장 최신 댓글 조회
	 * 
	 * @param userNo
	 * @return
	 */
	public ReviewComment getReviewCommentWriteByUserNo(int userNo);
	
	/**
	 * 유저번호에 해당하는 유저 닉네임 조회
	 * 
	 * @param userNo
	 * @return
	 */
	public String getUserNickByUserNo(int userNo);

	/**
	 * userNo으로 gradeUrl 조회
	 * 
	 * @param userNo - 댓글 입력한 userNo
	 * @return gradeUrl
	 */
	public String getGradeUrlByUserNo(int userNo);
	/**
	 * 입력받은 후기 댓글로 후기 게시글 댓글 수정
	 * 
	 * @param reviewComment - 전송 받은 댓글 정보
	 * @return
	 */
	public ReviewComment setReviewCommentUpdate(ReviewComment reviewComment);

	/**
	 * 게시글번호로 댓글 삭제
	 * 
	 * @param review - 삭제할 게시글의 게시글 댓글 객체
	 */
	public void setReviewCommentDelete(Review review);

	//---- Scrap -------------------------------------------- 
	
	/**
	 * 게시글 번호로 게시글을 스크랩한다
	 * 
	 * @param reviewScrap 
	 * @return
	 */
	public boolean scrap(ReviewScrap reviewScrap);

	/**
	 * 사용자 스크랩 상태
	 * 
	 * @param reviewScrap - 스크랩 상태를 확인할 정보
	 * @return true - 스크랩 상태?
	 */
	public boolean isScrap(ReviewScrap reviewScrap);

	
	//--------Report -----------------------------------------------
	
	/**
	 * 신고게시물 삽입하기
	 * 
	 * @param userNo
	 * @param reviewNo
	 * @param reviewReport
	 */
	public void setReviewReport(ReviewReport reviewReport);

	/**
	 * review게시글 번호와 로그인 userNo로 신고한 게시물인지 판단한다
	 * 
	 * @param reviewReport
	 * @return
	 */
	public boolean reviewReportByReviewNoLoginUserNo(ReviewReport reviewReport);

	/**
	 * reviewNo로 review받아오기
	 * 
	 * @param reviewNo
	 * @return
	 */
	public Review getReviewByReviewNo(int reviewNo);

	/**
	 * reviewNo으로 신고 처리 여부 조회
	 * 
	 * @param review 조회할 reviewNo
	 * @return reviewNo에 해당하는 신고처리여부
	 */
	public String getReviewReportByReviewNo(Review review);



	

}

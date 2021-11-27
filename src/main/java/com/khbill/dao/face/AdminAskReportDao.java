package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.AskReport;
import com.khbill.util.Paging;

public interface AdminAskReportDao {

	/**
	 * 페이징을 적용하여 후기게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging  - 페이징, 회원 번호
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<AskReport> selectAskReportList(Paging paging);

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
	public void updateAskReportByStatusY(AskReport askReport);

	/**
	 * 신고처리여부를 위한 ask_no과 report_status가 'y'인  게시글 수 조회
	 * 
	 * @param askReport - report_status
	 * @return count 처리
	 */
	public int selectCntAskReportByStatusY(AskReport askReport);

	/**
	 * 신고처리여부를 'y'에서 'n'로 변경
	 * 
	 * @param askReport - 신고 상태
	 */
	public void updateAskReportByStatusN(AskReport askReport);

	/**
	 * 신고처리여부를 위한 ask_no과 report_status가 'n'인  게시글 수 조회
	 * 
	 * @param askReport - report_status
	 * @return count 처리
	 */
	public int selectCntAskReportByStatusN(AskReport askReport);

	/**
	 * 허위로 신고된 신고글을 삭제한다
	 * 
	 * @param reviewReport
	 */
	public void deleteAskReportByReportNo(AskReport askReport);
	 

}

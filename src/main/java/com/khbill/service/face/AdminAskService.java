package com.khbill.service.face;

import java.util.List;

import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
import com.khbill.dto.User;
import com.khbill.util.Paging;

public interface AdminAskService {

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
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Ask> getAskList(Paging paging);


	/**
	 * ask게시글 삭제하기
	 * 
	 * @param askNo
	 */
	public void setAskDelete(int askNo);


	/**
	 * ask댓글 삭제하기
	 * 
	 * @param askNo
	 */
	public void setAskComDelete(int askNo);
	
	
	/**
	 * 게시글 번호로 댓글 조회
	 * 
	 * @param askNo
	 * @return
	 */
	public List<AskComment> getAskComList(int askNo);

	
	/**
	 * 댓글번호로 댓글 삭제
	 * 
	 * @param askComNo
	 * @return 삭제 성공 여부
	 */
	public boolean deleteAskCom(int askComNo);


	/**
	 * 모든 유저 목록 조회
	 * 
	 * @return 유저리스트
	 */
	public List<User> getUserList();

	
	
	

}

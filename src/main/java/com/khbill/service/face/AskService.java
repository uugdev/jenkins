package com.khbill.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.dto.Vote;
import com.khbill.util.Paging;

public interface AskService {

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
	Paging getPaging(Paging paramData);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	List<Ask> getAskList(Paging paging);

	
	/**
	 * 유저번호로 유저정보를 조회한다
	 * 
	 * @return 조회된 유저객체
	 */
	public User getUserInfoByUserNo(int userNo);

	
	
	/**
	 * 모든 유저 목록 조회
	 * 
	 * @return 유저리스트
	 */
	public List<User> getUserList();

	
	/**
	 * 질문 게시판 글쓰기
	 * 
	 * @param ask - 전달받은 질문게시글 객체
	 * @param item - 전달받은 상품 객체
	 * @param file - 전달받은 파일 객체
	 * @param voteEnd - 투표마감일자
	 */
	public void setAskWrite(Ask ask, Item item, MultipartFile file, String voteEnd);

	/**
	 * 질문글번호로 상세조회
	 * 
	 * @param askNo - 전달받은 질문글번호
	 * @return
	 */
	public Ask getAskDetail(int askNo);

	/**
	 * 질문글번호로 투표조회
	 * 
	 * @param askNo
	 * @return
	 */
	public Vote getVote(int askNo);

	/**
	 * 질문글번호롤 상품조회
	 * 
	 * @param productNo
	 * @return
	 */
	public Item getItem(int productNo);

	/**
	 * 파일번호로 파일조회
	 * 
	 * @param fileNo
	 * @return
	 */
	public File getFile(int fileNo);

	/**
	 * 
	 * 투표기간이 끝나면 투표를 종료한다
	 * 
	 * @param voteEnd - 끝나는날짜
	 * @return 진행중
	 */
	public String voteCheck(Vote vote);

	
	/**
	 * 질문게시판 수정하기
	 * 
	 * @param ask
	 */
	public void setAskUpdate(Ask ask);

	/**
	 * 질문게시판 글 번호로 게시글 삭제
	 * 
	 * @param askNo
	 */
	public void setAskDelete(int askNo);
	
	/**
	 * 
	 * 댓글쓰기
	 * @param askComment
	 */
	public void setAskCommentWrite(AskComment askComment);

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
	 * 게시글번호로 댓글 삭제
	 * 
	 * @param askComNo
	 */
	public void setAskComDelete(int askNo);

	/**
	 * 투표결과 체크
	 * 
	 * @param askNo
	 * @param userNo
	 * @return
	 */
	public void getVoteStatus(int askNo, int userNo);







}

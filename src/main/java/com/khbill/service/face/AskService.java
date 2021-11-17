package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
import com.khbill.dto.AskReport;
import com.khbill.dto.AskScrap;
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
	public Paging getPaging(Paging paramData);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Ask> getAskList(Paging paging);

	
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
	public Vote getVote(Vote voteSet);

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
	 * 게시글번호로 조회한 투표객체와 투표상태 삽입
	 * 
	 * @param vote
	 * @param voteState
	 */
	public void setVoteInsert(int userNo, Vote vote, String voteState);

	
	/**
	 * y,n 총 투표수 가져오기
	 * 
	 * @param askNo
	 * @param voteState
	 * @return
	 */
	public int getVoteStatusTotalCnt(int askNo,String voteState);

	/**
	 * 총투표수 가져오기
	 * 
	 * @param askNo
	 * @return
	 */
	public int getVoteTotalCnt(int askNo);
	
	
	/**
	 * 
	 * 로그인유저의 투표상태 체크
	 * 
	 * @param askNo
	 * @param userNo
	 * @return
	 */
	public boolean getVoteState(int askNo, int userNo);

	
	/**
	 * 
	 * 로그인유저의 투표 y,n체크
	 * 
	 * @param userNo
	 * @param askNo
	 * @return
	 */
	public Vote getLoginUserVoteState(int userNo, int askNo);

	
	/**
	 * 댓글번호로 댓글객체 반환
	 * 
	 * @param askComNo
	 * @return
	 */
	public AskComment getAskComDetail(int askComNo);

	/**
	 * 스크랩한 게시글 삽입하기
	 * 
	 * @param askNo
	 * @param userNo
	 */
	public void setAskScrap(int askNo, int userNo);

	/**
	 * 
	 * 추천상태 확인하기
	 * 
	 * @param askScrap
	 * @return
	 */
	public boolean scrap(AskScrap askScrap);

	
	
	
	/**
	 * 사용자 추천상태
	 * 
	 * @param askScrap
	 * @return
	 */
	public boolean isScrap(AskScrap askScrap);

	/**
	 * 
	 * 신고게시물 삽입하기
	 * 
	 * @param userNo
	 * @param askNo
	 * @param askReport
	 */
	public void setAskReport(AskReport askReport);

	
	/**
	 * 
	 * ask게시글번호와 로그인userNo로 신고한게시물인지 판단한다
	 * 
	 * @param askReport
	 * @return 
	 */
	public boolean askReportByAskNoLoginUserNo(AskReport askReport);

//	
//	/**
//	 * 
//	 * 투표수로 ask리스트 정렬
//	 * 
//	 * @param paging
//	 * @return
//	 */
//	public List<Ask> getAskNumOfVoteList(Paging paging);

	/**
	 * ask리스트 조회수 정렬
	 * 
	 * @param paging
	 * @return
	 */
	public List<Ask> getAskHitList(Paging paging);

	
	/**
	 * 게시글댓글에 대한 페이징 객체
	 * 
	 * @param paramData -curPage를 저장하고있는 객체 
	 * @param askNo - 질문글 번호
	 * @return 페이징객체
	 */
	public Paging getAskComPaging(Paging paramData, int askNo);

	/**
	 * askNo로 작성한 댓글 리스트 조회
	 * 
	 * @param map
	 * @return askNo 댓글 리스트
	 */
	public List<AskComment> getAskComListPaging(HashMap<String, Object> map);

	
	/**
	 * 
	 * 유저번호에 해당하는 유저의 가장 최신 댓글 조회
	 * 
	 * @param userNo
	 * @return
	 */
	public AskComment getAskCommentWriteByUserNo(int userNo);

	
	/**
	 * 유저번호에 해당하는 유저 닉네임 조회
	 * 
	 * @param userNo
	 * @return
	 */
	public String getUserNickByUserNo(int userNo);

	
	/**
	 * 게시글 댓글 수정
	 * 
	 * @param askComment
	 * @return
	 */
	public AskComment setAskCommentUpdate(AskComment askComment);


}

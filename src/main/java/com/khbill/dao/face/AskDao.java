package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
import com.khbill.dto.AskReport;
import com.khbill.dto.AskScrap;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.User;
import com.khbill.dto.Vote;
import com.khbill.util.Paging;

public interface AskDao {

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Ask> selectAskList(Paging paging);


	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging paramData);


	/**
	 * 유저번호로 유저정보를 조회한다
	 * 
	 * @param userNo
	 * @return 조회된 유저객체
	 */
	public User selectUserInfo(int userNo);


	/**
	 * 
	 * 유저 리스트 조회
	 * @return
	 */
	public List<User> selectUserList();

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
	public int getNextAskNo();


	/**
	 * 첨부파일 삽입
	 * 
	 * @param askFile
	 */
	public void insertFile(File askFile);


	/**
	 * 상품 삽입
	 * 
	 * @param item
	 */
	public void insertItem(Item item);


	/**
	 * 질문글 삽입
	 * 
	 * @param ask
	 */
	public void insertAsk(Ask ask);


	/**
	 * 투표 삽입
	 * 
	 * @param vote
	 * @param voteEnd
	 */
	public void insertVote1(Vote vote);
	public void insertVote2(Vote vote);
	public void insertVote3(Vote vote);


	/**
	 * 질문글번호로 조회
	 * 
	 * @param askNo
	 */
	public Ask selectAskByAskNo(int askNo);


	/**
	 * 파일번호로 파일조회
	 * 
	 * @param fileNo
	 * @return
	 */
	public File selectFileByFileNo(int fileNo);


	/**
	 * 상품번호로 상품조회
	 * 
	 * @param productNo
	 * @return
	 */
	public Item selectItemByProductNo(int productNo);


	/**
	 * 게시글번호,유저번호가담긴 보트객체로 투표객체조회
	 * 
	 * @param Vote
	 * @return
	 */
	public Vote selectVoteByAskNoUserNo(Vote voteSet);


	
	/**
	 * 투표종료날짜가 현재시간보다 작으면 투표 종료
	 * 
	 * @param voteEnd
	 * @return - 시간을 지나면 0 반환
	 */
	public int selectVoteEnd(Vote vote);


	/**
	 * 상세보기페이지에 들어가면 조회수를 1씩 증가시킨다
	 * 
	 * @param askNo
	 */
	public void hit(int askNo);


	/**
	 * 질문게시판 업데이트
	 * 
	 * @param ask
	 */
	public void updateAsk(Ask ask);


	/**
	 * ask게시글번호로 삭제할 게시글 조회
	 * 
	 * @param askNo
	 */
	public void deleteAsk(int askNo);
	
	/**
	 * ask게시글번호로 삭제할 투표객체 조회
	 * 
	 * @param askNo
	 */
	public void deleteVote(int askNo);
	
	/**
	 * ask게시글번호로 삭제할 파일 조회
	 * 
	 * @param askNo
	 */
	public void deleteFile(int fileNo);
	
	
	/**
	 * ask게시글번호로 삭제할 아이템 조회
	 * 
	 * @param askNo
	 */
	public void deleteItem(int itemNo);


	/**
	 * askComment 삽입
	 * 
	 * @param askComment
	 */
	public void insertAskCom(AskComment askComment);


	/**
	 * askNo로 댓글 조회
	 * 
	 * @param askNo
	 * @return
	 */
	public List<HashMap<String, String>> selectAskComByAskNo(int askNo);


	/**
	 * askComNo로 댓글 삭제
	 * 
	 * @param askComNo
	 */
	public void deleteAskCom(int askComNo);


	/**
	 * askComNo로 일치하는 댓글 조회
	 * 
	 * @param askComNo
	 * @return
	 */
	public int selectCntCom(int askComNo);


	/**
	 * 게시글번호로 댓글 삭제
	 * 
	 * @param askNo
	 */
	public void deleteAskComByAskNo(int askNo);

	/**
	 * 
	 * 투표한 사람의 투표상태체크
	 * @param voteStatus
	 * @return
	 */
	public void insertVoteStatus(Vote voteStatus);


	/**
	 * askNo로 총 투표수 조회
	 * 
	 * @param askNo
	 */
	public int selectVoteByAskNo(int askNo);


	/**
	 * 
	 * 로그인유저의 투표 상태 조회
	 * 
	 * @param askNo
	 * @param userNo
	 * @return
	 */
	public int selectVoteByLoginUser(Vote vote);
	
	/**
	 * 유저 번호로 질문글 갯수 가져오기
	 * 
	 * @param userNo - 조회할 유저 번호
	 * @return 총 게시글 수
	 */
	public int selectItemCntAll(int userNo);

	/**
	 * 유저 번호로 질문 리스트를 받아온다
	 * 
	 * @param map - 페이징, 유저 번호가 담겨있음
	 * @return 질문 리스트
	 */
	public List<Ask> selectAskListByUserNo(HashMap<String, Object> map);

	/**
	 * 유저 번호로 아이템 리스트를 받아온다
	 * 
	 * @param userNo
	 * @return 아이템 리스트
	 */
	public List<Item> selectItemByUserNo(int userNo);

	/**
	 * 유저 번호로 투표 리스트를 받아온다
	 * 
	 * @param userNo
	 * @return 투표 리스트
	 */
	public List<Vote> selectVoteByUserNo(int userNo);

	/**
	 * 유저 번호로 리뷰 리스트를 받아온다
	 * 
	 * @param userNo
	 * @return 리뷰 리스트
	 */
	public List<Review> selectReviewByUserNo(int userNo);


	/**
	 * y,n에 투표한 사람의 수 조회
	 * 
	 * @param vote
	 * @return
	 */
	public int selectVoteByAskNoVoteState(Vote vote);


	/**
	 * 댓글번호로 댓글객체 조회
	 * 
	 * @param askComNo
	 * @return
	 */
	public AskComment selectAskComByAskComNo(int askComNo);


	/**
	 * 
	 * 스크랩 정보 삽입
	 * 
	 * @param askScrap
	 */
	public void insertAskScrap(AskScrap askScrap);


	/**
	 * 
	 * 스크랩 정보 삭제
	 * 
	 * @param askScrap
	 */
	public void deleteAskScrap(AskScrap askScrap);


	/**
	 * 
	 * 유저가 해당 게시글을 스크랩 한 적이 있는지 조회
	 * 
	 * 
	 * @param askScrap
	 * @return 1 - 추천했음 0 - 추천한적 없음
	 */
	public int selectCntAskScrap(AskScrap askScrap);


	/**
	 * ask 신고 객체 삽입
	 * 
	 * @param askReport
	 */
	public void insertAskReport(AskReport askReport);


	/**
	 * 
	 * 신고한 게시물인지 체크
	 * 
	 * @param askReport
	 * @return 신고한게시글 - 1 , 안한게시글 - 0 반환
	 */
	public int selectCntAskReportCheck(AskReport askReport);


	/**
	 * 투표수로 정렬
	 * 
	 * @param paging
	 * @return
	 */
	public List<Ask> selectAskListNumOfVote(Paging paging);


	/**
	 * 조회수 역순으로 조회 
	 * 
	 * @param paging
	 * @return
	 */
	public List<Ask> selectAskHitList(Paging paging);


	/**
	 * 
	 * 스크랩삭제
	 * 
	 * @param askNo
	 */
	public void deleteScrap(int askNo);


	/**
	 * 신고글삭제
	 * 
	 * @param askNo
	 */
	public void deleteReport(int askNo);


	
	/**
	 * 게시글에 달린 댓글 수
	 * 
	 * @param askNo - 게시글번호
	 * @return
	 */
	public int selectCntAskComAll(int askNo);


	/**
	 * askNo로 조회한 댓글 리스트
	 * 
	 * @param map - askNo, 페이징
	 * @return
	 */
	public List<AskComment> selectAskComListByAskNo(HashMap<String, Object> map);


	public AskComment selectAskCommentByUserNo(int userNo);


	public String selectUserNickByUserNo(int userNo);


	public void updateAskComment(AskComment askComment);


	public AskComment selectOneAskCommentByAskNo(int askComNo);


	/**
	 * 유저등급 조회
	 * 
	 * @return
	 */
	public List<HashMap<String, Object>> selectUserWithGrade();


	/**
	 * 유저번호로 유저의 등급 조회
	 * 
	 * @param userNo
	 * @return
	 */
	public String selectGradeUrlByUserNo(int userNo);


	/**
	 * 사진리스트 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<HashMap<String, Object>> selectAskItemList(Paging paging);


	/**
	 * 
	 * 전체 게시글당 댓글수 조회
	 * 
	 * @return
	 */
	public List<HashMap<String, Object>> selectAskComCntList();
	
	
	/**
	 * 유저가 insert한 거래 게시글 번호 조회
	 * 
	 * @param userNo - 글쓴 유저의 유저번호
	 * @return askNo
	 */
	public int selectAskNoByUserNo(int userNo);

	
	
	
}

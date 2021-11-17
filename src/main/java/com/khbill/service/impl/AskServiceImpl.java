package com.khbill.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.khbill.dao.face.AskDao;
import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
import com.khbill.dto.AskReport;
import com.khbill.dto.AskScrap;
import com.khbill.dto.Item;
import com.khbill.dto.TradeComment;
import com.khbill.dto.User;
import com.khbill.dto.Vote;
import com.khbill.service.face.AskService;
import com.khbill.util.Paging;

@Service
public class AskServiceImpl implements AskService {

	@Autowired
	AskDao askDao;
	@Autowired
	private ServletContext context;

	@Override
	public List<Ask> getAskList(Paging paging) {
		return askDao.selectAskList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		// 총 게시글 수 조회
		int totalCount = askDao.selectCntAll(paramData);

		// 페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());

		return paging;
	}

	@Override
	public User getUserInfoByUserNo(int userNo) {

		User user = askDao.selectUserInfo(userNo);

		return user;
	}

	@Override
	public List<User> getUserList() {

		List<User> user = askDao.selectUserList();

		return user;
	}

	@Override
	public void setAskWrite(Ask ask, Item item, MultipartFile file, String voteEnd) {

		// 빈 파일
		if (file.getSize() <= 0) {
			return;
		}

		int userNo = ask.getUserNo();
		int fileNo = askDao.getNextFileNo();
		int itemNo = askDao.getNextItemNo();
		int askNo = askDao.getNextAskNo();

		// 파일이 저장될 경로
		String storedPath = context.getRealPath("upload");

		File storedFolder = new File(storedPath);
		if (!storedFolder.exists()) {
			storedFolder.mkdir();
		}

		// 저장될 파일의 이름 생성하기
		String fileOrigin = file.getOriginalFilename();
		String fileStored = UUID.randomUUID().toString().split("-")[4] + fileOrigin;

		// 저장할 파일 객체
		File dest = new File(storedPath, fileStored);

		try {
			file.transferTo(dest); // 업로드 파일 저장
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		// --------------------------------------------------------
		com.khbill.dto.File askFile = new com.khbill.dto.File();
		askFile.setFileOrigin(fileOrigin);
		askFile.setFileStored(fileStored);
		askFile.setFileSize((int) file.getSize());
		askFile.setFileNo(fileNo);

		item.setUserNo(userNo);
		item.setFileNo(fileNo);
		item.setItemNo(itemNo);

		ask.setProductNo(itemNo);
		ask.setAskNo(askNo);

		Vote vote = new Vote();
		vote.setUserNo(userNo);
		vote.setAskNo(askNo);

		askDao.insertFile(askFile); // 1
		askDao.insertItem(item); // 2
		askDao.insertAsk(ask); // 3

		if (voteEnd.equals("sysdate+1")) {

			askDao.insertVote1(vote); // 4

		} else if (voteEnd.equals("sysdate+2")) {

			askDao.insertVote2(vote); // 4

		} else if (voteEnd.equals("sysdate+3")) {

			askDao.insertVote3(vote); // 4

		}

	}

	@Override
	public Ask getAskDetail(int askNo) {

		askDao.hit(askNo);

		Ask ask = askDao.selectAskByAskNo(askNo);

		return ask;
	}

	@Override
	public com.khbill.dto.File getFile(int fileNo) {
		com.khbill.dto.File file = askDao.selectFileByFileNo(fileNo);

		return file;
	}

	@Override
	public Item getItem(int productNo) {

		Item item = askDao.selectItemByProductNo(productNo);

		return item;
	}

	@Override
	public Vote getVote(Vote voteResult) {

		Vote vote = askDao.selectVoteByAskNoUserNo(voteResult);

		return vote;
	}

	@Override
	public String voteCheck(Vote vote) {
		System.out.println(vote);

		int res = askDao.selectVoteEnd(vote);
		String check = null;

		if (res == 1) {

			check = "y";

		} else if (res <= 0) {

			check = "n";

		}

		return check;
	}

	@Override
	public void setAskUpdate(Ask ask) {

		if ("".equals(ask.getAskTitle())) {
			ask.setAskTitle("(제목없음)");
		}

		askDao.updateAsk(ask);

	}

	@Override
	public void setAskDelete(int askNo) {

		Ask ask = askDao.selectAskByAskNo(askNo);
		Item item = new Item();
		com.khbill.dto.File file = new com.khbill.dto.File();

		item.setItemNo(ask.getProductNo());
		System.out.println(item.getItemNo());
		file.setFileNo(item.getFileNo());
		System.out.println(item.getFileNo());

		int itemNo = item.getItemNo();
		int fileNo = file.getFileNo();

		askDao.deleteVote(askNo);
		askDao.deleteReport(askNo);
		askDao.deleteScrap(askNo);
		askDao.deleteAsk(askNo);
		askDao.deleteItem(itemNo);
		askDao.deleteFile(fileNo);

	}

	@Override
	public void setAskCommentWrite(AskComment askComment) {

		askDao.insertAskCom(askComment);

	}

	@Override
	public List<AskComment> getAskComList(int askNo) {

		List<AskComment> askComment = askDao.selectAskComByAskNo(askNo);

		return askComment;
	}

	@Override
	public boolean deleteAskCom(int askComNo) {

		askDao.deleteAskCom(askComNo);

		if (askDao.selectCntCom(askComNo) > 0) {

			return false;

		} else {

			return true;

		}

	}

	@Override
	public void setAskComDelete(int askNo) {

		askDao.deleteAskComByAskNo(askNo);

	}

	@Override
	public void setVoteInsert(int userNo, Vote vote, String voteState) {

		Vote voteStatus = new Vote();

		voteStatus.setUserNo(userNo);
		voteStatus.setAskNo(vote.getAskNo());
		voteStatus.setVoteState(voteState);
		voteStatus.setVoteStart(vote.getVoteStart());
		voteStatus.setVoteEnd(vote.getVoteEnd());

		askDao.insertVoteStatus(voteStatus);

	}

	@Override
	public int getVoteTotalCnt(int askNo) {

		int cnt = askDao.selectVoteByAskNo(askNo);

		return cnt;
	}

	@Override
	public int getVoteStatusTotalCnt(int askNo, String voteState) {

		Vote vote = new Vote();
		vote.setAskNo(askNo);
		vote.setVoteState(voteState);

		int cnt = askDao.selectVoteByAskNoVoteState(vote);

		return cnt;
	}

	@Override
	public boolean getVoteState(int askNo, int userNo) {

		Vote voteSet = new Vote();
		voteSet.setAskNo(askNo);
		voteSet.setUserNo(userNo);

		Vote vote = askDao.selectVoteByAskNoUserNo(voteSet);

		if (askDao.selectVoteByLoginUser(vote) > 0) {

			return false;

		} else {

			return true;

		}

	}

	@Override
	public Vote getLoginUserVoteState(int userNo, int askNo) {

		Vote voteSet = new Vote();
		voteSet.setAskNo(askNo);
		voteSet.setUserNo(userNo);

		Vote vote = askDao.selectVoteByAskNoUserNo(voteSet);

		return vote;
	}

	@Override
	public AskComment getAskComDetail(int askComNo) {

		return askDao.selectAskComByAskComNo(askComNo);
	}

	@Override
	public void setAskScrap(int askNo, int userNo) {

		AskScrap askScrap = new AskScrap();
		askScrap.setAskNo(askNo);
		askScrap.setUserNo(userNo);

		askDao.insertAskScrap(askScrap);

	}

	@Override
	public boolean scrap(AskScrap askScrap) {
		if(isScrap(askScrap)) { //스크랩상태
			
			askDao.deleteAskScrap(askScrap);
			
			return false;
			
		} else {//스크랩하지않은 상태
			
			askDao.insertAskScrap(askScrap);
			
		}
		
		return true;
	}

	public boolean isScrap(AskScrap askScrap) {

		int cnt = askDao.selectCntAskScrap(askScrap);

		if(cnt > 0) { //스크랩
			return true;
			
		} else { //스크랩안한상태
			return false;
			
		}
		
	}
	
	@Override
	public void setAskReport(AskReport askReport) {

		Ask ask = askDao.selectAskByAskNo(askReport.getAskNo());
		askReport.setRespondentNo(ask.getUserNo());
		
		askDao.insertAskReport(askReport);
		
	}
	
	@Override
	public boolean askReportByAskNoLoginUserNo(AskReport askReport) {

		int cnt = askDao.selectCntAskReportCheck(askReport);

		if(cnt > 0) {
			return false;
		} else {
			return true;
		}
	
	}
	
	/*
	 * @Override public List<Ask> getAskNumOfVoteList(Paging paging) { return
	 * askDao.selectAskListNumOfVote(paging); }
	 */

	@Override
	public List<Ask> getAskHitList(Paging paging) {

		return askDao.selectAskHitList(paging);
	}
	
	
	@Override
	public Paging getAskComPaging(Paging paramData, int askNo) {
		
		//총댓글수 계산
		int totalCount = askDao.selectCntAskComAll(askNo);

		// 페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}
	

	@Override
	public List<AskComment> getAskComListPaging(HashMap<String, Object> map) {

		return askDao.selectAskComListByAskNo(map);
	}
	
	
	@Override
	public AskComment getAskCommentWriteByUserNo(int userNo) {
		return askDao.selectAskCommentByUserNo(userNo);
	}
	
	@Override
	public String getUserNickByUserNo(int userNo) {
		return askDao.selectUserNickByUserNo(userNo);
	}
	
	@Override
	public AskComment setAskCommentUpdate(AskComment askComment) {
		askDao.updateAskComment(askComment);
		
		AskComment resultCom = askDao.selectOneAskCommentByAskNo(askComment.getAskComNo());
		
		return resultCom;
	}
	
}// class

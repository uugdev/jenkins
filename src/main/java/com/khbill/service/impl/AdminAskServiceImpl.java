package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminAskDao;
import com.khbill.dto.Ask;
import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.dto.Vote;
import com.khbill.service.face.AdminAskService;
import com.khbill.util.Paging;

@Service
public class AdminAskServiceImpl implements AdminAskService {

	@Autowired
	AdminAskDao adminAskDao;

	@Override
	public Paging getPaging(Paging paramData) {
		// 총 게시글 수 조회
		int totalCount = adminAskDao.selectCntAll(paramData);

		// 페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());

		return paging;
	}

	@Override
	public List<Ask> getAskList(Paging paging) {
		return adminAskDao.selectAskList(paging);
	}
	
	
	@Override
	public void setAskDelete(int i) {

		Ask ask = adminAskDao.selectAskByAskNo(i);
		Item item = new Item();
		com.khbill.dto.File file = new com.khbill.dto.File();

		item.setItemNo(ask.getProductNo());
		file.setFileNo(item.getFileNo());

//		int itemNo = item.getItemNo();
		int fileNo = file.getFileNo();

		adminAskDao.deleteVote(i);
		adminAskDao.deleteReport(i);
		adminAskDao.deleteScrap(i);
		adminAskDao.deleteAsk(i);
//		adminAskDao.deleteItem(itemNo);
		adminAskDao.deleteFile(fileNo);
		
	}
	
	
	
	@Override
	public void setAskComDelete(int i) {
		
		adminAskDao.deleteAskComByAskNo(i);

	}


	@Override
	public boolean deleteAskCom(int askComNo) {

		adminAskDao.deleteAskCom(askComNo);

		if (adminAskDao.selectCntCom(askComNo) > 0) {

			return false;

		} else {

			return true;

		}

	}
	
	@Override
	public List<HashMap<String, String>> getAskComList(int askNo) {


		return adminAskDao.selectAskComByAskNo(askNo);
	}


	@Override
	public List<User> getUserList() {

		List<User> user = adminAskDao.selectUserList();

		return user;
	}
	
	
	@Override
	public User getUserInfoByUserNo(int userNo) {

		User user = adminAskDao.selectUserInfo(userNo);

		return user;
	}
	
	@Override
	public Ask getAskDetail(int askNo) {

		Ask ask = adminAskDao.selectAskByAskNo(askNo);

		return ask;
	}

	@Override
	public com.khbill.dto.File getFile(int fileNo) {
		com.khbill.dto.File file = adminAskDao.selectFileByFileNo(fileNo);

		return file;
	}

	@Override
	public Item getItem(int productNo) {

		Item item = adminAskDao.selectItemByProductNo(productNo);

		return item;
	}

	@Override
	public Vote getVote(Vote voteResult) {

		Vote vote = adminAskDao.selectVoteByAskNoUserNo(voteResult);

		return vote;
	}

	@Override
	public int getVoteStatusTotalCnt(int askNo, String voteState) {

		Vote vote = new Vote();
		vote.setAskNo(askNo);
		vote.setVoteState(voteState);

		int cnt = adminAskDao.selectVoteByAskNoVoteState(vote);

		return cnt;
	}
	
	
	@Override
	public int getAskComCnt(int askNo) {
		return adminAskDao.selectCntAskComAll(askNo);
	}
	
	
	@Override
	public String voteCheck(Vote vote) {
		System.out.println(vote);

		int res = adminAskDao.selectVoteEnd(vote);
		String check = null;

		if (res == 1) {

			check = "y";

		} else if (res <= 0) {

			check = "n";

		}

		return check;
	}
	
	
}// class

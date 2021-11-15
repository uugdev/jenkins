package com.khbill.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminAskDao;
import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
import com.khbill.dto.Item;
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
	public void setAskDelete(int askNo) {

		Ask ask = adminAskDao.selectAskByAskNo(askNo);
		Item item = new Item();
		com.khbill.dto.File file = new com.khbill.dto.File();

		item.setItemNo(ask.getProductNo());
		file.setFileNo(item.getFileNo());

		int itemNo = item.getItemNo();
		int fileNo = file.getFileNo();

		adminAskDao.deleteVote(askNo);
		adminAskDao.deleteReport(askNo);
		adminAskDao.deleteScrap(askNo);
		adminAskDao.deleteAsk(askNo);
		adminAskDao.deleteItem(itemNo);
		adminAskDao.deleteFile(fileNo);
		
	}
	
	
	
	@Override
	public void setAskComDelete(int askNo) {
		
		adminAskDao.deleteAskComByAskNo(askNo);

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
	public List<AskComment> getAskComList(int askNo) {

		List<AskComment> askComment = adminAskDao.selectAskComByAskNo(askNo);

		return askComment;
	}


	
	
}// class

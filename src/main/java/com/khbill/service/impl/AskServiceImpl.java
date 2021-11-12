package com.khbill.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.khbill.dao.face.AskDao;
import com.khbill.dto.Ask;
import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.dto.Vote;
import com.khbill.service.face.AskService;
import com.khbill.util.Paging;

@Service
public class AskServiceImpl implements AskService {

	
	@Autowired AskDao askDao;
	@Autowired private ServletContext context;

	@Override
	public List<Ask> getAskList(Paging paging) {
		return askDao.selectAskList(paging);
	}
	
	@Override
	public Paging getPaging(Paging paramData) {
		//총 게시글 수 조회
		int totalCount = askDao.selectCntAll(paramData);
				
		//페이징 계산
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

		//빈 파일
		if( file.getSize() <= 0 ) {
			return;
		}
		
		int userNo = ask.getUserNo();
		int fileNo = askDao.getNextFileNo();
		int itemNo = askDao.getNextItemNo();
		int askNo = askDao.getNextAskNo();
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
				
		//저장될 파일의 이름 생성하기
		String fileOrigin = file.getOriginalFilename();
		String fileStored = UUID.randomUUID().toString().split("-")[4] + fileOrigin;
				
		//저장할 파일 객체
		File dest = new File(storedPath, fileStored);
		
		try {
			file.transferTo(dest); //업로드 파일 저장
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------------------
		com.khbill.dto.File askFile = new com.khbill.dto.File();
		askFile.setFileOrigin(fileOrigin);
		askFile.setFileStored(fileStored);
		askFile.setFileSize((int)file.getSize());
		askFile.setFileNo(fileNo);
		
		item.setUserNo(userNo);
		item.setFileNo(fileNo);
		item.setItemNo(itemNo);

		ask.setProductNo(itemNo);
		ask.setAskNo(askNo);
		
		
		Vote vote = new Vote();
		vote.setUserNo(userNo);
		vote.setAskNo(askNo);
		
		askDao.insertFile(askFile); //1
		askDao.insertItem(item); //2
		askDao.insertAsk(ask); //3
		
		if(voteEnd.equals("sysdate+1")) {
			
			askDao.insertVote1(vote); //4
			
		} else if(voteEnd.equals("sysdate+2")) {
			
			askDao.insertVote2(vote); //4
			
		} else if(voteEnd.equals("sysdate+3")) {
			
			askDao.insertVote3(vote); //4
			
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
	public Vote getVote(int askNo) {
		
		Vote vote = askDao.selectVoteByAskNo(askNo);
		
		return vote;
	}
	
	
	@Override
	public String voteCheck(Vote vote) {
		System.out.println(vote);
		
		int res = askDao.selectVoteEnd(vote);
		String check = null;
		
		if(res == 1) {
			
			check = "y";	
			
		} else if (res <= 0) {
			
			check = "n";	
			
		}
		
		return check;
	}
	
	
	@Override
	public void setAskUpdate(Ask ask) {

		if( "".equals(ask.getAskTitle()) ) {
			ask.setAskTitle("(제목없음)");
		}
		
		askDao.updateAsk(ask);
		
	}
	
	
	@Override
	public void setAskDelete(int askNo) {

		askDao.deleteFile(askNo);
		askDao.deleteItem(askNo);
		askDao.deleteVote(askNo);
		askDao.deleteAsk(askNo);
	
	}
	
	
	
	
}// class

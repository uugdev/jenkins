package com.khbill.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.khbill.dao.face.TradeDao;
import com.khbill.dto.Trade;
import com.khbill.dto.TradeComment;
import com.khbill.dto.TradeReport;
import com.khbill.dto.TradeScrap;
import com.khbill.service.face.TradeService;
import com.khbill.util.Paging;

@Service
public class TradeServiceImpl implements TradeService {
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(TradeServiceImpl.class);
	
	//서비스 객체
	@Autowired private TradeDao tradeDao;
	
	//서블릿 컨텍스트 객체
	@Autowired ServletContext context;

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = tradeDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		paging.setTarget(paramData.getTarget());
		
		return paging;
	}

	@Override
	public List<Trade> getTradeList(Paging paging) {
		return tradeDao.selectTradeList(paging);
	}

	@Override
	public HashMap<String, String> getTradeDetail(int tradeNo) {
		
		tradeDao.updateHit(tradeNo);
		
		return tradeDao.selectTradeByTradeNo(tradeNo);
	}

	@Override
	public List<HashMap<String, String>> getTradeCommentDetail(int tradeNo) {
		
		logger.info("tradeNo - {}", tradeNo);
		
		return tradeDao.selectTradeCommentByTradeNo(tradeNo);
	}

	@Override
	public String setTradeWrite(HttpSession session, MultipartFile file, Trade trade) {
		
		int userNo = (int) session.getAttribute("userNo");
		trade.setUserNo(userNo);
		
		if(file.getSize() <= 0) {
			logger.info("파일의 크기가 0, 파일 없음");
			
			trade.setFileNo(null);
			
			tradeDao.insertTrade(trade);
			
			return tradeDao.selectTradeNoByUserNo(userNo);
		}
		
		//파일이 저장될 경로(RealPath)
		String storedPath = context.getRealPath("upload");
		logger.info("upload realPath : {}", storedPath); 
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//저장될 파일의 이름 생성하기
		String filename = file.getOriginalFilename(); //원본파일명
		filename += UUID.randomUUID().toString().split("-")[4]; //UUID추가
		logger.info("filename : {}", filename);
		
		
		//저장될 파일의 정보 객체 - java.util.File
		File dest = new File(storedFolder, filename);
		
		try {
			
			//업로드된 파일을 저장하기
			file.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int fileNo = tradeDao.selectFileNo();
		
		//DB에 기록할 정보 객체 - DTO
		com.khbill.dto.File tradeFile = new com.khbill.dto.File();
		tradeFile.setFileNo(fileNo);
		tradeFile.setFileSize((int)file.getSize());
		tradeFile.setFileOrigin(file.getOriginalFilename());
		tradeFile.setFileStored(filename);
		
		tradeDao.insertFile(tradeFile);
		
		trade.setFileNo(fileNo);
		
		tradeDao.insertTrade(trade);
		
		return tradeDao.selectTradeNoByUserNo(userNo);
		
	}

	@Override
	public void setTradeCommentWrite(TradeComment tradeComment) {
		tradeDao.insertTradeComment(tradeComment);
		
	}

	@Override
	public boolean setTradeCommentDelete(int tradeComNo) {
		
		tradeDao.deleteTradeCommentByTradeComNo(tradeComNo);
		
		if( tradeDao.selectCountTradeComment(tradeComNo) > 0 ) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public TradeComment setTradeCommentUpdate(TradeComment tradeComment) {
		tradeDao.updateTradeComment(tradeComment);
		
		TradeComment resultCom = tradeDao.selectOneTradeCommentByTradeNo(tradeComment.getTradeComNo());
		
		return resultCom;
	}

	@Override
	public TradeComment getTradeCommentWriteByUserNo(int userNo) {
		return tradeDao.selectTradeCommentByUserNo(userNo);
	}

	@Override
	public String getUserNickByUserNo(int userNo) {
		return tradeDao.selectUserNickByUserNo(userNo);
	}

	@Override
	public void setTradeDelete(int tradeNo) {
		
		HashMap<String, String> trade = tradeDao.selectTradeByTradeNo(tradeNo);
		
		tradeDao.deleteTradeCommentByTradeNo(tradeNo);
		tradeDao.deleteTradeReportByTradeNo(tradeNo);
		tradeDao.deleteTradeScrapByTradeNo(tradeNo);
		tradeDao.deleteTradeByTradeNo(tradeNo);
		
		if(trade.get("FILE_STORED") == null) {
			logger.info("삭제할 파일이 없습니다.");
		} else {
			tradeDao.deleteTradeFileByFileStored(trade.get("FILE_STORED"));
		}
		
	}

	@Override
	public boolean setTradeUpdateDeleteFile(com.khbill.dto.File file) {
		
		logger.info("file - {}", file);
		
		//삭제할 파일번호 조회
		int fileNo = tradeDao.selectFileNoByFileStored(file.getFileStored());
		
		//ztrade - file_no을 null로 변경
		tradeDao.updateTradeFileNullByFileNo(fileNo);
		
		//zfile - file 삭제
		tradeDao.deleteTradeFileByFileStored(file.getFileStored());
		
		int fileCnt = tradeDao.selectTradeFileCountByFileStored(file);
		
		if( fileCnt > 0 ) {
			return false;
		} else {
			return true;
		}
		
	}

	@Override
	public void setTradeUpdate(MultipartFile file, Trade trade) {
		
		if(file.getSize() <= 0) {
			logger.info("파일의 크기가 0, 추가된 파일 없음");
			
			tradeDao.updateTradeByTrade(trade);
			
			return;
		}
		
		//파일이 저장될 경로(RealPath)
		String storedPath = context.getRealPath("upload");
		logger.info("upload realPath : {}", storedPath); 
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//저장될 파일의 이름 생성하기
		String filename = file.getOriginalFilename(); //원본파일명
		filename += UUID.randomUUID().toString().split("-")[4]; //UUID추가
		logger.info("filename : {}", filename);
		
		
		//저장될 파일의 정보 객체 - java.util.File
		File dest = new File(storedFolder, filename);
		
		try {
			
			//업로드된 파일을 저장하기
			file.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int fileNo = tradeDao.selectFileNo();
		
		//DB에 기록할 정보 객체 - DTO
		com.khbill.dto.File tradeFile = new com.khbill.dto.File();
		tradeFile.setFileNo(fileNo);
		tradeFile.setFileSize((int)file.getSize());
		tradeFile.setFileOrigin(file.getOriginalFilename());
		tradeFile.setFileStored(filename);
		
		tradeDao.insertFile(tradeFile);
		
		trade.setFileNo(fileNo);
		
		tradeDao.updateTradeByTrade(trade);
		
	}

	@Override
	public boolean tradeReportByTradeNoLoginUserNo(TradeReport tradeReport) {
		int cnt = tradeDao.selectCntTradeReportCheck(tradeReport);
		
		if(cnt > 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void setTradeReport(TradeReport tradeReport) {
		
		HashMap<String, String> trade = tradeDao.selectTradeByTradeNo(tradeReport.getTradeNo());
		
		System.out.println(trade);
		String strUserNo = String.valueOf(trade.get("USER_NO"));
		
		int userNo = Integer.parseInt(strUserNo);
		
		tradeReport.setRespondentNo(userNo);
		
		tradeDao.insertTradeReport(tradeReport);
		
	}

	@Override
	public boolean setScrap(TradeScrap tradeScrap) {
		
		if(isScrap(tradeScrap)) { //스크랩을 한 상태
			tradeDao.deleteTradeScrap(tradeScrap);
			
			return false;
			
		} else { //스크랩을 하지 않은 상태
			tradeDao.insertTradeScrap(tradeScrap);
			
			return true;
		}
		
	}
	
	@Override
	public boolean isScrap(TradeScrap tradeScrap) {
		int cnt = tradeDao.selectCountScrap(tradeScrap);
		
		if(cnt > 0) { //스크랩을 한 상태
			return true;
		} else { //스크랩을 하지 않은 상태
			return false;
		}
		
	}

	@Override
	public List<Trade> getTradeHitList(Paging paging) {
		return tradeDao.selectTradeHitList(paging);
	}

	@Override
	public String getGradeUrlByUserNo(int userNo) {
		return tradeDao.selectGradeUrlByUserNo(userNo);
	}


}

package com.khbill.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.khbill.dao.face.ReviewCommentDao;
import com.khbill.dao.face.ReviewDao;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;
import com.khbill.dto.ReviewReport;
import com.khbill.dto.ReviewScrap;
import com.khbill.dto.User;
import com.khbill.service.face.ReviewService;
import com.khbill.util.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	@Autowired ReviewDao reviewDao;
	@Autowired ReviewCommentDao reviewCommentDao;
	
	@Autowired private ServletContext context;

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = reviewDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		paging.setTarget(paramData.getTarget());
		return paging;
	}

	@Override
	public List<Review> getReviewList(Paging paging) {
		
		return reviewDao.selectReviewList(paging);
	}

	@Override
	public List<Review> getReviewHitList(Paging paging) {
		
		return reviewDao.selectReviewHitList(paging);
	}

	@Override
	public HashMap<String, Object> getReviewDetail(Review review) {
		
		reviewDao.updatehit(review); //조회수 증가
		
		return reviewDao.selectReviewByReviewNo(review);
	}

	@Override
	public Item getReviewItem(int itemNo) {
		
		return reviewDao.selectItemByItemNo(itemNo);
	}

	@Override
	public com.khbill.dto.File getReviewFile(int fileNo) {
		
		return reviewDao.selectFileByFile(fileNo);
	}
	
	@Override
	public List<HashMap<String, Object>> getReviewComList(ReviewComment reviewComment) {

		return reviewCommentDao.selectReviewCommentByReview(reviewComment);
	}

	@Override
	public boolean deleteReviewComment(ReviewComment reviewComment) {
		
		reviewCommentDao.deleteReviewComment(reviewComment);
		
		if( reviewCommentDao.selectCountComment(reviewComment) > 0 ) {
			return false;
		} else {
			return true;
		}
	}

	   @Override
	   public void setReviewWrite(Review review, Item item, MultipartFile file) {
	      
	      //빈 파일
	      if( file.getSize() <= 0 ) {
	         return;
	      }
	      
	      int itemNo = item.getItemNo();
	      int fileNo = reviewDao.getNextFileNo();
	      
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
	      File dest = new File( storedPath, fileStored );
	      
	      try {
	         file.transferTo(dest); //업로드 파일 저장
	      } catch (IllegalStateException | IOException e) {
	         e.printStackTrace();
	      }
	      
	      //--------------------------------------------------------
	      com.khbill.dto.File reviewFile = new com.khbill.dto.File();
	      
	      reviewFile.setFileNo(fileNo);
	      reviewFile.setFileOrigin(fileOrigin);
	      reviewFile.setFileStored(fileStored);
	      reviewFile.setFileSize((int)file.getSize());
	      
	      review.setItemNo(itemNo);
	      review.setFileNo(fileNo);
	      
	      
	      reviewDao.insertFile(reviewFile);
	      reviewDao.insertReview(review);
	      reviewDao.updateUserPoint(review);
	   }

	@Override
	public com.khbill.dto.File getAttachFile(Review review) {
		
		return reviewDao.selectReviewFileByReviewNo(review);
	}

	@Override
	public void setReviewUpdate(Review review, MultipartFile file) {
		
//		if( "".equals(review.getReviewTitle()) ) {
//			review.setReviewTitle("(제목없음)");
//		}

		//----------------------------------------
		
		//빈 파일
		if( file.getSize() <= 0 ) {
			return;
		}
		
		int fileNo = reviewDao.getNextFileNo();
	
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload");

		File storedFolder = new File(storedPath);
		if (!storedFolder.exists()) {
			storedFolder.mkdir();
		}

		//저장될 파일의 이름 생성하기
		String fileOrigin = file.getOriginalFilename();
		String fileStored = UUID.randomUUID().toString().split("-")[4] + fileOrigin;

		// 저장할 파일 객체
		File dest = new File( storedPath, fileStored );

		try {
			file.transferTo(dest); // 업로드 파일 저장
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		//--------------------------------------------------------
		com.khbill.dto.File reviewFile = new com.khbill.dto.File();
		
		reviewFile.setFileOrigin(fileOrigin);
		reviewFile.setFileStored(fileStored);
		reviewFile.setFileSize((int)file.getSize());
		reviewFile.setFileNo(fileNo);

		review.setFileNo(fileNo);
		
		reviewDao.insertFile(reviewFile);
		reviewDao.update(review);
	}

	@Override
	public void setReviewDelete(Review review) {
		
		HashMap<String, Object> reviewMap = reviewDao.selectReviewByReviewNo(review);
		Item item = new Item();
		com.khbill.dto.File file = new com.khbill.dto.File();
		
		item.setItemNo(review.getItemNo());
		System.out.println(item.getItemNo());
		
		file.setFileNo(item.getFileNo());
		System.out.println(item.getFileNo());
		
		int itemNo = item.getItemNo();
		int fileNo = file.getFileNo();
		
		reviewDao.deleteReport(review);
		reviewDao.deleteScrap(review);
		reviewDao.deleteReview(review);
//		reviewDao.deleteItem(itemNo); 
		reviewDao.deleteFile(fileNo);
	}

	@Override
	public void setReviewCommentDelete(Review review) {
		reviewDao.deleteReviewCommentByReviewNo(review);
	}
		
	@Override
	public Review getReviewByReviewNo(int reviewNo) {
		return reviewDao.selectDeleteReviewByReviewNo(reviewNo);
	}


	@Override
	public boolean scrap(ReviewScrap reviewScrap) {
		if( isScrap(reviewScrap) ) { //스크랩을 한 상태
			reviewDao.deleteReviewScrap(reviewScrap);
			
			return false;
			
		} else { //스크랩을 하지 않은 상태
			reviewDao.insertReviewScrap(reviewScrap);
			
			return true;
		}
	}

	@Override
	public boolean isScrap(ReviewScrap reviewScrap) {
		int cnt = reviewDao.selectCountScrap(reviewScrap);
		
		if(cnt > 0) {	//스크랩한 상태
			return true;
		} else {		//스크랩 하지 않은 상태
			return false;
		}
	}

	@Override
	public void setReviewReport(ReviewReport reviewReport) {
		Review review = reviewDao.selectReviewByReview(reviewReport.getReviewNo());
		reviewReport.setRespondentNo(review.getUserNo());
		
		reviewDao.insertReviewReport(reviewReport);
	}

	@Override
	public boolean reviewReportByReviewNoLoginUserNo(ReviewReport reviewReport) {
		int cnt = reviewDao.selectCntReviewReportCheck(reviewReport);
		
		if(cnt > 0) {
			return false;
		} else {
			return true;
		}
	}
	
	//-------- Comment ---------------------------------------------------------------
	

	@Override
	public void setReviewCommentWrite(ReviewComment reviewComment) {
		
		reviewCommentDao.insertReviewComment(reviewComment);
	}
	
	@Override
	public ReviewComment getReviewCommentWriteByUserNo(int userNo) {
		
		return reviewCommentDao.selectReviewCommentByUserNo(userNo);
	}
	
	@Override
	public String getUserNickByUserNo(int userNo) {
		
		return reviewCommentDao.selectUserNickByUserNo(userNo);
	}
	
	@Override
	public String getGradeUrlByUserNo(int userNo) {
		return reviewCommentDao.selectGradeUrlByUserNo(userNo);
	}

	@Override
	public ReviewComment setReviewCommentUpdate(ReviewComment reviewComment) {
		
		reviewCommentDao.updateReviewComment(reviewComment);
		
		ReviewComment resultComment =  reviewCommentDao.selectOneReviewCommentByReviewNo(reviewComment.getReviewComNo());
		
		return resultComment;
	}



}

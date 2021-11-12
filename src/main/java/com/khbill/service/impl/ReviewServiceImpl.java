package com.khbill.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.khbill.dao.face.ReviewDao;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.User;
import com.khbill.service.face.ReviewService;
import com.khbill.util.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired ReviewDao reviewDao;
	@Autowired private ServletContext context;
	
	@Override
	public List<Review> getReviewList(Paging paging) {
		
		return reviewDao.selectReviewList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		
		int totalCount = reviewDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());

		return paging;
	}

	@Override
	public Review getReviewDetail(Review detailReview) {
		
		reviewDao.updatehit(detailReview); //조회수 증가
		
		return reviewDao.selectReviewByReviewNo(detailReview);
	}

	@Override
	public void setReviewWrite(Review review, User user, Item item, MultipartFile file) {
		
		//게시글 정보 처리
		if( "".equals(review.getReviewTitle()) ) {
			review.setReviewTitle("(제목없음)");
		}
		reviewDao.insertReview(review);
		
		//----------------------------------------------------
		
		//빈 파일
		if( file.getSize() <= 0 ) {
			return;
		}
		
		int userNo = review.getUserNo();
		int fileNo = reviewDao.getNextFileNo();
		int itemNo = reviewDao.getNextItemNo();
		int reviewNo = reviewDao.getNextreviewNo();	
				
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

		com.khbill.dto.File reviewfile = new com.khbill.dto.File();
		reviewfile.setFileOrigin(fileOrigin);
		reviewfile.setFileStored(fileStored);
		reviewfile.setFileSize((int)file.getSize());

		item.setUserNo(userNo);
		item.setFileNo(fileNo);
		item.setItemNo(itemNo);
		
		review.setReviewNo(reviewNo);
		
		reviewDao.insertFile(reviewfile);
		reviewDao.insertItem(item);
	}

	@Override
	public com.khbill.dto.File getAttachFile(Review detailReview) {
		return reviewDao.selectFileByReviewFileNo(detailReview);
	}

	
		
}

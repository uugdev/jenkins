package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.ReviewReport;
import com.khbill.util.Paging;

public interface AdminReviewReportDao {

	public List<ReviewReport> selectReviewReportList(Paging paging);

	public int selectCntAll(Paging paramData);
}

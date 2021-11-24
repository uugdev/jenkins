package com.khbill.controller;

import java.util.List;

import com.khbill.dto.ReviewReport;
import com.khbill.util.Paging;

public interface AdminReviewReportService {

	public Paging getPaging(Paging paramData);

	public List<ReviewReport> getReviewReportList(Paging paging);

	public boolean ReviewStatusToY(ReviewReport reviewReport);

	public boolean ReviewStatusToN(ReviewReport reviewReport);

}

package com.khbill.controller;

import java.util.List;

import com.khbill.dto.ReviewReport;
import com.khbill.util.Paging;

public interface AdminReviewReportService {

	Paging getPaging(Paging paramData);

	List<ReviewReport> getReviewReportList(Paging paging);

}

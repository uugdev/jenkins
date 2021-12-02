<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th, td {
	text-align: left;
}

td:nth-child(2) {
	text-align: left;
}

.ellipsis2 {
 	display: -webkit-box;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
/* 	line-height: 24px; */
/* 	max-height: 1.2em; */
	word-wrap: break-word;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	width: 162px;
}

#photoList {
	display: flex;
	margin: 0px;
	padding: 0px;
/* 	justify-content: space-between; */
	flex-wrap: wrap;
	width: 100%;
	margin-top: 50px;
	
}

#photoList li {
  margin-right: 10px;
    display: inline-block;
    width: 300px;
    margin-bottom: 30px;
    border-radius: 1px;
    overflow: hidden;
    box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
}

#photoList li:nth-child(3n+0) {
  margin-right: 0;
} 
</style>

<!-- <div> -->
<!-- <div id="ajaxArea"> -->

<ul id="photoList">
<c:forEach items="${reviewList}" var="review">
	<li>
		<c:if test="${review.REPORT_STATUS eq 'n' }">
			<div style="width: 100%; height: 250px;">
				<a href="/review/detail?reviewNo=${review.REVIEW_NO}">
				<img style="height: 100%;" alt="#" src="/upload/${review.FILE_STORED}">
				</a>		
			</div>
		</c:if>
		<c:if test="${review.REPORT_STATUS eq 'y' }">		
			<div style="width: 100%; height: 250px;">
				<a style="cursor: pointer;" onclick="reportStatusY();">
				<img style="height: 100%;" alt="#" src="/upload/${review.FILE_STORED}">
				</a>		
			</div>
		</c:if>
		
		<div style="border: 1px solid #ccc; border-top: none; box-sizing: border-box; padding: 0 5px 10px; ">
			<div style="padding-top: 8px; display:flex; align-items: flex-start; justify-content: space-between;">
				<span class="ellipsis2" style="text-align: left;">제목: ${review.REVIEW_TITLE}</span>
			</div>
			
			<div style="display:flex; align-items: flex-start; justify-content: space-between;">
				<c:if test="${review.USER_NICK eq null }">
					<span>탈퇴한 회원</span>
				</c:if>
				<c:if test="${review.USER_NICK ne null }">
					<span><img alt="#" src="${review.GRADE_URL}" style="width: 20px; height: 20px;">${review.USER_NICK }</span>
				</c:if>
			</div>
						
			<%-- 시간를 변환(yyyyMMdd)하여 변수에 저장하기 --%>
			<fmt:formatDate value="${review.REVIEW_DATE }" pattern="yyyyMMdd" var="timeStr" />
			
			<%--  현재 날짜 --%>
			<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="nowStr" />
			
			<div style="display: flex; align-items: flex-start; justify-content: space-between;">
				<c:choose>
					<c:when test="${timeStr lt nowStr }">
					   <fmt:formatDate value="${review.REVIEW_DATE }"  pattern="yy-MM-dd"/>
					</c:when>
					<c:when test="${timeStr eq nowStr }">
					   <fmt:formatDate value="${review.REVIEW_DATE }"  pattern="HH:mm"/>
					</c:when>
				</c:choose>
				<span class="">조회수: ${review.REVIEW_HIT}</span>
			</div>
		</div>
	</li>
</c:forEach>
</ul>

<span class="pull-left">총 ${paging.totalCount }개</span>
<c:if test="${login }">
	<button id="btnWrite" class="pull-right">글쓰기</button>
</c:if>
<div class="clearfix"></div>

<div class="list-search">
<div class="input_search_area">
	<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" value="${param.search }" placeholder="검색어를 입력해주세요" />
	<button id="btnSearch" class="btn btnSearch">검색</button>
	</div>
</div>
</div>

<c:import url="/WEB-INF/views/review/paging.jsp" />

<!-- 	</div>.container -->
<!-- </div>.wrap end -->
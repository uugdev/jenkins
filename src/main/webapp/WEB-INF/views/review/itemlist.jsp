<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<style type="text/css">
a {
	color: #000;
}

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
	width: 268px;
}

.ellipsis {
	display: -webkit-box;
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	max-height: 18px;
	white-space: normal;
	word-break: break-all;
	word-wrap: break-word;
	word-break: break-word;
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
	margin-right: 15px;
	display: inline-block;
	width: 296px;
	margin-bottom: 35px;
	border-radius: 1px;
	overflow: hidden;
	box-shadow: rgba(0, 0, 0, 0.15) 3px 3px 3px;
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
		<c:if test="${review.REPORT_STATUS eq 'y' }">
			<div style="width: 100%; height: 250px;">
				<a style="cursor: pointer;" onclick="reportStatusY();">
				<img style="height: 100%;" alt="#" src="/resources/img/unknownPic.png">
				</a>		
			</div>
		</c:if>
		<c:if test="${review.REPORT_STATUS eq 'n' }">
			<div style="width: 100%; height: 250px;">
				<a href="/review/detail?reviewNo=${review.REVIEW_NO}">
				<img style="height: 100%; width: 100%; object-fit: cover;" alt="#" src="/upload/${review.FILE_STORED}">
				</a>		
			</div>
		</c:if>
		
		<div style="box-sizing: border-box; padding: 0 5px 10px;">
			<div style="padding-top: 8px; display: flex;">
<!-- 		<div style="border: 1px solid #ccc; border-top: none; box-sizing: border-box; padding: 0 5px 10px; "> -->
<!-- 			<div style="padding-top: 8px; display:flex; align-items: flex-start; justify-content: space-between;"> -->
				<c:if test="${review.REPORT_STATUS eq 'y' }">
					<a style="cursor: pointer;" onclick="reportStatusY();">
						<span class="ellipsis" style="text-align: left;">${review.REVIEW_TITLE}</span>
					</a>
				</c:if>		
				<c:if test="${review.REPORT_STATUS eq 'n' }">
					<a href="/review/detail?reviewNo=${review.REVIEW_NO }">
						<span class="ellipsis" style="text-align: left;">${review.REVIEW_TITLE}</span>
					</a>
				</c:if>
						
				<c:if test="${review.REPORT_STATUS eq 'y' }">
					<c:if test="${not empty review.REVIEW_COM_CNT }">
						<strong><span class="tomato"><a onclick="reportStatusY();">&nbsp;[${review.REVIEW_COM_CNT}]</a></span></strong>
					</c:if>
				</c:if>
				<c:if test="${review.REPORT_STATUS eq 'n' }">
					<c:if test="${not empty review.REVIEW_COM_CNT }">
						<strong><span class="tomato"><a href="/review/detail?reviewNo=${review.REVIEW_NO }&commentFocus=true">&nbsp;[${review.REVIEW_COM_CNT}]</a></span></strong>
					</c:if>
				</c:if>
			</div>
			
			<div style="display:flex; align-items: flex-start; justify-content: space-between;">
				<c:if test="${review.USER_NICK eq null }">
					<span>탈퇴한 회원</span>
				</c:if>
				<c:if test="${review.USER_NICK ne null }">
					<span><img alt="#" src="${review.GRADE_URL}" style="width: 20px; height: 20px;">&nbsp;${review.USER_NICK }</span>
				</c:if>
			</div>
						
			<%-- 시간를 변환(yyyyMMdd)하여 변수에 저장하기 --%>
			<fmt:formatDate value="${review.REVIEW_DATE }" pattern="yyyyMMdd" var="timeStr" />
			
			<%--  현재 날짜 --%>
			<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="nowStr" />
			
			<div style="display: flex; align-items: flex-start; justify-content: space-between;">
				<c:choose>
					<c:when test="${timeStr lt nowStr }">
					   <span><fmt:formatDate value="${review.REVIEW_DATE }"  pattern="yy-MM-dd"/></span>
					</c:when>
					<c:when test="${timeStr eq nowStr }">
					   <span><fmt:formatDate value="${review.REVIEW_DATE }"  pattern="HH:mm"/></span>
					</c:when>
				</c:choose>
				<span class="">조회&nbsp;|&nbsp;${review.REVIEW_HIT}</span>
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
	<input class="form-control" type="text" id="search" value="${param.search }" placeholder="제목을 입력해주세요" />
	<button id="btnSearch" class="btn btnSearch">검색</button>
	</div>
</div>
</div>

<c:import url="/WEB-INF/views/review/paging.jsp" />

<!-- 	</div>.container -->
<!-- </div>.wrap end -->
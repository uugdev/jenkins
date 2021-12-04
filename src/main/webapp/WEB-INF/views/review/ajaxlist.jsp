<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>


<table class="table table-hover">
<tr>
	<th style="width: 10%; text-align: center;">글 번호</th>
	<th style="width: 54%; text-align: center;">제목</th>
	<th style="width: 15%; text-align: center; padding-right: 18px;">닉네임</th>
	<th style="width: 10%; text-align: center;">작성일</th>
	<th style="width: 10%; text-align: center;"">조회</th>
</tr>
<c:forEach items="${reviewList }" var="review">
<tr>
	<td>${review.REVIEW_NO }
	<c:if test="${review.REPORT_STATUS eq 'y' }">
		<td style="text-align: left;"><a style="cursor: pointer;" onclick="reportStatusY();">${review.REVIEW_TITLE }</a>
	</c:if>
	<c:if test="${review.REPORT_STATUS eq 'n' }">
		<td style="text-align: left;"><a href="/review/detail?reviewNo=${review.REVIEW_NO }">${review.REVIEW_TITLE }</a>
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
	
	</td>
	<c:if test="${review.USER_NICK eq null }">
		<td style="text-align: left;">탈퇴한 회원</td>
	</c:if>
	<c:if test="${review.USER_NICK ne null }">
		<td style="text-align: left;">
			<img alt="#" src="${review.GRADE_URL}" style="width: 20px; height: 20px;">&nbsp;${review.USER_NICK }
		</td>
	</c:if>

	<%-- 시간를 변환(yyyyMMdd)하여 변수에 저장하기 --%>
	<fmt:formatDate value="${review.REVIEW_DATE }" pattern="yyyyMMdd" var="timeStr" />
	
	<%--  현재 날짜 --%>
	<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="nowStr" />

	<td>
	<c:choose>
	    <c:when test="${timeStr lt nowStr }">
	        <fmt:formatDate value="${review.REVIEW_DATE }"  pattern="yy-MM-dd"/>
	    </c:when>
	    <c:when test="${timeStr eq nowStr }">
	        <fmt:formatDate value="${review.REVIEW_DATE }"  pattern="HH:mm"/>
	    </c:when>
    </c:choose>
	</td>
	
	<td>${review.REVIEW_HIT }</td>
</tr>
</c:forEach>
</table>

<span class="pull-left">total : ${paging.totalCount }</span>
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

<div class="clearfix"></div>

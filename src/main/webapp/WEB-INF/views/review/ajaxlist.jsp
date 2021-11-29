<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<table class="table table-hover">
<tr>
	<th>글 번호</th>
	<th>제목</th>
	<th>닉네임</th>
	<th>작성일</th>
	<th>조회</th>
</tr>
<c:forEach items="${reviewList }" var="review">
<tr>
	<td>${review.REVIEW_NO }</td>
	<td><a href="/review/detail?reviewNo=${review.REVIEW_NO }">${review.REVIEW_TITLE }</a></td>
<!-- 				title 옆 comment count 처리 -->
<%-- 				<c:if test="${review.REVIEW_NO }"> --%>
<%-- 					<strong><span> [${review.REVIEW_COM_NO }]</span></strong> --%>
<%-- 				</c:if> --%>
	<c:if test="${review.USER_NICK eq null }">
		<td>탈퇴한 회원</td>
	</c:if>
	<c:if test="${review.USER_NICK ne null }">
		<td style="text-align: left;">
			<img alt="#" src="${review.GRADE_URL}" style="width: 20px; height: 20px;"> ${review.USER_NICK }
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

<c:if test="${login }">
	<button id="btnWrite" class="pull-right">글쓰기</button>
</c:if>
<span class="pull-left">TOTAL ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/review/paging.jsp" />

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" value="${param.search }" />
	<button id="btnSearch" class="btn">검색</button>
</div>
<div class="clearfix"></div>

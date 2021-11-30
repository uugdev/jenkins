<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>


<table class="table table-hover">
<tr>
	<th width="13%">글 번호</th>
	<th width="49%">제목</th>
	<th width="18%">닉네임</th>
	<th width="10%">작성일</th>
	<th width="10%">조회</th>
</tr>
<c:forEach items="${reviewList }" var="review">
<tr>
	<td>${review.REVIEW_NO }
	<c:if test="${review.REPORT_STATUS eq 'n' }">
		<td style="text-align: left;"><a href="/review/detail?reviewNo=${review.REVIEW_NO }">${review.REVIEW_TITLE }</a>
	</c:if>
	<c:if test="${review.REPORT_STATUS eq 'y' }">
		<td style="text-align: left;"><a style="cursor: pointer;" onclick="reportStatusY();">${review.REVIEW_TITLE }</a>
	</c:if>
	<c:if test="${not empty review.REVIEW_COM_CNT }">
		<strong><span>[${review.REVIEW_COM_CNT}]</span></strong>
	</c:if>
	</td>
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

<span class="pull-left">총 ${paging.totalCount }개</span>
<c:if test="${login }">
	<button id="btnWrite" class="pull-right">글쓰기</button>
</c:if>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/review/paging.jsp" />

<div class="list-search">
<div class="input_search_area">
	<div class="input_component" style="width: 400px">
	<input type="text" id="search" name="search" value="${param.search }" placeholder="검색어를 입력해주세요" style="width: 200px;" />
	<button id="btnSearch" class="btn">검색</button>
	</div>
</div>
</div>
<div class="clearfix"></div>

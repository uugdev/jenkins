<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- <div> -->
<!-- <div id="ajaxArea"> -->
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 10%; text-align: center;">글번호</th>
			<th style="width: 54%; text-align: left;">제목</th>
			<th style="width: 15%; text-align: center; padding-right: 18px;">닉네임</th>
			<th style="width: 10%; text-align: center;">작성일</th>
			<th style="width: 10%; text-align: center;">조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="ask">
			<tr>
				<td style="text-align: center">${ask.ASK_NO }
				<c:if test="${ask.REPORT_STATUS eq 'n' }">
				 	<td style="text-align: left;"><a href="/ask/detail?askNo=${ask.ASK_NO }"><span>${ask.ASK_TITLE }</span></a> 
				</c:if>
				<c:if test="${ask.REPORT_STATUS eq 'y' }">
					<td style="text-align: left;"><a style="cursor: pointer;" onclick="reportStatusY();">${ask.ASK_TITLE }</a>
				</c:if>
				<c:if test="${not empty ask.ASK_COM_CNT }">
					<strong><span class="tomato"><a href="/ask/detail?askNo=${ask.ASK_NO }&commentFocus=true">[${ask.ASK_COM_CNT}]</a></span></strong>
				</c:if>
				</td>
				
				<c:if test="${ask.USER_NICK eq null}">
					<td style="text-align: left;">탈퇴한 회원</td>
				</c:if>
				<c:if test="${ask.USER_NICK ne null }">
					<td style="text-align: left;"><img alt="#"
						src="${ask.GRADE_URL}" style="width: 20px; height: 20px;">${ask.USER_NICK }</td>
				</c:if>


				<%-- 시간를 변환(yyyyMMdd)하여 변수에 저장하기 --%>
				<fmt:formatDate value="${ask.ASK_DATE }" pattern="yyyyMMdd"
					var="timeStr" />

				<%--  현재 날짜 --%>
				<fmt:formatDate value="<%=new Date()%>" pattern="yyyyMMdd"
					var="nowStr" />

				<td>
					<c:choose>
						<c:when test="${timeStr lt nowStr }">
							<fmt:formatDate value="${ask.ASK_DATE }" pattern="yy-MM-dd" />
						</c:when>
						<c:when test="${timeStr eq nowStr }">
							<fmt:formatDate value="${ask.ASK_DATE }" pattern="HH:mm" />
						</c:when>
					</c:choose>
				</td>
				<td style="text-align: center">${ask.ASK_HIT }</td>
			
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:if test="${login }">
	<button id="btnWrite" class="btn btn-primary pull-right">글쓰기</button>
</c:if>
<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search"
		value="${param.search }" />
	<button id="btnSearch" class="btn btnSearch">검색</button>
</div>
<c:import url="/WEB-INF/views/review/paging.jsp" />

<!-- 	</div>.container -->
<!-- </div>.wrap end -->

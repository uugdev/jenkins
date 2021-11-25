<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 10%;">글번호</th>
			<th style="width: 45%;">제목</th>
			<th style="width: 12%;">작성자</th>
			<th style="width: 10%;">조회수</th>
			<th style="width: 15%;">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${tradeList }" var="board">
			<tr>
				<td>${board.TRADE_NO }</td>
				<td>
					<a href="/trade/detail?tradeNo=${board.TRADE_NO }">
						<c:if test="${board.TRADE_CATEGORY eq 1 }">
							[삽니다] 
						</c:if>
						<c:if test="${board.TRADE_CATEGORY eq 0 }">
							[팝니다] 
						</c:if>
						${board.TRADE_TITLE }
					</a>
				</td>
				<c:if test="${board.USER_NICK eq null }">
					<td>
						탈퇴(된)한 회원
					</td>
				</c:if>
				<c:if test="${board.USER_NICK ne null }">
					<td style="text-align: left;">
						<img alt="#" src="${board.GRADE_URL}" style="width: 20px; height: 20px;"> ${board.USER_NICK }
					</td>
				</c:if>
				<td>${board.TRADE_HIT }</td>
				<td><fmt:formatDate value="${board.TRADE_DATE }" pattern="yy-MM-dd HH:mm:ss" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:if test="${login }">
	<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
</c:if>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search"
		value="${param.search }" />
	<button id="btnSearch" class="btn">검색</button>
</div>
<c:import url="/WEB-INF/views/review/paging.jsp" />
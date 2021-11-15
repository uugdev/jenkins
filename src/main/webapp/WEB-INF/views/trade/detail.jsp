<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/tradeDetail.css" />
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

	<h1>${tradeDetail.TRADE_TITLE }</h1>
	<span style="float: left;">
		${tradeDetail.USER_NICK } | <fmt:formatDate value="${tradeDetail.TRADE_DATE }" pattern="YYYY-MM-dd HH:ss" />
	</span>
	<span style="float: right;">
		신고 | 조회 ${tradeDetail.TRADE_HIT } | 댓글 4
	</span>
	<hr style="margin-top: 40px;">
	
	<div id="detailMain" style="height: 500px;">
		<img alt="#" src="/upload/9d81efffd473main.PNG">
		<div id="writeContent">
			${tradeDetail.TRADE_CONTENT }
		</div>
	</div>
	
	<!-- 댓글 리스트 -->
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th style="width: 10%;">작성자</th>
				<th style="width: 5%;"></th>
				<th style="width: 70%;">댓글</th>
				<th style="width: 10%;">작성일</th>
				<th style="width: 5%;"></th>
			</tr>
		</thead>
	
		<tbody id="commentBody">
			<c:forEach items="${tradeComment}" var="tradeComment">
				<tr data-tradeComNo="${tradeComment.TRADE_COM_NO }">
					<c:choose>
	                	<c:when test="${tradeComment.TRADE_COM_SECRET eq 'n' }">
						<!-- 비밀글이 아닐 경우 -->
						
							<td style="width: 10%;">${tradeComment.USER_NICK }</td>
							<td style="width: 5%;"></td>
							<td style="width: 70%;">${tradeComment.TRADE_COM_CONTENT }</td>
							<td style="width: 10%;">
								<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd hh:mm:ss" />
							</td>
							<td style="width: 5%;">
								<c:if test="${sessionScope.userNo eq tradeComment.USER_NO }">
									<button class="btn btn-default btn-xs"
											onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
											삭제
									</button>
								</c:if>
							</td>
						</c:when>
						
	                	<c:when test="${tradeComment.TRADE_COM_SECRET eq 'y' }">
						<!-- 비밀글일 경우 -->
						
	                		<!-- 게시글 유저와 글쓴이가 아닐 경우 -->
	                		<c:if test="${sessionScope.userNo ne tradeDetail.USER_NO and sessionScope.userNo ne tradeComment.USER_NO }">
								<td style="width: 10%;"></td>
								<td style="width: 5%;">
									<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">
								</td>
								<td style="width: 70%;">비밀글입니다!</td>
								<td style="width: 10%;"></td>
								<td style="width: 50%;"></td>
	                		</c:if>

	                		<c:if test="${sessionScope.userNo eq tradeDetail.USER_NO or sessionScope.userNo eq tradeDetail.USER_NO }">
								<td style="width: 10%;">${tradeComment.USER_NICK }</td>
								<td style="width: 5%;">
									<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">
								</td>
								<td style="width: 70%;">${tradeComment.TRADE_COM_CONTENT }</td>
								<td style="width: 10%;">
									<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd hh:mm:ss" />
								</td>
								<td style="width: 5%;">
									<c:if test="${sessionScope.userNo eq tradeComment.USER_NO }">
										<button class="btn btn-default btn-xs"
												onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
												삭제
										</button>
									</c:if>
								</td>
	                		</c:if>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<!-- 댓글 리스트 end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


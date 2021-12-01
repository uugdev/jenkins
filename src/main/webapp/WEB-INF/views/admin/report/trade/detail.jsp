<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />

<link rel="stylesheet" type="text/css" href="/resources/css/reportPopup.css">
<!-- header end -->

<style type="text/css">
#detailMain img {
	width: 400px;
	height: 400px;
	object-fit: scale-down;
}

#writeContent {
	margin-bottom: 15px;
	margin-top: 15px;
}

hr {
	margin-bottom: 15px;
	margin-top: 15px;
}

#commentBody {
	text-align: left;
}

#commentBody td:nth-child(2){
	text-align: center;
}

.table {
	margin-bottom: 0;
}


.layerbox {
	position: relative;
	display: inline-block;
}

.layerpopup {
	width: 500px;
}

.layerpopup:hover {
	width: 500px;
	cursor: pointer;
	text-decoration: underline;
	color: #667F92;
}

#layer {
	display: none;
	padding: 10px;
	background: #fff;
	position: absolute;
	top: 195px;
	left: 490px;
	z-index: 1;
	width: 110px;
	height: 120px;
	box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
	padding: 0;
}

#layer>ul {
	list-style: none;
	padding-left: 0;
}

#layer>ul>li {
	line-height: 40px;
}

#layer>ul>li:hover {
	background-color: #a1b8c9;
	cursor: pointer;
}

#layer>ul>li>a {
	display: block;
	color: #667F92;
}

#layer>ul>li>a:hover {
	color: #FFF;
	cursor: pointer;
	text-decoration: none;
}

.layerClose {
	font-size: 15px;
	float: right;
}

.layerpopup:hover, #layerClose:hover {
	cursor: pointer;
}

.button {
    height: 35px;
    width: 75px;
    border-radius: 0px;
    border: 0px;
    background: #5b6e7a;
    color: #f3f3f3;
}

.button:hover {
    border: 1px solid #5b6e7a;
    background: #fff;
    color: #5b6e7a;
    transition: all .2s ease-in-out;
}

.container {
	margin-top: 50px;
	text-align: center;
    width: 1050px;
}
</style>

<div class="wrap">
<div class="container">
	<div class="list-group-item list-group-item-danger">
	<c:if test="${tradeDetail.REPORT_NO eq review.RESPONDENT_NO }">
		<c:choose>
			<c:when test="${tradeDetail.REPORT_CATEGORY eq 'A' }">
				<td>부적절한 홍보 게시글</td>
			</c:when>
			<c:when test="${tradeDetail.REPORT_CATEGORY eq 'B' }">
				<td>음란성 또는 청소년에게 부적합한 내용</td>
			</c:when>
			<c:when test="${tradeDetail.REPORT_CATEGORY eq 'C' }">
				<td>명예훼손/사생활 침해 및 저작권침해등</td>
			</c:when>
			<c:when test="${tradeDetail.REPORT_CATEGORY eq 'D' }">
				<td>기타</td>
			</c:when>
		</c:choose>
	</c:if>
	</div>
	<div class="list-group-item"><label for="${tradeDetail.REPORT_NO }">${tradeDetail.REPORT_CONTENT }</label></div>
	<h1>
		<c:if test="${tradeDetail.TRADE_CATEGORY eq 1 }">
			[삽니다] 
		</c:if>
		<c:if test="${tradeDetail.TRADE_CATEGORY eq 0 }">
			[팝니다] 
		</c:if>
		${tradeDetail.TRADE_TITLE }
	</h1>
		<span style="float: left;">
		<c:if test="${tradeDetail.USER_NO eq null }">
			탈퇴한 회원
		</c:if>
		<c:if test="${tradeDetail.USER_NO ne null }">
			${tradeDetail.USER_NICK }
		</c:if>
			| <fmt:formatDate value="${tradeDetail.TRADE_DATE }" pattern="YYYY-MM-dd HH:ss" />
		</span>
		<span style="float: right;">
			 | 조회 ${tradeDetail.TRADE_HIT } | 댓글 <span id="tradeComCount">${tradeDetail.TRADE_COM_COUNT }</span>
		</span>
		<hr style="margin-top: 40px;">
		
		<div id="detailMain" style="height: auto; padding-top: 20px; padding-bottom: 20px;">
			<c:if test="${tradeDetail.FILE_STORED ne null }">
				<img alt="#" src="/upload/${tradeDetail.FILE_STORED }">
			</c:if>
			<div id="writeContent">
				${tradeDetail.TRADE_CONTENT }
			</div>
		</div>
	
		<!-- 댓글 처리 -->
		<hr>
		<div>
		
			<!-- 댓글 리스트 -->
			<table class="table table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 4%;"></th>
						<th style="width: 12%;">작성자</th>
						<th style="width: 62%;">댓글</th>
						<th style="width: 12%;">작성일</th>
						<th style="width: 10%;"></th>
					</tr>
				</thead>
			
				<tbody id="commentBody">
					<c:forEach items="${tradeComment }" var="tradeComment">
						<tr data-updateTradeComNo="${tradeComment.TRADE_COM_NO }"></tr>
						<tr data-tradeComNo="${tradeComment.TRADE_COM_NO }">
							<c:choose>
			                	<c:when test="${tradeComment.TRADE_COM_SECRET eq 'y' }">
								<!-- 비밀글일 경우 -->
									
									<!-- 게시글 유저와 비밀글쓴이일 경우 -->
									<td style="width: 4%; text-align: center;">
										<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">
									</td>
									<td style="text-align: left;">
										<img alt="#" src="${tradeComment.GRADE_URL }" width="20px;" height="20px;"> ${tradeComment.USER_NICK }
									</td>
									<td id="td${tradeComment.TRADE_COM_NO }" style="width: 66%;">${tradeComment.TRADE_COM_CONTENT }</td>
									<td id="dateTd${tradeComment.TRADE_COM_NO }" style="width: 10%;">
										<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
									</td>
									<td style="width: 10%;"></td>
								</c:when>
							
			                	<c:when test="${tradeComment.TRADE_COM_SECRET eq 'n' }">
								<!-- 비밀글이 아닐 경우 -->
									<td style="width: 4%;"></td>
									<td style="text-align: left;">
										<img alt="#" src="${tradeComment.GRADE_URL }" width="20px;" height="20px;"> ${tradeComment.USER_NICK }
									</td>
									<td id="td${tradeComment.TRADE_COM_NO }" style="width: 66%;">${tradeComment.TRADE_COM_CONTENT }</td>
									<td id="dateTd${tradeComment.TRADE_COM_NO }" style="width: 10%;">
										<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
									</td>
									<td style="width: 10%;"></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<hr style="border: 1px solid #ddd; margin-top: 0;">
			
		</div><!-- 댓글 리스트 end -->
		
		<div class="text-center">
			<a href="/admin/report/trade/list"><button class="btn btn-default">목록</button></a>
		</div>
		
	</div><!-- .container end -->
</div><!-- .wrap end -->
<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
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

</style>

<style type="text/css">
.container {
	text-align: center;
    width: 1050px;
}

.layerbox {
	position: relative;
	display: inline-block;
}

.layerpopup {
	width: 500px;
}

#layer { 
	display:none; padding:10px; background:#F2F2F2;
	position: absolute;
	top: 24px;
	left: 0;
	z-index: 1;
	width: 130px;
}

.layerClose {
	font-size:15px; float: right;
}

.layerpopup:hover, #layerClose:hover {
	cursor:pointer; 
}

.wrap {
/* 	margin-bottom: 50px; */
	background:#f2f2f2; 
}

table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

.success {
	width: 65px;
	height: 65px;
}

#item {
	margin: 15px auto 15px;
	padding: 50px 0;
	border-top: 1px solid #000;
	display: flex;
}

#votedate {
	text-align: center;
	font-size: 20px;
	margin-top: 60px;
}

.check {
	display: flex;
	justify-content: space-between;
	text-align: center;
	width: 641px;
	margin: 0 auto;
	text-align: center;
}

#itemImg {
	
	object-fit: scale-down;
}

.vote {
	width: 60px;
	height: 60px;
}

.cnt {
	font-size: 20px;
	margin: 0 10px;
}

#chartBox {
	width: 418px;
	margin: 15px;
    height: 35px;
    border-radius: 20px;
    overflow: hidden;
}

.item-wrapper {
	height: 35px !important;
	
}

.item-percentage {
	line-height: 32px;
	color: #f2f2f2 !important;
}

.recipeWrap {
/*  	width: 700px; */
	width: 1050px;
	margin: 50px auto 0;
	padding: 15px;
	background: #fff;
	padding: 50px;
}

.logo {
	margin: 25px 0 15px;
	text-align: center;
}

.logo img {
	width: 200px;
}

.title p:nth-child(1) {
	font-size: 32px;
	font-weight: 500;
	margin: 30px 0;
}

.title .bar {
	display: inline-block;
	margin: 0 15px;
	color: #777777;
}

.title .username {
	cursor: pointer;
}

.btnWrap {
	text-align: right;
}

.btnWrap button {
	width: 83px;
	height: 35px;
	background: transparent;
	border: 1px solid #333;
	font-weight: 600;
	margin-left: 3px;
}


.lineInfo {
	margin-top: 20px;
	border-bottom: 3px solid #585858;
	border-top: 3px solid #585858;
}

.lineInfo ul {
	padding: 10px 0;
	margin: 0;
	list-style: none;
	overflow: hidden;
}

.lineInfo li {
	float: left;
	line-height: 30px;
}

.lineInfo li+li {
	position: relative;
}

.lineInfo li+li:after {
	position: absolute;
/* 	top: 6px; */
 	top: 1px; 
	left: 0;
	content: '';
	clear: both;
	display: inline-block;
	width: 1px;
/* 	height: 15px; */
 	height: 28px; 
	background: #333;
}

.lineInfo li:nth-child(1) {
	width: 20%;
}

.lineInfo li:nth-child(2) {
	width: 40%;
}

.lineInfo li:nth-child(3) {
	width: 40%;
}

.lineInfo li dl {
	margin: 0;
	padding: 5px 0;
}

.lineInfo li dl dt, .lineInfo li dl dd {
	float: left;
}

.lineInfo li dl dt {
	width: 80px;
}

.lineInfo li dl dd {
	text-align: left;
	width: calc(100% - 80px);
	word-break: break-all;
}

.barcode:before {
	position: absolute;
	top: 0;
	left: 16px;
	content: '';
	clear: both;
	display: inline-block;
	width: 1050px;
	border-top: 3px dashed #f2f2f2;
	content: '';
}

.barcode img {
	width: 100%;
	margin-top: 20px;
	padding-right: 10px;
}

.bottom {
	position: absolute;
	bottom: -18px;
	left: -1px;
	width: 100%;
	height: 21px;
	background-image: url("/resources/img/bottom.png");
	background-repeat: repeat;
	background-repeat-y: no-repeat;
}

.content {
	text-align: center; 
	padding: 30px 0 15px 0;
	margin: 0 20px 0 20px;
}

.content + p {
	margin: 0px;
}

.priceWrap {
	display: flex;
	justify-content: space-between;
	font-weight: 700;
	font-size: 24px;
}

.priceText {
	text-align: left;
	margin-left: 20px;
}

.price {
	text-align: right;
	margin-right: 20px;
}

#btnUpdate, #btnDelete, #btnList {
	background: #808080;
	border-radius: 0px;
	height: 35px;
	border: 1px solid #808080;
	color: #fff;
	padding: 0 15px;
}

#btnUpdate:hover, #btnDelete:hover, #btnList:hover {
	border: 1px solid #808080;
	background: #fff;
	color: #808080;
	transition: all .2s ease-in-out;
}
</style>

<div class="wrap">
<div class="container">

<div class="recipeWrap">
<div class="list-group">
	<div class="list-group-item list-group-item-danger">
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
	</div>
	<div class="list-group-item"><label for="${tradeDetail.REPORT_NO }">${tradeDetail.REPORT_CONTENT }</label></div>
</div>
<div style="font-size: 20px;">
<p>
	<c:if test="${tradeDetail.TRADE_CATEGORY eq 1 }">
		[삽니다] 
	</c:if>
	<c:if test="${tradeDetail.TRADE_CATEGORY eq 0 }">
		[팝니다] 
	</c:if>
</p>
</div>
<p style="font-size: 32px; margin-bottom: 20px;">
	${tradeDetail.TRADE_TITLE }
</p>

<div class="layerbox">
	<span>
		<c:if test="${tradeDetail.USER_NO eq null }">
			탈퇴한 회원
		</c:if>
		<c:if test="${tradeDetail.USER_NO ne null }">${tradeDetail.USER_NICK }
		</c:if>
	</span>
	<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	<span><fmt:formatDate value="${tradeDetail.TRADE_DATE }" pattern="YYYY-MM-dd HH:ss" /></span>
	<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	<span>조회 <span id="cntCom">${tradeDetail.TRADE_HIT }</span></span>
	<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	<span> 댓글 <span id="tradeComCount">${tradeDetail.TRADE_COM_COUNT }</span></span>
</div><!-- #layerbox end -->

<hr style="margin-top: 20px;">
		
<div id="detailMain" style="height: auto; padding-top: 20px; padding-bottom: 20px;">
	<c:if test="${tradeDetail.FILE_STORED ne null }">
		<img alt="#" src="/upload/${tradeDetail.FILE_STORED }">
	</c:if>
	<div id="writeContent">
		${tradeDetail.TRADE_CONTENT }
	</div>
</div>
<!-- 댓글 처리 -->

</div><!-- .recipeWrap end -->	

<!-- 댓글 리스트 -->
<table class="table table-hover table-condensed" style="margin-top: 50px;">
<thead>
	<tr>
		<th style="width: 4%;"></th>
		<th style="width: 15%;">닉네임</th>
		<th style="width: 58%;">댓글</th>
		<th style="width: 13%;">작성일</th>
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
				<td style="text-align: left; width: 15%;">
					<img alt="#" src="${tradeComment.GRADE_URL }" width="20px;" height="20px;"> ${tradeComment.USER_NICK }
				</td>
				<td id="td${tradeComment.TRADE_COM_NO }" style="width: 58%;">${tradeComment.TRADE_COM_CONTENT }</td>
				<td id="dateTd${tradeComment.TRADE_COM_NO }" style="width: 13%;">
					<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
				</td>
				<td style="width: 10%;"></td>
			</c:when>
		
           	<c:when test="${tradeComment.TRADE_COM_SECRET eq 'n' }">
			<!-- 비밀글이 아닐 경우 -->
				
				<td style="width: 4%;"></td>
				<td style="text-align: left; width: 15%;"">
					<img alt="#" src="${tradeComment.GRADE_URL }" width="20px;" height="20px;"> ${tradeComment.USER_NICK }
				</td>
				<td id="td${tradeComment.TRADE_COM_NO }" style="width: 58%;">${tradeComment.TRADE_COM_CONTENT }</td>
				<td id="dateTd${tradeComment.TRADE_COM_NO }" style="width: 13%;">
					<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
				</td>
				<td style="width: 10%;"></td>
			</c:when>
		</c:choose>
	</tr>
</c:forEach>
</tbody>
</table>
		
<div class="text-center" style="margin-bottom: 100px; margin-top: 50px;">
	<a href="/admin/report/trade/list"><button id="btnList">목록</button></a>
</div>
<br>

</div><!-- .container end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

</div><!-- .wrap end -->
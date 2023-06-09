<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />

<link rel="stylesheet" type="text/css" href="/resources/css/reportPopup.css">
<!-- header end -->



<style type="text/css">
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
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
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

.barcode {
	position: relative;
	margin: 0 auto;
	background: #fff;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	/* 	border-bottom-left-radius: 6px; */
	/* 	border-bottom-right-radius: 6px; */
/* 	width: 700px; */
	width: 1050px;
	padding: 20px 25px;
}

.barcode:before {
	position: absolute;
	top: 0;
	left: 16px;
	content: '';
	clear: both;
	display: inline-block;
/* 	width: 665px; */
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
			<c:when test="${review.REPORT_CATEGORY eq 'A' }">
				<td>부적절한 홍보 게시글</td>
			</c:when>
			<c:when test="${review.REPORT_CATEGORY eq 'B' }">
				<td>음란성 또는 청소년에게 부적합한 내용</td>
			</c:when>
			<c:when test="${review.REPORT_CATEGORY eq 'C' }">
				<td>명예훼손/사생활 침해 및 저작권침해등</td>
			</c:when>
			<c:when test="${review.REPORT_CATEGORY eq 'D' }">
				<td>기타</td>
			</c:when>
		</c:choose>
 	</div>
	<div class="list-group-item"><label for="${review.REPORT_NO }">${review.REPORT_CONTENT }</label></div>
</div>
	<div class="title">
		<P style="text-align: center;">${review.REVIEW_TITLE }</P>
	</div>
	<div class="layerbox">
		<span>		
			<c:if test="${review.USER_NO eq null }">
				탈퇴한 회원
			</c:if>
			<c:if test="${sessionScope.userNo eq review.USER_NO || empty sessionScope.userNo }">
				${review.USER_NICK }
			</c:if>
			<c:if test="${review.USER_NO ne null and sessionScope.userNo ne review.USER_NO and !empty sessionScope.userNo }">
				${review.USER_NICK }
			</c:if>
		</span>
		<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
		<span><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy-MM-dd HH:mm"/></span>
		<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>				
		<span>조회 <span id="cntCom">${review.REVIEW_HIT }</span></span>
		<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span><span>댓글 ${review.REVIEW_COM_COUNT }</span>
	</div><!-- #layerbox end -->
	
	<div class="lineInfo">
		<ul>
			<li>
				<dl class="clearfix">
					<dt>NO</dt>
					<dd>${review.REVIEW_NO }</dd>
				</dl>
			</li>
			<li>
				<dl class="clearfix">
					<dt>BRAND</dt>
					<dd>${item.itemBrand}</dd>
				</dl>
			</li>
			<li>
				<dl class="clearfix">
					<dt>NAME</dt>
					<dd>${item.itemName }</dd>
				</dl>
			</li>
		</ul>
	</div>
		
	<div id="item">
		<img id="itemImg" src="/upload/${file.fileStored}" alt="상품사진" 
			class="img-responsive center-block" alt="Responsive image" />
	</div>
	<div style="border-top: 1px solid #000;">
		<div class="content">
			${review.REVIEW_CONTENT }
		</div>
	</div>
	<div class="priceWrap" style="text-align: center; padding: 20px 0; border-top: 1px solid #000;">
		<p class="priceText">PRICE</p>
		<p class="price">
			￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.itemPrice }"/>
		</p>
	</div>
</div><!-- .recipeWrap end -->

<div class="barcode">
	<img alt="#" src="/resources/img/askBarcode2.png">
	<div class="bottom"></div>
</div>

<!-- 댓글 처리 -->
<hr>
<div class="text-center" style="margin-bottom: 100px;">
	<!-- 댓글 리스트 -->
	<table class="table table-hover table-condensed">
	<thead>
	<tr>
		<th style="width: 20%;">닉네임</th>
		<th style="width: 60%;">댓글</th>
		<th style="width: 20%;">작성일</th>
	</tr>
	</thead>

	<tbody id="commentBody">
	<c:forEach items="${commentList }" var="reviewComment">
	<tr data-reviewComNo="${reviewComment.REVIEW_COM_NO }">
		<c:if test="${reviewComment.USER_NICK eq null}">
			<td style="width: 20%;">탈퇴한 회원</td>
		</c:if>
		<c:if test="${reviewComment.USER_NICK ne null }">
			<td style="width: 20%;">${reviewComment.USER_NICK }</td>
		</c:if>
		<td style="width: 60%;">${reviewComment.REVIEW_COM_CONTENT }</td>
		<td style="width: 20%;"><fmt:formatDate value="${reviewComment.REVIEW_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" /></td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	<!-- 댓글 리스트 end -->

</div><!-- 댓글 처리 end -->

<div class="text-center" style="margin-bottom: 100px;">
	<a href="/admin/report/review/list"><button id="btnList">목록</button></a>
</div>
<br>

</div><!-- .container end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

</div><!-- .wrap end -->
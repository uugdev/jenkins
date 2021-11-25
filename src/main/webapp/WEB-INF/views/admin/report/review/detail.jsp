<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />

<link rel="stylesheet" type="text/css" href="/resources/css/reportPopup.css">
<!-- header end -->

<style type="text/css">
// Class
#item .center-block {
/*   display: block; */
  margin-left: auto;
  margin-right: auto;
}
</style>

<div class="wrap">
<div class="container">

<h1 style="text-align: center;">${review.REVIEW_TITLE }</h1>
<hr>

<span class="pull-left">작성자 ${review.USER_NICK }</span>
<span class="pull-left"></span>
<span><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy-MM-dd HH:mm"/></span>

<span class="pull-right">조회수 ${review.REVIEW_HIT }</span>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 33%;">브랜드</th>
			<th style="width: 33%;">상품명</th>
			<th style="width: 33%;">가격</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${item.itemBrand }</td>		
			<td>${item.itemName }</td>		
			<td>${item.itemPrice }원</td>	
		</tr>
	</tbody>
</table>

<div id="item" class="center-block">
	<img id="itemImg" src="/upload/${file.fileStored}" class="img-responsive" alt="Responsive image" />
</div>

<div style="text-align: center;">${review.REVIEW_CONTENT }</div><!-- 본문 -->
<hr>

<!-- 댓글 처리 -->
<div>
	<!-- 댓글 리스트 -->
	<table class="table table-striped table-hover table-condensed">
	<thead>
	<tr>
		<!-- 		<th style="width: 5%;">번호</th> -->
		<th style="width: 10%;">작성자</th>
		<th style="width: 65%;">댓글</th>
		<th style="width: 20%;">작성일</th>
	</tr>
	</thead>

	<tbody id="commentBody">
	<c:forEach items="${commentList }" var="reviewComment">
	<tr data-reviewComNo="${reviewComment.REVIEW_COM_NO }">
		<td style="width: 10%;">${reviewComment.USER_NICK }</td>
		<td style="width: 50%;">${reviewComment.REVIEW_COM_CONTENT }</td>
		<td style="width: 20%;"><fmt:formatDate value="${reviewComment.REVIEW_COM_DATE }" pattern="yy-MM-dd hh:mm:ss" /></td>
	</tr>
	</c:forEach>
	</table>
	<!-- 댓글 리스트 end -->

</div><!-- 댓글 처리 end -->

<div class="text-center">
	<a href="/admin/report/review/list"><button class="btn btn-default">목록</button></a>
</div>
<br>

</div><!-- .container end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

</div><!-- .wrap end -->
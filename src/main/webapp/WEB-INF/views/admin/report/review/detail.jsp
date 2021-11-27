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
.container {
	padding-top: 50px;
}
</style>


<div class="wrap">
<div class="container">

<div class="list-group">
  <div class="list-group-item list-group-item-danger">
		<c:if test="${review.REPORT_NO eq review.RESPONDENT_NO }">
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
		</c:if>
  </div>
  <div class="list-group-item"><label for="${review.REPORT_NO }">${review.REPORT_CONTENT }</label></div>
</div> 

<h1 style="text-align: center;">${review.REVIEW_TITLE }</h1>
<hr>

<span class="pull-left">작성자 ${review.USER_NICK }</span>
<span class="pull-left"></span>
<span><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy-MM-dd HH:mm"/></span>

<span class="pull-right">조회수 ${review.REVIEW_HIT }</span>
<br>


<!-- <table class="table table-hover"> -->
<!-- 	<tr> -->
<!-- 		<th>신고 사유</th> -->
<!-- 		<td> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>신고 내용</th> -->
<%-- 		<td><label for="${review.REPORT_NO }">${review.REPORT_CONTENT }</label></td> --%>
<!-- 	</tr> -->
<!-- </table> -->

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
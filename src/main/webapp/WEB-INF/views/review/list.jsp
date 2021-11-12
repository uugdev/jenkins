<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html lang="ko">
<head>
    <%--page title--%>
    <title>이건못참조</title>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
<%--header--%>
<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		$(location).attr("href", "/review/write");
// 		location.href = "/board/write";
	})
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>

<div class="container">

<h1 style="text-align: center;">구매 후기</h1>
<hr>
<!-- 구분선 삭제 예정 -->
<span class="pull-left">총게시글수  ${paging.totalCount }</span>
<div class="clearfix"></div>
<br>

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 20%;">닉네임</th>
		<th style="width: 15%;">작성일</th>
		<th style="width: 10%;">조회수</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${review }" var="review">
	<tr>
		<td>${review.REVIEW_NO }</td>
		<td><a href="/review/detail?review_no=${review.REVIEW_NO }">${review.REVIEW_TITLE }</a></td>
		<td>${review.USER_NICK }</td>
		<td><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
		<td>${review.REVIEW_HIT }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->


<%--footer--%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>
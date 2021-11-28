<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script type="text/javascript">
$(document).ready(function(){

	$("#btnWrite").click(function(){
		location.href="/qna/write";
	})
})
</script>

<style type="text/css">

body {
	background: #f2f2f2;
}

.title {
	margin: 50px 0;
}

.title > p {
	color: #85969E;
}

.listTable {
	text-align: center;
	width: 100%;
	background: #fff;
	margin: auto;
	margin-bottom: 50px;
	padding: 50px;
	padding-bottom: 20px;
}

th {
	background: #f3f3f3;
}

.table>tbody>tr>td {
	height: 50px;
	vertical-align: middle;
}

.table>tbody>tr>td>a {
	color: #000;
}
.table>tbody>tr>td>a:hover {
	color: #85969E;
	text-decoration: none;
}

#btnWrite {
	height: 35px;
	width: 65px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

#btnWrite:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="title">
	<h1>나의 문의 목록</h1>
	<p>질문을 남겨주시면 신속한 답변 드리겠습니다.</p>
</div>

<div class="listTable">
<table class="table table-hover">
<tr>
	<th>문의번호</th>
	<th width="60%">제목</th>
	<th>답변여부</th>
	<th>작성일</th>
</tr>
<c:forEach items="${list }" var="i">
<tr>
	<td>${i.qnaNo }</td>
	<td><a href="/qna/detail?qnaNo=${i.qnaNo }">${i.qnaTitle }</a></td>
	<td><c:if test="${i.qnaStatus == 'n' }">답변대기중</c:if>
	<c:if test="${i.qnaStatus == 'y' }">답변완료</c:if></td>
	<td><fmt:formatDate value="${i.qnaDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</table>
<button id="btnWrite" class="pull-right">글쓰기</button>
<div class="clearfix"></div>
<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .table end -->




</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


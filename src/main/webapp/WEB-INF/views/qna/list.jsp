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
	$("#btnBack").click(function(){
		history.go(-1);
	})
	
	$("#qnaWrite").click(function(){
		location.href="/qna/write";
	})
})
</script>

<style type="text/css">

table {
	text-align: center;
}

th, td {
	text-align: center;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>나의 문의 목록</h3>
<hr>

<table class="table table-hover table-condensed">
<tr>
	<th>문의번호</th>
	<th width="45%">제목</th>
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
<button id="qnaWrite" class="pull-right">글쓰기</button>

<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

<button id="btnBack">뒤로가기</button>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script type="text/javascript">
$(document).ready(function(){
	

})
</script>

<style type="text/css">

table {
	text-align: center;
	margin: auto;
}

th, td {
	text-align: center;
}


</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>문의 목록</h3>
<hr>
<table class="table table-hover table-condensed">
<tr>
	<th>문의 번호</th>
	<th width="45%">제목</th>
	<th>답변 여부</th>
	<th>작성일</th>
</tr>
<c:forEach items="${list }" var="i">
<tr>
	<td>${i.qnaNo }</td>
	<td><a href="/admin/qna/detail?qnaNo=${i.qnaNo }">${i.qnaTitle }</a></td>
	<td>
		<c:if test="${i.qnaStatus == 'y' }">답변 완료</c:if>
		<c:if test="${i.qnaStatus == 'n' }">답변 대기중</c:if>
	</td>
	<td><fmt:formatDate value="${i.qnaDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</table>
<span class="pull-right">총 ${paging.totalCount }개</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">
$(document).ready(function() {
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/notice/list?search="+$("#search").val();
	});
})
</script>


<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>공지사항 목록</h3>
<hr>
<div class="text-center" style="width: 700px; margin: 0 auto;">
	<input class="form-control pull-left" type="text" id="search" value="${param.search }" style="width: 92%;" />
	<button id="btnSearch" class="pull-right btn">검색</button>
</div>
<div class="clearfix" style="margin-bottom: 10px;"></div>
<table class="table table-hover">
<tr>
	<th>공지 번호</th>
	<th width="45%">제목</th>
	<th>조회수</th>
	<th>작성일</th>
</tr>
<c:forEach items="${list }" var="i">
<tr>
	<td>${i.noticeNo }</td>
	<td><a href="/notice/detail?noticeNo=${i.noticeNo }">${i.noticeTitle }</a></td>
	<td>${i.noticeHit }</td>
	<td><fmt:formatDate value="${i.noticeDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</table>


<c:import url="/WEB-INF/views/layout/paging.jsp" />


</div><!-- .container end -->
</div><!-- .wrap end -->



<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


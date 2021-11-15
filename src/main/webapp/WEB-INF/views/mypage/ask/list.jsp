<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h1>작성한 질문글 내역</h1>

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th>추후 수정</th>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${ask }" var="ask">
	<tr>
		<td>체크박스</td>
		<td>${ask.askNo }</td>
		<td><a href="<%=request.getContextPath() %>/ask/detail?askNo=${ask.askNo }">${ask.askTitle }</a></td>
		<td>${ask.askHit }</td>
		<td><fmt:formatDate value="${ask.askDate }" pattern="yy-MM-dd HH:mm:ss" /></td>
	</tr>
	</c:forEach>
</table>

</div><!-- .container end -->
</div><!-- .wrap end -->
<c:import url="/WEB-INF/views/layout/paging.jsp" />

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


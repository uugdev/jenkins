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
<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />

<h3>스크랩한 질문글 내역</h3>
<div class="col-md-9" style="height: 500px;">

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${ask }" var="ask">
	<tr>
		<td>${ask.ASK_NO }</td>
		<td><a href="<%=request.getContextPath() %>/ask/detail?askNo=${ask.ASK_NO }">${ask.ASK_TITLE }</a></td>
		<td>${ask.ASK_HIT }</td>
		<td><fmt:formatDate value="${ask.ASK_DATE}" pattern="yy-MM-dd" /></td>
	</tr>
	</c:forEach>
</table>
<c:import url="/WEB-INF/views/layout/paging.jsp" />

<div class="clearfix"></div>

</div>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


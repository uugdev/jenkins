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

<h1>작성한 거래글 내역</h1>
<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />


<table class="table table-striped table-hover">
<thead>
	<tr>
		<th>추후 수정</th>
		<th style="width: 10%;">글번호</th>
		<th style="width: 10%;">카테고리</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${trade }" var="trade">
	<tr>
		<td>체크박스</td>
		<td>${trade.tradeNo }</td>
		<td>${trade.tradeCategory }</td>
		<td><a href="<%=request.getContextPath() %>/trade/detail?tradeNo=${trade.tradeNo }">${trade.tradeTitle }</a></td>
		<td>${trade.tradeHit }</td>
		<td><fmt:formatDate value="${trade.tradeDate }" pattern="yy-MM-dd HH:mm:ss" /></td>
	</tr>
	</c:forEach>
</table>


</div><!-- .container end -->
</div><!-- .wrap end -->
<c:import url="/WEB-INF/views/layout/paging.jsp" />

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


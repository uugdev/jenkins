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

<h3>스크랩한 거래글</h3>
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
	<c:forEach items="${trade }" var="trade">
	<tr>
		<td>${trade.TRADE_NO }</td>
		<td><a href="<%=request.getContextPath() %>/trade/detail?tradeNo=${trade.TRADE_NO }">${trade.TRADE_TITLE }</a></td>
		<td>${trade.TRADE_HIT }</td>
		<td><fmt:formatDate value="${trade.TRADE_DATE}" pattern="yy-MM-dd" /></td>
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

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

<div class="col-md-9" style="height: 500px;">

<h3>거래게시판에 작성한 댓글</h3>
<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">댓글</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${trade }" var="trade">
	<tr>
		<td>${trade.TRADE_NO }</td>
		<td><a href="<%=request.getContextPath() %>/trade/detail?tradeNo=${trade.TRADE_NO }">${trade.TRADE_COM_CONTENT }</a></td>
		<td><fmt:formatDate value="${trade.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm" /></td>
	</tr>
	</c:forEach>
</table>
<c:import url="/WEB-INF/views/layout/paging.jsp" />
</div>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
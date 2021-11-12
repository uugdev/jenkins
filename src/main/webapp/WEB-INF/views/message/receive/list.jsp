<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<style type="text/css">
th {
	text-align: center;
}
</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>받은 쪽지 리스트</h3>
<hr>

<table class="table table-hover">
	<thead>
	<tr>
		<th>보낸 사람</th>
		<th>제목</th>
		<th>상태</th>
		<th>보낸 날짜</th>
		<th>삭제</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${resultMapList }" var="map">
	<tr>
		<td>${map.USER_NICK }</td>
		<td><a href="<%=request.getContextPath() %>/message/receive/detail?msgNo=${map.MSG_NO }">${map.MSG_TITLE }</a></td>
		<td>
			<c:if test="${map.MSG_CHECK eq 'n'}" >읽지 않음</c:if>
			<c:if test="${map.MSG_CHECK eq 'y'}" >읽음</c:if>
		</td>
		<td><fmt:formatDate value="${map.MSG_DATE }" pattern="yy-MM-dd" /></td>
		<td>추후 수정</td>
	</tr>
	</c:forEach>
	</tbody>
</table>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

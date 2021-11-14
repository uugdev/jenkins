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

<h1>결제 체크 리스트</h1>

<table class="table table-hover">
	<tr>
		<th>번호</th>
		<th>상태</th>
		<th>상품명</th>
		<th>가격</th>
		<th>마감일</th>
		<th>조회수</th>
		<th>변경하기</th>
	</tr>
	<c:forEach items="${item }" var="item" varStatus="status">
	<tr>
		<td>${status.count }</td>
		<td>${item.itemStatus }</td>
		<td>${item.itemName }</td>
		<td>${item.itemPrice }</td>
		<c:forEach items="${vote }" var="vote">
			<c:if test="${item.userNo eq vote.userNo}">
				<td><fmt:formatDate value="${vote.voteEnd }" pattern="yy-MM-dd" /></td>
			</c:if>
		</c:forEach>
			<c:forEach items="${ask }" var="ask">
				<c:if test="${item.userNo eq ask.userNo}">
					<td>${ask.askHit}</td>
				</c:if>
		</c:forEach>
		
		<c:if test="${item.itemStatus == 'n' }">
			<td><button>결제로 변경하기</button></td>
		</c:if>
		<c:if test="${item.itemStatus == 'y' }">
			<td>결제 완료</td>
		</c:if>
	</tr>
	</c:forEach>
</table>



</div><!-- .container end -->
</div><!-- .wrap end -->
<c:import url="/WEB-INF/views/layout/paging.jsp" />

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


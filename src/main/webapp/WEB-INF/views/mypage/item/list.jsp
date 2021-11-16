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
		<th>상품명</th>
		<th>가격</th>
		<th>작성일</th>
		<th>마감일</th>
		<th>조회수</th>
		<th>상태</th>
	</tr>
	
	<c:forEach items="${list }" var="list" varStatus="status">
	<tr>
		<td>${status.count }</td>
		<td><a href="<%=request.getContextPath() %>/ask/detail?askNo=${list.ASK_NO }">${list.ITEM_NAME }</a></td>
		<td>${list.ITEM_PRICE }</td>
		<td><fmt:formatDate value="${list.ASK_DATE }" pattern="yy-MM-dd" /></td>
		<td><fmt:formatDate value="${list.VOTE_END }" pattern="yy-MM-dd" /></td>
		<td>${list.ASK_HIT }</td>
		<c:if test="${list.ITEM_STATUS == 'n'}">
			<td><a href="<%=request.getContextPath() %>/mypage/item/status?itemNo=${list.ITEM_NO }"><button>결제로 변경하기</button></a></td>
		</c:if>
		<c:if test="${list.ITEM_STATUS == 'y' && empty list.REVIEW_NO }">
			<td><a href="<%=request.getContextPath() %>/review/write?askNo=${list.ASK_NO }"><button>리뷰 작성하기</button></a></td>
		</c:if>
		<c:if test="${list.ITEM_STATUS == 'y' && not empty list.REVIEW_NO }">
			<td><a href="<%=request.getContextPath() %>/review/detail?reviewNo=${list.REVIEW_NO }"><button>후기 확인하기</button></a></td>
		</c:if>
	</tr>
	</c:forEach>
</table>



</div><!-- .container end -->
</div><!-- .wrap end -->
<c:import url="/WEB-INF/views/layout/paging.jsp" />

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


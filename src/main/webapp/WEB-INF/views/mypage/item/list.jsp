<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">
$(document).ready(function(){

	$('.btnUpdateY').click(function() {
		
		var answer = confirm("결제로 변경하시겠습니까?\n변경 즉시 투표는 종료되고 다시 상태를 변경할 수 없습니다.")
		
		if( answer == true ){
			
			location.href="/mypage/item/yes";
			
		} else {
			return false;
		}
	})

	$('.btnUpdateN').click(function() {
		
		var answer = confirm("결제안함으로 변경하시겠습니까?\n변경 즉시 투표는 종료되고 다시 상태를 변경할 수 없습니다.")
		
		if( answer == true ){
			
			location.href="/mypage/item/no";
			
		} else {
			return false;
		}
	})
	
	$('.btnWrite').click(function() {
		
		var answer = confirm("구매하신 상품에 대한 후기를 작성하시겠습니까?")
		
		if( answer == true ){
			
			location.href="review/write";
			
		} else {
			return false;
		}
	})
	
})
</script>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">


<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />

<div class="col-md-9" style="height: 500px;">

<h1>결제 체크 리스트</h1>
<table class="table table-hover">
	<tr>
		<th style="width:9%"><strong>번호</strong></th>
		<th style="width:20%"><strong>상품명</strong></th>
		<th style="width:12%"><strong>가격</strong></th>
		<th style="width:8%"><strong>조회수</strong></th>
		<th style="width:12%"><strong>작성일</strong></th>
		<th style="width:12%"><strong>투표 마감일</strong></th>
		<th style="width:15%"><strong>상태</strong></th>
	</tr>
	
	<c:forEach items="${list }" var="list" varStatus="status">
	<tr>
		<td>${status.count }</td>
		<td><a href="<%=request.getContextPath() %>/ask/detail?askNo=${list.ITEM_NO }">${list.ITEM_NAME }</a></td>
		<td>${list.ITEM_PRICE }</td>
		<td>${list.ASK_HIT }</td>
		<td><fmt:formatDate value="${list.ASK_DATE }" pattern="yy-MM-dd" /></td>
		<td><fmt:formatDate value="${list.VOTE_END }" pattern="yy-MM-dd" /></td>
		<c:if test="${list.ITEM_STATUS == 'n'&& empty list.ITEM_DATE}">
			<td><a href="<%=request.getContextPath() %>/mypage/item/yes?itemNo=${list.ITEM_NO }"><button class="btnUpdateY">구매했음</button></a>
			<a href="<%=request.getContextPath() %>/mypage/item/no?itemNo=${list.ITEM_NO }"><button class="btnUpdateN">구매안했음</button></a></td>
		</c:if>
		<c:if test="${list.ITEM_STATUS == 'n'&& not empty list.ITEM_DATE}">
			<td>안살래요</td>
		</c:if>
		<c:if test="${list.ITEM_STATUS == 'y' && not empty list.ITEM_DATE && empty list.REVIEW_NO }">
			<td><a href="<%=request.getContextPath() %>/review/write?askNo=${list.ITEM_NO }"><button class="btnWrite">리뷰 작성하기</button></a></td>
		</c:if>	
		<c:if test="${list.ITEM_STATUS == 'y' && not empty list.ITEM_DATE && not empty list.REVIEW_NO }">
			<td><a href="<%=request.getContextPath() %>/review/detail?reviewNo=${list.REVIEW_NO }"><button class="btnDetail">후기 확인하기</button></a></td>
		</c:if>
	</tr>
	</c:forEach>
</table>
<c:import url="/WEB-INF/views/layout/paging.jsp" />
</div>



</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />



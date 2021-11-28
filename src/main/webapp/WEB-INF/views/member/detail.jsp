<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />

<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->


<style>
table, h3 {
	text-align:center;
	margin: 0 auto;
}

.wrap {
	width: 600px;
	padding: 0 0 30px 0;
	margin: 0 0 0 10px;

}


</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="logo">
	<img id="logo" src="https://i.imgur.com/if5laLF.png" width="135px" height="65px"/>
</div>

<h4>회원 정보</h4>

<table class="table table-hover" style="width: 700px;">
	<tr>
		<td>닉네임</td>
		<td>${user.userNick }</td>
	</tr>
	<tr>
		<td>가입일</td>
		<td><fmt:formatDate value="${user.joinDate }" pattern="yy-MM-dd HH:mm" /></td>
	</tr>
	<tr>
		<td>포인트</td>
		<td>${user.userPoint }</td>
	</tr>
</table>

<h4>최근 작성한 글</h4>
<table class="table table-hover" style="width: 350px;">
	
	<c:forEach items="${list }" var="list">
	<tr>
		<c:if test="${list.BOARD == 'a' }">
		<td style="width: 70%"><a href="/ask/detail?askNo=${list.BOARD_NO }">${list.TITLE }</a></td>
		</c:if>
		<c:if test="${list.BOARD == 'r' }">
		<td style="width: 70%"><a href="/review/detail?reviewNo=${list.BOARD_NO }">${list.TITLE }</a></td>
		</c:if>
		<c:if test="${list.BOARD == 't' }">
		<td style="width: 70%"><a href="/trade/detail?tradeNo=${list.BOARD_NO }">${list.TITLE }</a></td>
		</c:if>
		<td><fmt:formatDate value="${list.WRITE_DATE }" pattern="yy-MM-dd" /></td>
	</tr>
	
	</c:forEach>
</table>





</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->

</body>
</html>




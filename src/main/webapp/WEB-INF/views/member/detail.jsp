<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />

<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->


<script>
$(document).ready(function() {

	$("#btnCancel").click(function() {
		window.open('','_self').close();
	})
})
</script>


<style>

#btnCancel {
    height: 35px;
    width: 65px;
    border-radius: 0px;
    border: 0px;
    background: #5b6e7a;
    color: #f3f3f3;
}

body {
	background-color: #f2f2f2;
	padding-top: 30px !important;
	width: 620px !important;
	
}

table, h4 {
	text-align: center;
	margin: 0 auto;
}

h4 {
	margin-bottom: 10px;
}

.logo {
	margin-bottom: 20px;
	margin-left: 116px;
}

.wrap {
	width: 500px;
	margin-bottom: 50px !important;
	margin-left: 112px;
}

.userinfoarea {
	width: 400px;
	background-color: #fff;
	padding: 30px;
	text-align: center;

}


</style>

<!-- 개별 영역 끝 -->

<div class="wrap">

<div class="logo">
	<img id="logo" src="https://i.imgur.com/if5laLF.png" width="135px" height="65px"/>
</div>

<div class="userinfoarea">
<h4><b>회원 정보</b></h4>

<table class="table table-hover" style="width: 350px;">
	<tr>
		<td style="width: 50%">닉네임</td>
		<td style="width: 50%">${user.userNick }</td>
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

<h4><b>최근 작성한 글</b></h4>
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


<span class="buttonarea">
	<button id="btnCancel">닫기</button>
</span>
</div>


</div><!-- .wrap end -->

<!-- footer start -->

</body>
</html>




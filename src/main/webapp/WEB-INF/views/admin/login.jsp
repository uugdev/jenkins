<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnMain").click(function(){
		location.href = "/main";
	})
	
})

</script>

<style type="text/css">

input[type=text]{
	width: 100%;
}

</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>관리자 로그인</h3>
<hr>

<form action="/admin/login" method="post">
<div style="width: 500px; margin: 0 auto;">
<table class="table">
<tr>
	<th><label for="adminId">아이디</label></th>
	<td><input type="text" id="adminId" name="adminId" placeholder="아이디를 입력하세요" /></td>
</tr>
<tr>
	<th><label for="userPw">비밀번호</label></th>
	<td><input type="text" id="adminPw" name="adminPw" placeholder="비밀번호를 입력하세요" /></td>
</tr>
</table>
<button type="submit">로그인</button>
<button type="button" id="btnMain">홈페이지</button>
</div>
</form>


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


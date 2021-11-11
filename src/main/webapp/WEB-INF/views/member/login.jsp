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
	
	$("#btnBack").click(function(){
		history.go(-1);
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

<h3>로그인(임시)</h3>
<hr>

<form action="/member/login" method="post">
<div style="width: 500px; margin: 0 auto;">
<table class="table table-bordered">
<tr>
	<th><label for="userId">아이디</label></th>
	<td><input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" /></td><!-- 추후에 오토컴플릿 추가 예정 -->
</tr>
<tr>
	<th><label for="userPw">비밀번호</label></th>
	<td><input type="text" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요" /></td><!-- 추후에 타입 변경 예정 -->
</tr>
</table>
<button type="submit">로그인</button>
<button type="button" id="btnBack">메인으로</button>
</div>
</form>


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


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

.table>tbody>tr>td {
	border-top: 0px solid #fff;
	height: 55px;
	padding: 3px;
	vertical-align: middle;
}

#btnSubmit {
	margin: auto;
	height: 100%;
	width: 100%;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	font-size: 19px;
	color: #f3f3f3;
}

#btnSubmit:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	font-size: 19px;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

input[type=text], input[type=password] {
	width: 95%;
	height: 90%;
	border-radius: 0px;
	border: 1px solid #DBDAD7;
	color: #B2B3B7;
	padding: 5px;
}

input[type=text]:focus, input[type=password]:focus {
	outline: none;
}

.title {
	margin: 60px 0 30px 0;
}

.title > p {
	color: #85969E;
	margin-top: 10px;
	font-size: 19px;
	
}

body {
	background: #f2f2f2;
}

.form {
	width: 600px;
	background: #fff;
	margin: auto;
	padding: 50px;
}

.warning > a {
	color: #85969E;
	font-weight: bold;
}

.warning > a:hover {
	color: #85969E;
	text-decoration: underline;
	font-weight: bold;
}


</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="title">
	<a href="/main"><img height="100px" alt="KH 영수증" src="https://i.imgur.com/if5laLF.png"></a>
	<p>관리자 페이지</p>
</div><!-- .title end -->

<form action="/admin/login" method="post">
<div style="width: 500px; margin: 0 auto;">
<table class="table">
<tr>
	<td><input type="text" id="adminId" name="adminId" placeholder="ID" /></td>
	<td style="width: 30%; vertical-align: middle;" rowspan="2"><button type="submit" id="btnSubmit">로그인</button></td>
</tr>
<tr>
	<td><input type="text" id="adminPw" name="adminPw" placeholder="PASSWORD" /></td>
</tr>
</table>

</div><!-- login form div end -->
</form>

<p class="warning" style="color: red;">관리자 페이지입니다. 일반 사용자는 <a href="/main">사용자 페이지</a>로 이동해주세요.</p>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


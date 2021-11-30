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
	$("#btnMain").click(function(){
		location.href="/main"
	})
	$("#btnLogin").click(function(){
		location.href="/member/login"
	})
})

</script>

<style type="text/css">

#msg {
	width: 500px;
	height: 100%;
	margin: auto;
	margin-top: 75px;
}


#btnLogin, #btnMain {
	height: 35px;
	width: 70px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

#btnLogin:hover, #btnMain:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div id="msg">

<img width="150px;" height="150px;" alt="금지" src="https://i.imgur.com/OlYEpre.png">
<h3><strong>부적절한 접근입니다!</strong></h3>
<hr><br><br>
<button id="btnMain">메인으로</button>
<button id="btnLogin">로그인</button>

</div><!-- #msg end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


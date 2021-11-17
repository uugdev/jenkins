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
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">
<div style="width: 500px; height: 500px; margin: 0 auto; padding: 30px;">
<h3><strong>회원가입을 축하합니다!</strong></h3>
<hr><br><br>
<button id="btnMain">메인으로</button>
<button id="btnLogin">로그인</button>

</div>
</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


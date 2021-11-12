<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">

$(document).ready(function(){
	$("#btnMain").click(function(){
		location.href="/main";
	})
	$("#btnAdminLogin").click(function(){
		location.href="/admin/login";
	})
})

</script>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">
<div style="width: 500px; height: 500px; margin: 0 auto; padding: 30px;">
<img width="150px;" height="150px;" alt="금지" src="https://cdn-icons.flaticon.com/png/512/2576/premium/2576762.png?token=exp=1636686797~hmac=096826150cf6d1591f7880545ed7fc60">
<h2>KH BiLL 관리자 페이지</h2>
<h3><strong>부적절한 접근입니다!</strong></h3>
<hr><br><br>
<button id="btnMain">메인으로</button>
<button id="btnAdminLogin">관리자 로그인</button>

</div>
</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


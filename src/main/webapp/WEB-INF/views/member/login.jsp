<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
window.Kakao.init("77e2509024f988b8580ef1eccfcf4e35")

function kakaoLogin(){
	window.Kakao.Auth.login({
		scope: 'account_email, gender',
		success: function(authObj){
// 			console.log(authObj)
			window.Kakao.API.request({
				url: '/v2/user/me',
				success: function(res){
					const email = res.kakao_account.email;
					const gender = res.kakao_account.gender;
					
					console.log(email);
					console.log(gender);
					
					$("#kakaoEmail").val(email);
					$("#kakaoGender").val(gender);
					document.login_form.submit();
				}
			})
		}
	})
}

</script>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnBack").click(function(){
		location.href = "/main"
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

<h3>로그인</h3>
<hr>

<form action="/member/login" method="post" name="login_form">
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
<div class="text-center">
	<button type="submit">로그인</button>
	<button type="button" id="btnMain">메인으로</button>
</div><!-- .text-center end -->
</div>
<hr>
<div class="text-center kakaoLogin">
	<input type="hidden" id="kakaoEmail" name="kakaoEmail" />
	<input type="hidden" id="kakaoGender" name="kakaoGender" />
	<a href="javascript:kakaoLogin();"><img src="/resources/img/kakao_login_medium_wide.png"></a>
</div>

</form>

<hr>
<div class="text-center">
	<span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp;<a href="/member/findId">아이디</a>&nbsp;/&nbsp;<a href="/member/findPw">비밀번호 찾기</a>
	&nbsp;&nbsp;|&nbsp;&nbsp;<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;<a href="/member/join">회원가입</a>
</div>


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


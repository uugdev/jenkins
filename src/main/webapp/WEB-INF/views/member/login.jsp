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

i, .text-center > a {
	color: #5F6062;
}

a:hover {
	color: #85969E;
	text-decoration: none;
}


</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="title">
	<a href="/main"><img height="100px" alt="KH 영수증" src="https://i.imgur.com/if5laLF.png"></a>
	<p style="margin-top: 10px;">로그인하시면 다양한 혜택을 이용하실 수 있습니다.</p>
</div>

<form action="/member/login" method="post" name="login_form">
<div class="form">
<table class="table">
<tr>
	<td><input type="text" id="userId" name="userId" placeholder="ID" tabindex="1" required /></td><!-- 추후에 오토컴플릿 추가 예정 -->
	<td style="width: 30%; vertical-align: middle;" rowspan="2"><button type="submit" id="btnSubmit" tabindex="3">로그인</button></td>
</tr>
<tr>
	<td><input type="password" id="userPw" name="userPw" placeholder="PASSWORD" tabindex="2" required /></td><!-- 추후에 타입 변경 예정 -->
</tr>
</table>
<hr>
<div class="text-center kakaoLogin">
	<input type="hidden" id="kakaoEmail" name="kakaoEmail" />
	<input type="hidden" id="kakaoGender" name="kakaoGender" />
	<a href="javascript:kakaoLogin();"><img src="/resources/img/kakao_login_medium_wide.png"></a>
</div>

</div><!-- .form end -->
</form>

<div class="text-center" style="margin-top: 10px; margin-bottom: 50px;">
	<i class="fas fa-question-circle"></i>&nbsp;<a href="/member/findId">아이디</a>&nbsp;/&nbsp;<a href="/member/findPw">비밀번호 찾기</a>
	&nbsp;&nbsp;|&nbsp;&nbsp;<i class="fas fa-user-circle"></i>&nbsp;<a href="/member/join">회원가입</a>
</div>


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


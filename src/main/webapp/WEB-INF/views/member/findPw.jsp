<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<script type="text/javascript">
$(document).ready(function(){
	$("#btnBack").click(function(){
		history.go(-1);
	})
	
	$("#findPw").click(function(){
		var mailAdr = $("#mailAdr").val();
		$.ajax({
			url: "/member/findPw",
			type:"post",
			data:{mailAdr:mailAdr},
	        success:function(data){
// 	        	 console.log(data);
				if(data=='noUserInfo'){
					$("#result").css("display", "inline-block");
					$("#resultText").html('입력하신 이메일과 일치하는 회원이 존재하지 않습니다. 회원가입을 진행해주세요.');
				} else if(data=='kakaoMember'){
					$("#result").css("display", "inline-block");
					$("#resultText").html('카카오 소셜 로그인 회원입니다. 비밀번호 찾기는 카카오에서 진행해주세요.');	
				} else {
					$("#result").css("display", "inline-block");
					$("#resultText").html('입력하신 이메일로 임시 비밀번호를 보내드렸습니다. 임시 비밀번호로 로그인 후 비밀번호를 변경해주세요!');								
				}
	        },
	        error:function(){
	            alert("에러입니다");
	        }
		})
	})
})

</script>

<style type="text/css">

input[type=text]{
	width: 100%;
}

#result {
	background: #ccc;
	height: 100px;
	margin: 20px auto;
	width: 500px;
	display: none;
}

</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>비밀번호 찾기</h3>
<hr>
<h4>가입하신 이메일을 입력해주세요.</h4>

<input type="email" id="mailAdr" name="mailAdr" autocomplete="off"/>
<button id="findPw">비밀번호 찾기</button>
<br>
<div id="result"><span id="resultText"></span></div>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


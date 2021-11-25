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
	
	$("#btnLogin").click(function(){
		location.href="/member/login";
	})
	
	$("#btnJoin").click(function(){
		location.href="/member/join";
	})
	
	$("#btnFind").click(function(){
		var mailAdr = $("#mailAdr").val();
		var mailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		if(!mailRegex.test(mailAdr)){
	        $(".mail_regex").css("display","inline-block");
	        return false;
		} else {
			$.ajax({
				url: "/member/findId",
				type:"post",
				data:{mailAdr:mailAdr},
		        success:function(data){
	// 	        	 console.log(data);
					if(data=='noUserId'){
				        $(".mail_regex").css("display","none");
						$("#result").css("display", "flex");
						$("#resultText").html('<p>입력하신 이메일과 일치하는 회원이 존재하지 않습니다.</p><p>이메일을 다시 확인하거나 회원가입을 진행해주세요.</p>');
						$("#btnLogin").css("display", "inline-block");
						$("#btnJoin").css("display", "inline-block");
					} else if(data=='kakaoMember'){
				        $(".mail_regex").css("display","none");
						$("#result").css("display", "flex");
						$("#resultText").html('<p>카카오 소셜 로그인 회원입니다.</p><p>카카오 로그인을 이용해주세요.</p>');
						$("#btnLogin").css("display", "inline-block");					
						$("#btnJoin").css("display", "none");
					} else {
				        $(".mail_regex").css("display","none");
						$("#result").css("display", "flex");
						$("#resultText").html('<p>아이디 : <strong>' + data + '</strong></p>');								
						$("#btnLogin").css("display", "inline-block");					
						$("#btnJoin").css("display", "none");
					}
		        },
		        error:function(){
		            alert("에러입니다");
		        }
			})
			
		}
	})/* #btnFind click end */
})

</script>

<style type="text/css">

body {
	background: #f2f2f2;
}

.title {
	margin: 60px 0 30px 0;
}

.title > p {
	color: #85969E;
}


#findId {
	width: 700px;
	background: #fff;
	margin: auto;
	margin-bottom: 50px;
	padding: 50px;
}

input[type=email]{
	width: 80%;
	text-align: center;
	height: 35px;
	border-radius: 0px;
	border: 1px solid #DBDAD7;
	color: #5F6062;
}

input[type=email]:focus {
	outline: none;
}

#btnFind {
	height: 35px;
 	width: 15%;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

#btnLogin, #btnJoin {
	display: none;
	height: 35px;
 	width: 13%;
	border-radius: 0px;
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
}

#btnFind:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

#btnLogin:hover, #btnJoin:hover {
	background: #5b6e7a;
	color: #f3f3f3;
	transition: all .2s ease-in-out;
}

#result {
	border: 2px solid #f3f3f3;
	height: 100px;
	margin: auto;
	margin-top: 50px;
	width: 100%;
	display: none;
	align-items: center;
	justify-content: center;
	padding-top: 10px;
}

.buttons {
	margin-top: 20px;
}

.mail_regex {
	display: none;
}

</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="title">
	<h2>아이디 찾기</h2>
	<p>잊어버린 아이디를 찾아드립니다.</p>
</div>

<div id="findId">
	<p>회원가입 시 입력하신 이메일을 입력해주세요.</p>
	<input type="email" id="mailAdr" name="mailAdr" autocomplete="off"/>
	<button id="btnFind">아이디 찾기</button><br>
	<span class="mail_regex" style="color: red;">이메일 형식으로 입력해주세요.</span>

	<div id="result"><span id="resultText"></span></div>
	<div class="buttons">
		<button type="button" id="btnLogin">로그인</button>
		<button type="button" id="btnJoin">회원가입</button>
	</div>
</div>


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


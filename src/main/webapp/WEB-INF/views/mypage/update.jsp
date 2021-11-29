<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
	
})
</script>

<script>
$(document).ready(function() {
	
	$.datepicker.setDefaults($.datepicker.regional['ko']); 
	$( "#userBday" ).datepicker({
	     showOn: "focus",
		 changeMonth: true, 
	     changeYear: true,
	     yearRange: "30",
	     maxDate: "+0D",
	     nextText: '다음 달',
	     prevText: '이전 달', 
	     dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	     dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     dateFormat: "yy-mm-dd"
	
	});
	
	var Bday = "<c:out value="${Bday }" />";

	var BdayArray = Bday.split('-');
	
	var bYear = BdayArray[0];
	var bMonth = BdayArray[1];
	var bDate = BdayArray[2];
	
	$('#userBday').datepicker("setDate", bYear + "-" + bMonth + "-" + bDate); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	

	$("#btnUpdate").click(function() {
		
		var userPw = $("#userPw").val();
		var userPwCheck = $("#userPwCheck").val();
		var userNick = $("#userNick").val();
		
		var pwRegex = /^[a-zA-z0-9]{8,16}$/;
		var nickRegex = /^[가-힣a-zA-z0-9]{4,12}$/;
		
		var pwregex = pwRegex.exec(userPw);
		if(pwregex == null){
			alert("비밀번호를 다시 확인해주세요!");
			$("#userPw").focus();
			return false;
		}
		
		if(userPw != userPwCheck){
			alert("비밀번호가 일치하지 않습니다.");
			$("#userPwCheck").focus();
			return false;
		}
		
		var nickregex = nickRegex.exec(userNick);
		if(nickregex == null){
			alert("닉네임을 다시 확인해주세요");
			$("#userNick").focus();
			return false;
		}
		
		var answer = confirm("회원정보를 수정하시겠습니까?")
		
		if(answer == true) {
			$("form").submit();
		} else {
			return false;
		}
	
		
	})

})

function checkUserPw() {
	var userPw = $("#userPw").val();

    var regex = /^[a-zA-z0-9]{8,16}$/;
	var result = regex.exec(userPw)
	
	if(result != null){
	    $(".pw.regex").html("");
	} else {
	    $(".pw.regex").html("비밀번호는 영어 대소문자와 숫자 8~16자리로만 사용 가능합니다!");
	    $(".pw.regex").css("color","red");
	}
}

function checkPwSame(){
	if($("#userPw").val() == $("#userPwCheck").val()){
		$(".pwchk.regex").html("");
        $("#join").prop("disabled", false);
	} else {
		$(".pwchk.regex").html("비밀번호가 일치하지 않습니다.");
		$(".pwchk.regex").css("color", "red");
        $("#join").prop("disabled", true);
	}
}

function checkNick(){
    var userNick = $('#userNick').val();
    $.ajax({
        url:"/member/nickCheck",
        type: "post",
        data:{userNick:userNick},
        success:function(cnt){
        	 if(cnt != 1){ 
                 $(".nick_ok").css("display","inline-block"); 
                 $(".nick_already").css("display", "none");
                 $(".nick_check").css("display", "none");
                 $("#join").prop("disabled", false);
             } else {
                 $(".nick_already").css("display","inline-block");
                 $(".nick_ok").css("display", "none");
                 $(".nick_check").css("display", "none");
                 $("#join").prop("disabled", true);
             }
        },
        error:function(){
            alert("에러입니다");
        }
    });
};


function checkUserNick() {
	var userNick = $("#userNick").val();

    var idRegExp = /^[가-힣a-zA-z0-9]{4,12}$/;
    if (!idRegExp.test(userNick)) {
        $(".nick_already").css("display","none");
        $(".nick_ok").css("display", "none");
        $(".nick_check").css("display", "inline-block");
        return false;
    }
    return checkNick();
}


</script>


<style>

.container {
	width: 1200px;
}

#btnUpdate {
	float: left;
	margin: 0 0 0 20px;
}

#btnCancel {
	float: right;
	margin: 0 20px 0 0;
}

table {
	margin: 0 auto;
}

td {
	height: 45px;
	vertical-align: center;
}

.titlearea {
	margin: 50px 0 30px 0;
}

.wrap {
	background-color: #f2f2f2;
	margin-bottom: 0;
	height: 725px;
}

.col-md-9 {
	margin-top : 50px;
	background: #fff;
}

.buttonarea {
	background: #fff;
	margin: 0 auto;
}

.tablearea {
	margin-bottom: 40px;

}

button {
	height: 35px;
	width: 76px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

button:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

.nick_ok {
	color:#6A82FB;
	display: none;
}
.nick_already, .nick_check {
	color: red;
	display: none;
}

input[type=text]{
	width: 100%;
}

input[type=password]{
	width: 100%;
}


</style>

<!-- 개별 영역 끝 -->
<!-- 카카오 로그인 확인 절차 -->
<c:set var="userId" value="${user.userId }" />
<c:set var="kakaoUser" value="${fn:substringBefore(userId, '-') }" />
<!-- 카카오 로그인 확인 절차 끝 -->

<div class="wrap">
<div class="container">

<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />
	<div class="one">
		<div class="col-md-9" style="height:600px;">
			<div class="titlearea"> 
				<h3>회원정보 수정</h3>
			</div>			
		<form action="/mypage/update" method="post" id="update">
		<input type="hidden" name="userNo" value="${user.userNo }" />
		<input type="hidden" name="userId" value="${user.userId }" />
		<input type="hidden" name="userMail" value="${user.userMail }" />
			<div class="tablearea">
				<table class="table table-hover" style="width: 500px">
					<c:if test="${kakaoUser == '' || empty kakaoUser }">
						<tr>
							<td style="width: 10%" ><strong>아이디</strong></td>
							<td style="width: 10%">${user.userId }</td>
						</tr>			
					</c:if>
					<c:if test="${kakaoUser == 'kakao' }">
						<tr>
							<td style="width: 10%" ><strong>아이디</strong></td>
							<td style="width: 10%">소셜 로그인 회원입니다.</td>
						</tr>			
					</c:if>
					<c:if test="${kakaoUser == '' || empty kakaoUser}">
						<tr>
							<td><strong>비밀번호</strong></td>
							<td ><input type="password" id="userPw" name="userPw" value="${user.userPw }" required oninput="checkUserPw()"><br>
							<span class="pw regex"></span></td>
						</tr>			
					</c:if>
					<c:if test="${kakaoUser == '' || empty kakaoUser}">
						<tr>
							<td><strong>비밀번호확인</strong></td>
							<td ><input type="password" id="userPwCheck" name="userPwCheck" value="${user.userPw }" required onkeyup="checkPwSame()"><br>
							<span class="pwchk regex"></span></td>
						</tr>			
					</c:if>
					<tr>
						<td><strong>닉네임</strong></td>
						<td><input type="text" id="userNick" name="userNick" value="${user.userNick }" required oninput="checkUserNick()"><br>
						<span class="nick_ok">사용 가능한 닉네임입니다.</span>
						<span class="nick_already">사용 중인 닉네임입니다.</span>
						<span class="nick_check">닉네임은 한글, 영어 대소문자와 숫자 4~12자리로 입력해야 합니다!</span></td>
					</tr>
					<tr>
						<td><strong>이메일</strong></td>
						<td>${user.userMail }
					</tr>
					<tr>
						<td><strong>생일</strong></td>
						<td><input type="text" id="userBday" name="userBday" style="cursor: default;" placeholder="생일을 입력하세요" autocomplete="off" readonly /></td>
					<tr>
					<tr>
						<td><strong>성별</strong></td>
						<td>
							<c:if test="${user.userGender == 'M'}">
								<input type="radio" name="userGender" value="F" />
								&nbsp;여성&nbsp;&nbsp;&nbsp;
								<input type="radio" name="userGender" value="M" checked="checked" />
								&nbsp;남성&nbsp;&nbsp;&nbsp;
								<input type="radio" name="userGender" value="N" />
								&nbsp;선택 안함&nbsp;&nbsp;&nbsp;
							</c:if>
							<c:if test="${user.userGender == 'F'}">
								<input type="radio" name="userGender" value="F" checked="checked" />
								&nbsp;여성&nbsp;&nbsp;&nbsp;
								<input type="radio" name="userGender" value="M" />
								&nbsp;남성&nbsp;&nbsp;&nbsp;
								<input type="radio" name="userGender" value="N" />
								&nbsp;선택 안함&nbsp;&nbsp;&nbsp;
							</c:if>
							<c:if test="${user.userGender == 'N'}">
								<input type="radio" name="userGender" value="F" />
								&nbsp;여성&nbsp;&nbsp;&nbsp;
								<input type="radio" name="userGender" value="M" />
								&nbsp;남성&nbsp;&nbsp;&nbsp;
								<input type="radio" name="userGender" value="N" checked="checked" />
								&nbsp;선택 안함&nbsp;&nbsp;&nbsp;
							</c:if>
						</td>
					<tr>
				</table>
			</div>
		</form>
		<div class="buttonarea" style="width:200px; margin: 0 auto;">
			<button id="btnUpdate" type="button">수정하기</button>
			<button id="btnCancel" type="button">이전으로</button>
		</div> <!-- .buttonarea end -->

		</div> <!-- .col-md-9 end -->
	</div><!-- .one end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


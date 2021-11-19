<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">

$(document).ready(function () {
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
	
	
	$("#join").click(function(){
		var userId = $("#userId").val();
		var userPw = $("#userPw").val();
		var userPwCheck = $("#userPwCheck").val();
		var userNick = $("#userNick").val();
		
		var idRegex = /^[a-zA-z0-9]{4,12}$/;
		var pwRegex = /^[a-zA-z0-9]{8,16}$/;
		var nickRegex = /^[가-힣a-zA-z0-9]{4,12}$/;

		
		var idregex = idRegex.exec(userId);
		if(idregex == null){
			alert("아이디를 다시 확인해주세요");
			$("#userId").focus();
			return false;
		}
		
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
		
		var answer = confirm("회원가입을 하시겠습니까?");
		if( answer == true){
			$("form").submit;			
		} else {
			return false;
		}
	});
});
function checkId(){
    var userId = $("#userId").val(); //id값이 "id"인 입력란의 값을 저장
    $.ajax({
        url:"/member/idCheck", //Controller에서 인식할 주소
        type:"post", //POST 방식으로 전달
        data:{userId:userId},
        success:function(cnt){
        	 if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                 $(".id_ok").css("display","inline-block"); 
                 $(".id_already").css("display", "none");
                 $(".id_check").css("display", "none")
                 $("#join").prop("disabled", false);
             } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                 $(".id_already").css("display","inline-block");
                 $(".id_ok").css("display", "none");
                 $(".id_check").css("display", "none");
                 $("#join").prop("disabled", true);
             }
        },
        error:function(){
            alert("에러입니다");
        }
    });
};


function checkUserId() {
	var userId = $("#userId").val();

    var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
    if (!idRegExp.test(userId)) {
        $(".id_already").css("display","none");
        $(".id_ok").css("display", "none");
        $(".id_check").css("display", "inline-block");
        return false;
    }
    return checkId();
}

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


function checkMail(){
    var userMail = $("#userMail").val();
    $.ajax({
        url:"/member/mailCheck",
        type: "post",
        data:{userMail:userMail},
        success:function(cnt){
        	 if(cnt != 1){ 
                 $(".mail_ok").css("display","inline-block"); 
                 $(".mail_already").css("display", "none");
                 $("#join").prop("disabled", false);
             } else {
                 $(".mail_already").css("display","inline-block");
                 $(".mail_ok").css("display", "none");
                 $("#join").prop("disabled", true);
             }
        },
        error:function(){
            alert("에러입니다");
        }
    });
};

var authKey;
function sendMail(){
	
	var userMail = $("#userMail").val();
	$.ajax({
	     url:"/member/sendMail",
	     type: "post",
	     async: false,
	     data:{userMail:userMail},
	     success:function(authkey){
			authKey = authkey;
			$("#verifyMail").css("display", "inline-block");
	     },
	     error:function(){
	         alert("에러입니다");
	     }
	});
	
};

function checkVerifyCode(){
	var verifyCode = $("#verifyCode").val();
	
	if(verifyCode == authKey){
		$(".verify_ok").css("display", "inline-block");
		$(".verify_no").css("display", "none");
        $("#join").prop("disabled", false);
	} else {
		$(".verify_ok").css("display", "none");
		$(".verify_no").css("display", "inline-block");
        $("#join").prop("disabled", true);
	}
}


</script>

<style type="text/css">

.table {
	text-align: center;
	width: 700px;
	margin: 0 auto;
}
.table>tbody>tr>th {
	width: 20%;
	vertical-align: middle !important;
	border-top: 0px;
}
.table>tbody>tr>td {
	vertical-align: middle !important;
	border-top: 0px;
}
label {
	margin-top: 5px;
}

input[type=text],input[type=email], input[type=password],input[type=number] {
	width: 100%;
	text-align: center;
}

.id_ok, .nick_ok, .mail_ok, .verify_ok {
	color:#6A82FB;
	display: none;
}
.id_already, .id_check, .nick_already, .nick_check, .mail_already, .verify_no {
	color: red;
	display: none;
}
.required {
	color: red;
}

#verifyMail {
	display: none;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>회원가입</h3>
<hr>

<form action="/member/join" method="post">
<table class="table table-hover">
<tr>
	<th><label for="userId">아이디<span class="required">&nbsp;*</span></label></th>
	<td><input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" autocomplete="off" required oninput="checkUserId()" /><br>
	<span class="id_ok">사용 가능한 아이디입니다.</span>
	<span class="id_already">사용 중인 아이디입니다.</span>
	<span class="id_check">아이디는 영어 대소문자와 숫자 4~12자리로 입력해야 합니다!</span></td>
</tr>
<tr>
	<th><label for="userPw">비밀번호<span class="required">&nbsp;*</span></label></th>
	<td><input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요" autocomplete="off" required oninput="checkUserPw()"/><br>
	<span class="pw regex"></span></td>
</tr>
<tr>
	<th><label for="userPwCheck">비밀번호 확인<span class="required">&nbsp;*</span></label></th>
	<td><input type="password" id="userPwCheck" name="userPwCheck" placeholder="비밀번호를 입력하세요" autocomplete="off" required onkeyup="checkPwSame()"/><br>
	<span class="pwchk regex"></span></td>
</tr>
<tr>
	<th><label for="userNick">닉네임<span class="required">&nbsp;*</span></label></th>
	<td><input type="text" id="userNick" name="userNick" placeholder="닉네임을 입력하세요" autocomplete="off" required oninput="checkUserNick()" /><br>
	<span class="nick_ok">사용 가능한 닉네임입니다.</span>
	<span class="nick_already">사용 중인 닉네임입니다.</span>
	<span class="nick_check">닉네임은 한글, 영어 대소문자와 숫자 4~12자리로 입력해야 합니다!</span></td>
</tr>
<tr>
	<th><label for="userMail">이메일<span class="required">&nbsp;*</span></label></th>
	<td><input style="width: 86%;" type="email" id="userMail" name="userMail" placeholder="이메일을 입력하세요" autocomplete="off" required oninput="checkMail()"/><button id="btnSend" type="button" onclick="sendMail()">이메일 인증</button><br>
	<span class="mail_ok">사용 가능한 이메일입니다.</span>
	<span class="mail_already">사용 중인 이메일입니다.</span><br>
	<div id="verifyMail" style="width: 100%;"><input type="text" maxlength="6" id="verifyCode" name="verifyCode" placeholder="인증문자를 입력하세요" autocomplete="off" required oninput="checkVerifyCode()"/></div><br>
	<span class="verify_ok">인증되었습니다.</span>
	<span class="verify_no">인증문자가 틀렸습니다.</span></td>
</tr>
<tr>
	<th><label for="extraMoney">여유자금<span class="required">&nbsp;*</span></label></th>
	<td><input type="number" id="extraMoney" name="extraMoney" placeholder="여유자금을 입력하세요" autocomplete="off" value="0"/></td>
</tr>
<tr>
	<th><label for="userBday">생일<span class="required">&nbsp;*</span></label></th>
	<td><input type="text" id="userBday" name="userBday" style="cursor: default;" placeholder="생일을 입력하세요" autocomplete="off" required readonly/></td>
</tr>
<tr>
	<th>성별</th>
	<td><input type="radio" name="userGender" value="F"/>&nbsp;여성&nbsp;&nbsp;&nbsp;
	<input type="radio" name="userGender" value="M" />&nbsp;남성&nbsp;&nbsp;&nbsp;
	<input type="radio" name="userGender" value="N" checked="checked"/>&nbsp;선택 안함&nbsp;&nbsp;&nbsp;
	</td>
</tr>
</table>

<button id="join">회원가입</button>
</form>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<%-- <c:import url="/WEB-INF/views/layout/footer.jsp" /> --%>


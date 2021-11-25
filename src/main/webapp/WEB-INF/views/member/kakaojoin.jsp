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
	
	action_popup.alert("회원가입을 완료하기 위해 추가 정보를 입력해주세요.");
	
	/* 닫는 창으로 꼭 필요함 */
	$(".modal_close").on("click", function () {
	    action_popup.close(this);
	});
	
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
	
	$("#kakaojoin").click(function(){
		var userNick = $("#userNick").val();
	
		var nickRegex = /^[가-힣a-zA-z0-9]{4,12}$/;


		var nickregex = nickRegex.exec(userNick);
		if(nickregex == null){
			alert("닉네임을 다시 확인해주세요");
			$("#userNick").focus();
			return false;
		}
		
		if($("input:checkbox[name=agree]").is(":checked") == false){
			alert('개인정보 수집 및 이용에 동의해주세요');
			$("#agreement").focus();
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
                 $("#kakaojoin").prop("disabled", false);
             } else {
                 $(".nick_already").css("display","inline-block");
                 $(".nick_ok").css("display", "none");
                 $(".nick_check").css("display", "none");
                 $("#kakaojoin").prop("disabled", true);
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

<style type="text/css">

.table {
	text-align: center;
	width: 750px;
	margin: 0 auto;
	margin-bottom: 30px;
}
.table>tbody>tr>th {
	width: 20%;
	vertical-align: middle !important;
	border-top: 0px;
}
.table>tbody>tr>td {
	border-top: 0px;
	height: 70px;
	padding: 3px;
	vertical-align: middle;
}
label {
	margin-top: 5px;
}

input[type=text],input[type=email], input[type=password],input[type=number] {
	width: 100%;
	text-align: center;
	height: 35px;
	border-radius: 0px;
	border: 1px solid #DBDAD7;
	color: #5F6062;
}

input[type=text]:focus, input[type=email]:focus, input[type=password]:focus, input[type=number]:focus {
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
	width: 900px;
	background: #fff;
	margin: auto;
	margin-bottom: 50px;
	padding: 50px;
}

.nick_ok {
	color:#6A82FB;
	display: none;
}
.nick_already, .nick_check {
	color: red;
	display: none;
}
.required {
	color: red;
}

#kakaojoin {
	margin: auto;
	height: 50px;
	width: 75%;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
	margin: auto;
	margin-top: 30px;
}

#kakaojoin:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

#agreement {
	border: 1px solid #DBDAD7;
	background: #fff;
	overflow: auto;
	width: 85%;
	height: 100px;
	margin: auto;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="title">
	<a href="/main"><img height="100px" alt="KH 영수증" src="https://i.imgur.com/if5laLF.png"></a>
	<p style="margin-top: 10px;">회원으로 가입하시면 다양한 기능을 이용하실 수 있습니다.</p>
</div>

<div class="form">
<form action="/member/kakaojoin" method="post">
<input type="hidden" id="userId" name="userId" value="" />
<input type="hidden" id="userPw" name="userPw" value="" />
<table class="table table-hover">
<tr>
	<th><label for="userNick">닉네임<span class="required">&nbsp;*</span></label></th>
	<td><input type="text" id="userNick" name="userNick" placeholder="닉네임을 입력하세요" autocomplete="off" required oninput="checkUserNick()" /><br>
	<span class="nick_ok">사용 가능한 닉네임입니다.</span>
	<span class="nick_already">사용 중인 닉네임입니다.</span>
	<span class="nick_check">닉네임은 한글, 영어 대소문자와 숫자 4~12자리로 입력해야 합니다!</span></td>
</tr>
<tr>
	<th><label for="userMail">이메일<span class="required">&nbsp;*</span></label></th>
	<td><input type="email" id="userMail" name="userMail" value="${kakaoEmail }" readonly style="background: #f3f3f3;"/><br>
</tr>
<tr>
	<th><label for="extraMoney">여유자금<span class="required">&nbsp;*</span></label></th>
	<td><input type="number" id="extraMoney" name="extraMoney" placeholder="여유자금을 입력하세요" autocomplete="off" value="0" min="0" step="1000" required/></td>
</tr>
<tr>
	<th><label for="userBday">생일</label><span class="required">&nbsp;*</span></th>
	<td><input type="text" id="userBday" name="userBday" style="cursor: default;" placeholder="생일을 입력하세요" autocomplete="off" required readonly/></td>
</tr>
<c:if test="${empty kakaoGender }">
<tr>
	<th>성별</th>
	<td><input type="radio" name="userGender" value="F"/>&nbsp;여성&nbsp;&nbsp;&nbsp;
	<input type="radio" name="userGender" value="M" />&nbsp;남성&nbsp;&nbsp;&nbsp;
	<input type="radio" name="userGender" value="N" checked="checked"/>&nbsp;선택 안함&nbsp;&nbsp;&nbsp;
	</td>
</tr>
</c:if>
<c:if test="${kakaoGender == 'female' }"><input type="hidden" name="userGender" value="F"/></c:if>
<c:if test="${kakaoGender == 'male' }"><input type="hidden" name="userGender" value="M"/></c:if>
</table>

<hr>
<p style="font-size: 15px; font-weight: bold; margin-left: 70px;" class="pull-left">개인정보 수집 및 이용 동의<span class="required">&nbsp;*</span></p>
<div id="agreement">
	<p>「개인정보보호법」 등 관련 법규에 의거하여 KH 영수증은 홈페이지 이용를 위해 개인정보를 수집·이용하고 있으며, 관계법령에 따라 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 처리하고 있습니다.</p>
	<p>■ 개인정보 수집 및 이용</p>
	<p>1. 개인정보의 수집·이용 목적 : 홈페이지 운영</p>
	<p>2. 수집 항목 : 성명, 이메일 주소, 성별, 생일</p>
	<p>3. 보유·이용 기간 : 영구. 단, 회원 탈퇴 시 개인정보 즉시 파기</p>
	<p>4. 개인정보 수집·이용을 거부할 권리 및 그에 따른 불이익 사항 : 귀하는 위의 개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다. 다만, 동의가 없을 경우 홈페이지 이용에 제한이 있을 수 있습니다.</p>
</div>
<div class="text-right" style="width: 100%; padding-right: 60px;">
	<input type="checkbox" id="agree" name="agree"/><label for="agree">&nbsp;&nbsp;동의합니다.</label>
</div>

<button id="kakaojoin">회원가입</button>
</form>
</div><!-- .form end -->


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


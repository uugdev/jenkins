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
	
	$("#kakaojoin").click(function(){
		var userNick = $("#userNick").val();
	
		var nickRegex = /^[가-힣a-zA-z0-9]{4,12}$/;


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
alert("회원가입 진행을 위해 추가 정보를 기입해주세요.")
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

input[type=text], input[type=email], input[type=password],input[type=number] {
	width: 100%;
	text-align: center;
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
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>카카오 회원가입</h3>
<hr>

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
	<td><input type="email" id="userMail" name="userMail" value="${kakaoEmail }" readonly/><br>
</tr>
<tr>
	<th><label for="extraMoney">여유자금<span class="required">&nbsp;*</span></label></th>
	<td><input type="number" id="extraMoney" name="extraMoney" placeholder="여유자금을 입력하세요" autocomplete="off" value="0" required/></td>
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

<button id="kakaojoin">회원가입</button>
</form>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


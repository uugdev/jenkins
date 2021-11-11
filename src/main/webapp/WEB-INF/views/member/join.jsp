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
        	 changeMonth: false, 
             changeYear: false,
             nextText: '다음 달',
             prevText: '이전 달', 
             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             dateFormat: "yy-mm-dd"

        });
});
</script>

<style type="text/css">

.table {
	text-align: center;
	width: 600px;
	margin: 0 auto;
}

label {
	margin-top: 5px;
	width: 30%;
}

input[type=text],input[type=email], input[type=password],input[type=number] {
	width: 100%;
	text-align: center;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>회원가입(임시)</h3>
<hr>

<form action="/member/join" method="post">
<table class="table table-hover">
<tr>
	<th><label for="userId">아이디</label></th>
	<td><input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" autocomplete="off" /></td>
</tr>
<tr>
	<th><label for="userPw">비밀번호</label></th>
	<td><input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요" autocomplete="off" /></td>
</tr>
<tr>
	<th><label for="userNick">닉네임</label></th>
	<td><input type="text" id="userNick" name="userNick" placeholder="닉네임을 입력하세요" autocomplete="off" /></td>
</tr>
<tr>
	<th><label for="userMail">이메일</label></th>
	<td><input type="email" id="userMail" name="userMail" placeholder="이메일을 입력하세요" autocomplete="off" /></td>
</tr>
<tr>
	<th><label for="extraMoney">여유자금</label></th>
	<td><input type="number" id="extraMoney" name="extraMoney" placeholder="여유자금을 입력하세요" autocomplete="off"/></td>
</tr>
<tr>
	<th><label for="userBday">생일</label></th>
	<td><input type="text" id="userBday" name="userBday" style="cursor: default;" placeholder="생일을 입력하세요" autocomplete="off" readonly/></td>
</tr>
<tr>
	<th>성별</th>
	<td><input type="radio" name="userGender" value="F" checked="checked"/>&nbsp;여성&nbsp;&nbsp;&nbsp;<input type="radio" name="userGender" value="M" />&nbsp;남성&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>

<button type="submit">회원가입</button>
</form>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


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
$(document).ready(function() {
	$("#btnUpdate").click(function() {
		submitContents( $("#btnUpdate") );
		
		$("form").submit();
	})
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
})
</script>

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


<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h1>회원정보 수정</h1>

<form action="/mypage/update" method="post">
<input type="hidden" name="userNo" value="${user.userNo }" />

<div>아이디</div>
<div><input type="hidden" name="userId" value="${user.userId }" readonly="readonly" /></div>
<div>${user.userId }</div>

<div>비밀번호</div>
<div><input type="text" name="userPw" value="${user.userPw }"></div>

<div>닉네임</div>
<div><input type="text" name="userNick" value="${user.userNick }"></div>

<div>이메일</div>
<div><input type="hidden" name="userMail" value="${user.userMail }" readonly="readonly" ></div>
<div>${user.userMail }</div>

<div>생일</div>
<input type="text" id="userBday" name="userBday" style="cursor: default;" placeholder="생일을 입력하세요" autocomplete="off" readonly />


<div>성별</div>
<c:if test="${user.userGender == 'M'}">
	<input type="radio" name="userGender" value="F" />
	&nbsp;여성&nbsp;&nbsp;&nbsp;
	<input type="radio" name="userGender" value="M" checked="checked" />
	&nbsp;남성&nbsp;&nbsp;&nbsp;
</c:if>
<c:if test="${user.userGender == 'F'}">
	<input type="radio" name="userGender" value="F" checked="checked" />
	&nbsp;여성&nbsp;&nbsp;&nbsp;
	<input type="radio" name="userGender" value="M" />
	&nbsp;남성&nbsp;&nbsp;&nbsp;
</c:if>

<button id="btnUpdate">수정하기</button>

</form>

<button id="btnCancel">취소</button>




</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


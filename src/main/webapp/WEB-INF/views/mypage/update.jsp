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
		var answer = confirm("회원정보를 수정하시겠습니까?")
		
		if(answer == true) {
			$("form").submit();
		} else {
			return false;
		}
		
		
		$("form").submit();
	})
	
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
	
});
</script>

<style>

#btnUpdate {
	float: left;
	margin: 0 0 0 20px;
}

#btnCancel {
	float: right;
	margin: 0 20px 0 0;
}

table {
    margin-left: auto; 
    margin-right: auto;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />

<div class="one">
	<div class="col-md-9" style="height:500px;">
		
		<h3> 회원정보 수정 </h3>
			
		<form action="/mypage/update" method="post">
		<input type="hidden" name="userNo" value="${user.userNo }" />
		<input type="hidden" name="userId" value="${user.userId }" />
		<input type="hidden" name="userMail" value="${user.userMail }" />
		
		<table class="table table-hover" style="width: 300px">
			<tr>
				<td style="width: 10%" >아이디</td>
				<td style="width: 10%">${user.userId }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td ><input type="text" name="userPw" value="${user.userPw }"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="userNick" value="${user.userNick }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${user.userMail }
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="text" id="userBday" name="userBday" style="cursor: default;" placeholder="생일을 입력하세요" autocomplete="off" readonly /></td>
			<tr>
			<tr>
				<td>성별</td>
				<td>
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
				</td>
			<tr>
		</table>

		<div class="buttonarea" style="width:200px; margin: 0 auto;">
			<button class="btn" id="btnUpdate">수정하기</button>
			<button class="btn" id="btnCancel">이전으로</button>
		</div> <!-- .buttonarea end -->

		</form>
		</div> <!-- .col-md-9 end -->
	</div><!-- .one end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


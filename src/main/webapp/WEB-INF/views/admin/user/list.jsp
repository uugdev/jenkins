<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script type="text/javascript">
$(document).ready(function(){
	$("#btnDelete").click(function(){
		var answer = confirm("선택한 회원 정보를 삭제하시겠습니까?\n※해당 작업은 되돌릴 수 없습니다!")
		var delchk = []; // key 값을 담을 배열
                
	    //삭제 key value
	    // chk라는 클래스를 가진 체크박스 중에 체크가 된
	    // object들을 찾아서 delchk라는 배열에 담는다.
	    $('.chk:checked').each(function(){
	        delchk.push($(this).val());
	    });
		if( answer == true ){
			location.href="/admin/user/delete?userNo="+delchk;
		} else {
			return false;
		}
	})

})
</script>

<style type="text/css">

table {
	text-align: center;
	margin: auto;
}

th, td {
	text-align: center;
}

label {
	font-weight: normal !important;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>회원 목록</h3>
<hr>
<table class="table table-hover table-condensed">
<tr>
	<th>	</th>
	<th>회원번호</th>
	<th>아이디</th>
	<th>닉네임</th>
	<th>이메일</th>
	<th>가입일</th>
	<th>여유자금</th>
	<th>생일</th>
	<th>성별</th>
	<th>포인트</th>
</tr>
<c:forEach items="${userList }" var="i">
<tr>
	<td><input type="checkbox" id="${i.userNo }" class="chk" value="${i.userNo }" /></td>
	<td><label for="${i.userNo }">${i.userNo }</label></td>
	<td><label for="${i.userNo }">${i.userId }</label></td>
	<td><label for="${i.userNo }">${i.userNick }</label></td>
	<td><label for="${i.userNo }">${i.userMail }</label></td>
	<td><label for="${i.userNo }"><fmt:formatDate value="${i.joinDate }" pattern="yyyy-MM-dd"/></label></td>
	<td><label for="${i.userNo }">${i.extraMoney }</label></td>
	<td><label for="${i.userNo }">${i.userBday }</label></td>
	<td><label for="${i.userNo }">${i.userGender }</label></td>
	<td><label for="${i.userNo }">${i.userPoint }</label></td>
</tr>
</c:forEach>
</table>
<button id="btnDelete" class="pull-left">삭제</button>
<span class="pull-right">총 ${paging.totalCount }명</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

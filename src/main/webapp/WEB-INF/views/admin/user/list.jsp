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
		var delchk = [];
   
	    $('.chk:checked').each(function(){
	        delchk.push($(this).val());
	    });
		if( answer == true ){
			location.href="/admin/user/delete?userNo="+delchk;
		} else {
			return false;
		}
	})
	$("#btnSearch").click(function() {
		location.href="/admin/notice/list?search="+$("#search").val();
	});
	$("#search").keypress(function(event){
	     if ( event.which == 13 ) {
	         $("#btnSearch").click();
	         return false;
	     }
	});
})
</script>

<style type="text/css">

table {
	text-align: center;
	margin: auto;
	margin-top: 10px;
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
<span class="pull-left">총 ${paging.totalCount }명</span>
<div class="pull-right" style="width: 300px; margin: 0 auto;">
	<input class="form-control pull-left" type="text" id="search" name="search" value="${param.search }" style="width: 60%;"/>
	<button id="btnSearch" class="pull-right btn">검색</button>
</div>
<div class="clearfix"></div>
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
	<td><label for="${i.userNo}">${i.userNo }</label></td>
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
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

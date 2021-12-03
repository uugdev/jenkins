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
	
	$(document).on('click', '#selectAll', function() {
	    if($('#selectAll').is(':checked')){
	       $('.chk').prop('checked', true);
	    } else {
	       $('.chk').prop('checked', false);
	    }
	});
	
	$(document).on('click', '.chk', function() {
	    if($('input[class=chk]:checked').length==$('.chk').length){
	        $('#selectAll').prop('checked', true);
	    }else{
	       $('#selectAll').prop('checked', false);
	    }
	});
	
	$("#btnSearch").click(function() {
		location.href="/admin/user/list?search="+$("#search").val();
	});
	$("#search").keypress(function(event){
	     if ( event.which == 13 ) {
	         $("#btnSearch").click();
	         return false;
	     }
	});
})

function setUnablePeriod(clicked_id){
	var input = prompt('로그인을 차단할 일수를 입력하세요.');
	var userNo = clicked_id;
// 	console.log(userNo);
// 	console.log(days)
	if(input == null){
		return false;
	} else {
		var days = parseInt(input);
		if(isNaN(days)) {
			alert('숫자만 입력해주세요!');
			return false;
		} else{
			$.ajax({
				type: "get"
				, url: "/admin/user/unable"
				, data: {
					days: days
					, userNo: userNo
				}
				, success: function ( res ) {
					alert(userNo+'번 회원의 로그인이 '+res+'까지 차단되었습니다.');
					location.href="/admin/user/list";
				}
				, error: function () {
					console.log("AJAX 실패")
				}
			})
		}
	}
}

function setUnablePeriodNull(clicked_id){
	var userNo = clicked_id;
	var answer = confirm(userNo+'번 회원의 로그인 차단을 취소하시겠습니까?');

	if(answer == true) {
		$.ajax({
			type: "get"
			, url: "/admin/user/able"
			, data: {
				userNo: userNo
			}
			, success: function (res) {
				if(res == 'success'){
					alert(userNo+'번 회원의 로그인 차단이 취소되었습니다.');
					location.href="/admin/user/list";										
				} else {
					alert('로그인 차단이 정상적으로 처리되지 않았습니다.');
					location.href="/admin/user/list";
				}
			}
			, error: function () {
				console.log("AJAX 실패")
			}
		})
	} else {
		return false;
	}
}
</script>

<style type="text/css">

.title {
	margin: auto;
	margin-top: 50px;
	margin-bottom: 30px;
	text-align: center;
}

.tableList {
	text-align: center;
	width: 100%;
	background: #fff;
	margin: auto;
	margin-bottom: 50px;
	padding-bottom: 20px;
}

.table {
	margin-top: 10px;
}

th {
	background: #f3f3f3;
	text-align: center;
}

.table>tbody>tr>td {
	height: 50px;
	vertical-align: middle;
}

label {
	font-weight: normal !important;
}

input[type=checkbox] {
	width: 15px;
	height: 15px;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">
<div class="title">
	<h1>회원 목록</h1>
</div>

<div class="tableList">
<span class="pull-left">총 ${paging.totalCount }명</span>
<div class="pull-right" style="width: 300px; margin: 0 auto;">
	<input class="form-control pull-left" type="text" id="search" name="search" value="${param.search }" placeholder="닉네임을 검색하세요" style="width: 80%;"/>
	<button id="btnSearch" class="pull-right btn">검색</button>
</div>
<div class="clearfix"></div>
<table class="table table-hover table-condensed">
<tr>
	<th><input type="checkbox" id="selectAll" name="select" /></th>
	<th>회원번호</th>
	<th>아이디</th>
	<th>닉네임</th>
	<th>이메일</th>
	<th>가입일</th>
	<th>여유자금</th>
	<th>생일</th>
	<th>성별</th>
	<th>포인트</th>
	<th>최근 차단 이력</th>
	<th> </th>
	<th> </th>
	
</tr>
<c:forEach items="${userList }" var="i">
<tr>
	<td><input type="checkbox" id="${i.userNo }" class="chk" value="${i.userNo }" /></td>
	<td><label for="${i.userNo}">${i.userNo }</label></td>
	<td><label for="${i.userNo}">${i.userId }</label></td>
	<td><label for="${i.userNo }">${i.userNick }</label></td>
	<td><label for="${i.userNo }">${i.userMail }</label></td>
	<td><label for="${i.userNo }"><fmt:formatDate value="${i.joinDate }" pattern="yyyy-MM-dd"/></label></td>
	<td><label for="${i.userNo }">${i.extraMoney }</label></td>
	<td><label for="${i.userNo }">${i.userBday }</label></td>
	<td>
		<label for="${i.userNo }">
			<c:if test="${i.userGender == 'F'}">여</c:if>
			<c:if test="${i.userGender == 'M'}">남</c:if>
		</label>
	</td>
	<td><label for="${i.userNo }">${i.userPoint }</label></td>
	<td>
		<c:if test="${empty i.unablePeriod }">없음</c:if>
		<c:if test="${not empty i.unablePeriod }">~<fmt:formatDate value="${i.unablePeriod }" pattern="yyyy-MM-dd"/></c:if>
	</td>
	<td><button id="${i.userNo }" class="btn" onclick="setUnablePeriod(this.id)">차단하기</button></td>
	<td><button id="${i.userNo }" class="btn" onclick="setUnablePeriodNull(this.id)">차단취소</button></td>
</tr>
</c:forEach>
</table>
<button id="btnDelete" class="pull-left btn">삭제</button>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />
</div><!-- .table end -->
</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

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
		var result = confirm("선택한 게시글을 삭제하시겠습니까?")
		var deleteAsk = [];
   
	    $('.check:checked').each(function(){
	    	deleteAsk.push($(this).val());
	    });
		if( result == true ){
			location.href="/admin/ask/delete?askNo="+deleteAsk;
		} else {
			return false;
		}
	})
	
	$("#btnSearch").click(function() {
		location.href="/admin/ask/list?search="+$("#search").val();
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

<h3>질문게시판 목록</h3>
<hr>
<span class="pull-left">총 ${paging.totalCount }개</span>
<div class="pull-right" style="width: 300px; margin: 0 auto;">
	<input class="form-control pull-left" type="text" id="search" name="search" value="${param.search }" style="width: 80%;"/>
	<button id="btnSearch" class="pull-right btn">검색</button>
</div>
<div class="clearfix"></div>
<table class="table table-hover table-condensed">
<tr>
	<th>	</th>
	<th>질문글 번호</th>
	<th width="45%">제목</th>
	<th>닉네임</th>
	<th>조회수</th>
	<th>작성일</th>
</tr>
<c:forEach items="${list }" var="askList">
<tr>
	<td><input type="checkbox" id="${askList.askNo }" value="${askList.askNo }" class="check" /></td>
	<td><label for="${askList.askNo}">${askList.askNo }</label></td>
	<td><label for="${askList.askNo }"><a href="/admin/ask/detail?askNo=${askList.askNo }">${askList.askTitle }</a></label></td>
		<c:forEach items="${user }" var="user">
			<c:if test="${ask.userNo ne 0}">
				<c:if test="${askList.userNo eq user.userNo}">
					<td><label for="${askList.askNo }">${user.userNick }</label></td>
				</c:if>
			</c:if>
		</c:forEach>
			<c:if test="${askList.userNo eq 0}">
				<td>탈퇴한 회원입니다</td>
			</c:if>
	<td><label for="${askList.askNo }">${askList.askHit }</label></td>
	<td><fmt:formatDate value="${askList.askDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>

</table>
<button id="btnDelete" class="pull-left">삭제</button>
<button id="btnWrite" class="pull-right">작성</button>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

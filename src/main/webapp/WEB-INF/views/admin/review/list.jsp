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
	
	$(document).on('click', '#selectAll', function() {
	    if($('#selectAll').is(':checked')){
	       $('.check').prop('checked', true);
	    } else {
	       $('.check').prop('checked', false);
	    }
	});
	
	$(document).on('click', '.check', function() {
	    if($('input[class=check]:checked').length==$('.check').length){
	        $('#selectAll').prop('checked', true);
	    }else{
	       $('#selectAll').prop('checked', false);
	    }
	});
	
	
	
	
	
	$("#btnDelete").click(function(){
		var result = confirm("선택한 게시글을 삭제하시겠습니까?")
		var deleteReview = [];
   
	    $('.check:checked').each(function(){
	    	deleteReview.push($(this).val());
	    });
		if( result == true ){
			location.href="/admin/review/delete?reviewNo="+deleteReview;
		} else {
			return false;
		}
	})
	
	$("#btnSearch").click(function() {
		location.href="/admin/review/list?search="+$("#search").val();
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
.title {
	margin: 50px 0 30px 0;
}

.listTable {
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

.table>tbody>tr>th {
	background: #f3f3f3;
	vertical-align: middle;
}

.table>tbody>tr>td {
	height: 30px;
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
	<h1>지출내역서 목록</h1>
</div>

<div class="listTable">
<span class="pull-left">총 ${paging.totalCount }개</span>
<div class="pull-right" style="width: 300px; margin: 0 auto;">
	<input class="form-control pull-left" type="text" id="search" name="search" value="${param.search }" style="width: 80%;" placeholder="제목을 입력해주세요"/>
	<button id="btnSearch" class="pull-right btn">검색</button>
</div>
<div class="clearfix"></div>
<table class="table table-hover table-condensed">
<tr>
	<th style="text-align: center; width: 6%;">
		<input type="checkbox" name="select" id="selectAll" /></th>
	<th style="width: 8%;">글번호</th>
	<th style="text-align: center; width: 45%; padding-left: 30px;">제목</th>
	<th style="text-align: center; width: 12%; padding-right: 30px;">닉네임</th>
	<th style="text-align: center; width: 10%;">조회수</th>
	<th style="text-align: center; width: 17%;">작성일</th>
</tr>
<c:forEach items="${reviewList }" var="review">
<tr>
	<td><input type="checkbox" name="select" id="${review.REVIEW_NO }" value="${review.REVIEW_NO }" class="check" /></td>
	<td><label for="${review.REVIEW_NO}">${review.REVIEW_NO }</label></td>
	<td style="text-align: left;"><label for="${review.REVIEW_NO }">
			<a href="/admin/review/detail?reviewNo=${review.REVIEW_NO }"><span style=" padding-left: 30px;">${review.REVIEW_TITLE }</span></a>
		</label></td>
		
		<c:if test="${review.USER_NO ne null}">
			<td style="text-align: left;">
				<label for="${review.REVIEW_NO }">${review.USER_NICK }</label>
			</td>
		</c:if>
		<c:if test="${review.USER_NO eq null}">
			<td style="text-align: left;">탈퇴한 회원</td>
		</c:if>
			
	<td><label for="${review.USER_NO }">${review.REVIEW_HIT }</label></td>
	<td><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
</tr>
</c:forEach>
</table>
<button id="btnDelete" class="pull-left btn">삭제</button>

<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .listTable end -->
</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
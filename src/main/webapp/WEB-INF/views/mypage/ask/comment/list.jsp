<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">
$(document).ready(function(){
	
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
	
	$("#btnDelete").click(function() {
		var answer = confirm("선택한 댓글을 삭제하시겠습니까?\n해당 작업은 되돌릴 수 없습니다.")
		var delchk = [];
   
	    $('.chk:checked').each(function(){
	        delchk.push($(this).val());
	    });
		if( answer == true ){
			location.href="/mypage/ask/comment/delete?askComNo="+delchk;
		} else {
			return false;
		}
	})

})
</script>

<style>
.titlearea {
	margin: 50px 0 30px 0;
}
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />

<div class="col-md-9" style="height: 500px;">
<div class="titlearea">
	<h3>질문게시판에 작성한 댓글</h3>
</div>
<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%;">전체 선택&nbsp;<input type="checkbox" name="select" id="selectAll" /></th>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">댓글</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${ask }" var="ask">
	<tr>
		<td><input type="checkbox" id="${ask.ASK_COM_NO }" value="${ask.ASK_COM_NO }" class="chk" /></td>
		<td>${ask.ASK_NO }</td>
		<td><a href="<%=request.getContextPath() %>/ask/detail?askNo=${ask.ASK_NO }">${ask.ASK_COM_CONTENT }</a></td>
		<td><fmt:formatDate value="${ask.ASK_COM_DATE }" pattern="yy-MM-dd HH:mm" /></td>
	</tr>
	</c:forEach>
</table>
<button id="btnDelete" class="pull-left">삭제</button>
<c:import url="/WEB-INF/views/layout/paging.jsp" />
</div>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


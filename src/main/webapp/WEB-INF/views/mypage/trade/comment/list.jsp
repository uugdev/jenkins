<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script>
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
			location.href="/mypage/trade/comment/delete?tradeComNo="+delchk;
		} else {
			return false;
		}
	})

})
</script>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />

<div class="col-md-9" style="height: 500px;">

<h3>거래게시판에 작성한 댓글</h3>
<table class="table table-striped table-hover">
<thead>
	<tr>
		<th>전체 선택&nbsp;<input type="checkbox" name="select" id="selectAll" /></th>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">댓글</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${trade }" var="trade">
	<tr>
		<td><input type="checkbox" id="${trade.TRADE_COM_NO }" value="${trade.TRADE_COM_NO }" class="chk" /></td>
		<td>${trade.TRADE_NO }</td>
		<td><a href="<%=request.getContextPath() %>/trade/detail?tradeNo=${trade.TRADE_NO }">${trade.TRADE_COM_CONTENT }</a></td>
		<td><fmt:formatDate value="${trade.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm" /></td>
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
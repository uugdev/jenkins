<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<style>
table {
	margin: 0 auto;
}

</style>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#btnDelete").click(function() {
		action_popup.confirm("쪽지를 삭제하시겠습니까? 삭제시 나의 보낸 쪽지함에서만 삭제되고 상대방의 쪽지함에서는 삭제되지 않습니다.", function(result) {

			if( result == true ){
	
				location.href="/message/send/delete?msgNo=${msg.msgNo}";
	
			} else {
				return false;
			}
		})
		
		/* 닫는 창으로 꼭 필요함 */
		$(".modal_close").on("click", function() {
			action_popup.close(this);
		});
	})

})
</script>

<style>
table {
	margin: 0 auto;
}


</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>보낸 쪽지</h3>

<table class="table table-hover" style="width:500px;">
	<tr>
		<td>받는 사람</td>
		<td>${userNick } </td>
		<td>보낸 시간</td>
		<td><fmt:formatDate value="${msg.msgDate }" pattern="yy-MM-dd HH:mm" /></td>
	</tr>
	<tr>
		<td colspan="4">${msg.msgTitle }</td>
	</tr>
	<tr>
		<td colspan="4" height="300px;">${msg.msgContent }</td>
	</tr>
	
</table>



<a href="/message/send/list"><button>목록</button></a>
<button id="btnDelete">삭제</button>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


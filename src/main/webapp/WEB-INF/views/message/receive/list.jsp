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
	$("#btnDelete").click(function(){
		var answer = confirm("선택한 쪽지를 삭제하시겠습니까?\n※해당 작업은 되돌릴 수 없습니다!")
		var delchk = [];
   
	    $('.chk:checked').each(function(){
	        delchk.push($(this).val());
	    });
		if( answer == true ){
			location.href="/message/receive/delete?msgNo="+delchk;
		} else {
			return false;
		}
	})

})
</script>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>받은 쪽지 리스트</h3>
<hr>

<table class="table table-hover">
	<thead>
	<tr>
		<th></th>
		<th>보낸 사람</th>
		<th>제목</th>
		<th>상태</th>
		<th>보낸 날짜</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${resultMapList }" var="map">
	<tr>
		<td><input type="checkbox" id="${map.MSG_NO }" value="${map.MSG_NO }" class="chk" /></td>
		<td>${map.USER_NICK }</td>
		<td><a href="<%=request.getContextPath() %>/message/receive/detail?msgNo=${map.MSG_NO }">${map.MSG_TITLE }</a></td>
		<td>
			<c:if test="${map.MSG_CHECK eq 'n'}" >읽지 않음</c:if>
			<c:if test="${map.MSG_CHECK eq 'y'}" >읽음</c:if>
		</td>
		<td><fmt:formatDate value="${map.MSG_DATE }" pattern="yy-MM-dd HH:MM" /></td>
	</tr>
	</c:forEach>
	</tbody>
</table>
<button id="btnDelete" class="pull-left">삭제</button>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

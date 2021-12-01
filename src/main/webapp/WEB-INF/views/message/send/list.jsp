<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">
function message () {
	var answer = confirm('쪽지를 보내시겠습니까?');
	
	if(answer) {
		
		window.open('/message/mem/write', '쪽지 보내기', 'width=620, height=500, left=400, top=500, resizable=no');
	} else {
		return false;
	}
}

</script>

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
		var delchk = [];
   
	    $('.chk:checked').each(function(){
	        delchk.push($(this).val());
	    });
	    
		action_popup.confirm("선택한 쪽지를 삭제하시겠습니까?\n삭제시 보낸 쪽지함에서만 삭제되고, 상대방의 쪽지함에서는 삭제되지 않습니다.", function(result) {
			
			if( result == true){
				location.href="/message/send/delete?msgNo="+delchk;
			} else {
				return false;
	
			}
		})
		
		/* 닫는 창으로 꼭 필요함 */
		$(".modal_close").on("click", function() {
			action_popup.close(this);
		});


	});

})
</script>

<style>

body {
	background-color: #f2f2f2;
}

.tablearea {
	background-color: #fff;
	padding: 20px 50px 20px 50px;
	margin: 0 0 50px 0;
}

.titlearea > p {
	color: #85969E;
}

a {
	color: #667F92;
}

a:hover {
	cursor: pointer;
}

#btnDelete {
	width: 55px;
	height: 35px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
	margin: 0 0 110px 40px;

}

#btnDelete:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

#messageWrite {
	margin: 0 0 0 45px;
}



</style>



<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">
<div style="height: 30px;"></div>
<div class=pull-left>
	<a id="messageWrite" onclick="message()">쪽지 보내기</a>&nbsp;|&nbsp;<a href="/message/receive/list">받은 쪽지함</a><br>
</div>

<div style="height:10px;"></div>

<h3>보낸 쪽지함</h3>

<div style="height: 30px;"></div>
<div class="tablearea">
	<table class="table table-hover table-striped">
		<thead>
		<tr>
			<th style="width: 10%"><input type="checkbox" name="select" id="selectAll" /></th>
			<th style="width: 10%">받는 사람</th>
			<th style="width: 30%">제목</th>
			<th style="width: 10%">상태</th>
			<th style="width: 10%">보낸 날짜</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultMapList }" var="map">
		<tr>
			<td><input type="checkbox" id="${map.MSG_NO }" value="${map.MSG_NO }" class="chk" /></td>
			<td>${map.USER_NICK }</td>
			<td><a href="<%=request.getContextPath() %>/message/send/detail?msgNo=${map.MSG_NO }">${map.MSG_TITLE }</a></td>
			<td>
				<c:if test="${map.MSG_CHECK eq 'n'}" >읽지 않음</c:if>
				<c:if test="${map.MSG_CHECK eq 'y'}" >읽음</c:if>
			</td>
			<td><fmt:formatDate value="${map.MSG_DATE }" pattern="yy-MM-dd HH:mm" /></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>

	<button id="btnDelete" class="pull-left">삭제</button>
	<div style="height:30px;"></div>
	<c:import url="/WEB-INF/views/layout/paging.jsp" />
</div>

<div class="clearfix"></div>


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

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
		var delchk = [];
   
	    $('.chk:checked').each(function(){
	        delchk.push($(this).val());
	    });
	    
		action_popup.confirm("선택한 글을 스크랩 해제하시겠습니까?\n해당 작업은 되돌릴 수 없습니다.", function(result) {
			
			if(result == true){
				location.href="/mypage/trade/scrap/delete?tradeNo="+delchk;
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
body {
	background-color: #f2f2f2;
}
.container {
	width: 1200px;
}

.titlearea {
	margin: 50px 0 30px 0;
}

.tablearea {
	background-color: #fff;
	padding: 20px 50px 20px 50px;
	
}

.titlearea > p {
	color: #85969E;
}

#btnDelete {
	width: 55px;
	height: 35px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;

}

#btnDelete:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />
	
	<div class="titlearea">
		<h2>스크랩한 거래</h2>
		<p>거래게시판에서 스크랩한 글 목록</p>
	</div>
	<div class="col-md-9" style="height: 500px;">
		<div class="tablearea">
			<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>전체 선택&nbsp;<input type="checkbox" name="select" id="selectAll" /></th>
					<th style="width: 10%;">글번호</th>
					<th style="width: 45%;">제목</th>
					<th style="width: 10%;">조회수</th>
					<th style="width: 15%;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${trade }" var="trade">
				<tr>
					<td><input type="checkbox" id="${trade.SCRAP_NO }" value="${trade.SCRAP_NO }" class="chk" /></td>
					<td>${trade.TRADE_NO }</td>
					<td><a href="<%=request.getContextPath() %>/trade/detail?tradeNo=${trade.TRADE_NO }">${trade.TRADE_TITLE }</a></td>
					<td>${trade.TRADE_HIT }</td>
					<td><fmt:formatDate value="${trade.TRADE_DATE}" pattern="yy-MM-dd" /></td>
				</tr>
				</c:forEach>
			</table>
		<button id="btnDelete" class="pull-left">삭제</button>
		<c:import url="/WEB-INF/views/layout/paging.jsp" />
		</div>
	<div class="clearfix"></div>
	
	</div>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

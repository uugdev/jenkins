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
		var result = confirm("허위 신고글을 삭제하시겠습니까?")
		var deletetrade = [];
   
		$('.check:checked').each(function(){
			deletetrade.push($(this).val());
	    });
	    
		if( result == true ){
			location.href="/admin/report/trade/delete?reportNo="+deletetrade;
		} else {
			return false;
		}
	})

	$("#btnSearch").click(function() {
		location.href="/admin/report/trade/list?search="+$("#search").val();
	});
	
	$("#search").keypress(function(event){
	     if ( event.which == 13 ) {
	         $("#btnSearch").click();
	         return false;
	     }
	});
})
</script>

<script type="text/javascript">
function statusToY(tradeNo) {
		
	console.log("ajax 처리 전")
	
	$.ajax({
		type: "post"
		, url: "/admin/report/trade/list/statustoy"
		, dataType: "json"
		, data: {
			tradeNo: tradeNo
		}
		, success: function(data){
			if(data.changeStatus) {
				
				$(".btnStatusN"+tradeNo).before('<button id="status" class="btnStatusY'+ tradeNo +'" onclick="statusToN('+ tradeNo +');">완료</button>');
				$(".btnStatusN"+tradeNo).remove();
				
// 				$(".btnStatusN"+tradeNo).attr("onclick", "statusToN("+ tradeNo + ")");
// 				$(".btnStatusN"+tradeNo).attr("class", "statusToY"+ tradeNo);
				
				console.log("완료로 바껴라")
				
			} else {
				alert("신고 처리 완료 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}
	
function statusToN(tradeNo) {
	
	$.ajax({
		type: "post"
		, url: "/admin/report/trade/list/statuston"
		, dataType: "json"
		, data: {
			tradeNo: tradeNo
		}
		, success: function(data){
			if(data.changeStatus) {
				
				$(".btnStatusY"+tradeNo).before('<button id="status" class="btnStatusN'+ tradeNo +'" onclick="statusToY('+ tradeNo +');" >미완료</button>');
				$(".btnStatusY"+tradeNo).remove();
// 				$(".btnStatusY"+tradeNo).attr("onclick", "statusToY("+ tradeNo + ")");
// 				$(".btnStatusY"+tradeNo).attr("class", "statusToN"+ tradeNo);
				
				console.log(".btnStatusY"+tradeNo);
				console.log("미완료로 바껴라")
				
			} else {
				alert("신고 처리 미완료 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}
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

#status {
	display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    width: 65px;
}
</style>

<!-- 개별 영역 끝 -->


<div class="wrap">
<div class="container">

<div class="title">
	<h1>거래 신고게시판 목록</h1>
</div>

<div class="listTable">
<span class="pull-left">총 ${paging.totalCount }개</span>
<div class="pull-right" style="width: 300px; margin: 0 auto;">
	<input class="form-control pull-left" type="text" id="search" name="search" value="${param.search }" style="width: 80%;"/>
	<button id="btnSearch" class="pull-right btn">검색</button>
</div>
<div class="clearfix"></div>
<table class="table table-hover table-condensed">
<tr>
	<th><input type="checkbox" name="select" id="selectAll" /></th>
	<th>신고글 번호</th>
	<th>신고사유</th>
	<th>신고 내용</th>
	<th>게시글 제목</th>
	<th>피신고자</th>
	<th>신고일</th>
	<th>처리여부</th>
</tr>
<c:forEach items="${tradeReportList }" var="trade">
<tr>
	<td><input type="checkbox" name="select" id="${trade.REPORT_NO }" value="${trade.REPORT_NO }" class="check" /></td>
	<td><label for="${trade.REPORT_NO}">${trade.REPORT_NO }</label></td>
	
	<c:if test="${trade.USER_NO eq trade.RESPONDENT_NO }">
		<c:choose>
			<c:when test="${trade.REPORT_CATEGORY eq 'A' }">
				<td>부적절한 홍보 게시글</td>
			</c:when>
			<c:when test="${trade.REPORT_CATEGORY eq 'B' }">
				<td>음란성 또는 청소년에게 부적합한 내용</td>
			</c:when>
			<c:when test="${trade.REPORT_CATEGORY eq 'C' }">
				<td>명예훼손/사생활 침해 및 저작권침해등</td>
			</c:when>
			<c:when test="${trade.REPORT_CATEGORY eq 'D' }">
				<td>기타</td>
			</c:when>
		</c:choose>
	</c:if>
	<td><label for="${trade.REPORT_NO }" class="ellipsis2">${trade.REPORT_CONTENT }</label></td>
	
	<td><label for="${trade.TRADE_NO }"><a href="/admin/report/trade/detail?tradeNo=${trade.TRADE_NO }" class="ellipsis2">${trade.TRADE_TITLE }</a></label></td>
		
	<c:if test="${trade.USER_NO ne 0}">
		<td><label for="${trade.TRADE_NO }">${trade.USER_NICK }</label></td>
	</c:if>
	<c:if test="${trade.USER_NO eq 0}">
		<td>탈퇴한 회원입니다</td>
	</c:if>
			
	<td><fmt:formatDate value="${trade.REPORT_DATE }" pattern="yyyy-MM-dd"/></td>
	
	<c:if test="${trade.REPORT_STATUS == 'n' }">
		<td><button class="btnStatusN${trade.TRADE_NO }" id="status" onclick="statusToY(${trade.TRADE_NO});" >미완료</button></td>
	</c:if>
	<c:if test="${trade.REPORT_STATUS == 'y' }">
		<td><button class="btnStatusY${trade.TRADE_NO }" id="status" onclick="statusToN(${trade.TRADE_NO});">완료</button></td>
	</c:if>
	
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
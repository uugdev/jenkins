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
		var result = confirm("허위 신고글을 삭제하시겠습니까??????")
		var deleteReview = [];
   
		$('.check:checked').each(function(){
			deleteReview.push($(this).val());
	    });
	    
		if( result == true ){
			location.href="/admin/report/review/delete?reportNo="+deleteReview;
		} else {
			return false;
		}
	})

	$("#btnSearch").click(function() {
		location.href="/admin/report/review/list?search="+$("#search").val();
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
function statusToY(reviewNo) {
		
	console.log("ajax 처리 전")
	
	$.ajax({
		type: "post"
		, url: "/admin/report/review/list/statustoy"
		, dataType: "json"
		, data: {
			reviewNo: reviewNo
		}
		, success: function(data){
			if(data.changeStatus) {
				
				$(".btnStatusN"+reviewNo).before('<button class="btnStatusY'+ reviewNo +'" onclick="statusToN('+ reviewNo +');">완료</button>');
				$(".btnStatusN"+reviewNo).remove();
				
// 				$(".btnStatusN"+reviewNo).attr("onclick", "statusToN("+ reviewNo + ")");
// 				$(".btnStatusN"+reviewNo).attr("class", "statusToY"+ reviewNo);
				
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
	
function statusToN(reviewNo) {
	
	$.ajax({
		type: "post"
		, url: "/admin/report/review/list/statuston"
		, dataType: "json"
		, data: {
			reviewNo: reviewNo
		}
		, success: function(data){
			if(data.changeStatus) {
				
				$(".btnStatusY"+reviewNo).before('<button class="btnStatusN'+ reviewNo +'" onclick="statusToY('+ reviewNo +');" >미완료</button>');
				$(".btnStatusY"+reviewNo).remove();
// 				$(".btnStatusY"+reviewNo).attr("onclick", "statusToY("+ reviewNo + ")");
// 				$(".btnStatusY"+reviewNo).attr("class", "statusToN"+ reviewNo);
				
				console.log(".btnStatusY"+reviewNo);
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

.ellipsis2 {
 	display: -webkit-box;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
/* 	line-height: 1.2em; */
/* 	max-height: 1.2em; */
	word-wrap: break-word;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	width: 100px;
}
</style>

<!-- 개별 영역 끝 -->


<div class="wrap">
<div class="container">

<h3>후기 신고게시판 목록</h3>
<hr>
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
<c:forEach items="${reviewReportList }" var="review">
<tr>
	<td><input type="checkbox" name="select" id="${review.REPORT_NO }" value="${review.REPORT_NO }" class="check" /></td>
	<td><label for="${review.REPORT_NO}">${review.REPORT_NO }</label></td>
	
	<c:if test="${review.USER_NO eq review.RESPONDENT_NO }">
		<c:choose>
			<c:when test="${review.REPORT_CATEGORY eq 'A' }">
				<td>부적절한 홍보 게시글</td>
			</c:when>
			<c:when test="${review.REPORT_CATEGORY eq 'B' }">
				<td>음란성 또는 청소년에게 부적합한 내용</td>
			</c:when>
			<c:when test="${review.REPORT_CATEGORY eq 'C' }">
				<td>명예훼손/사생활 침해 및 저작권침해등</td>
			</c:when>
			<c:when test="${review.REPORT_CATEGORY eq 'D' }">
				<td>기타</td>
			</c:when>
		</c:choose>
	</c:if>
	<td><label for="${review.REPORT_NO }" class="ellipsis2">${review.REPORT_CONTENT }</label></td>
	
	<td><label for="${review.REVIEW_NO }"><a href="/admin/report/review/detail?reviewNo=${review.REVIEW_NO }" class="ellipsis2">${review.REVIEW_TITLE }</a></label></td>
		
	<c:if test="${review.USER_NO ne 0}">
		<td><label for="${review.REVIEW_NO }">${review.USER_NICK }</label></td>
	</c:if>
	<c:if test="${review.USER_NO eq 0}">
		<td>탈퇴한 회원입니다</td>
	</c:if>
			
	<td><fmt:formatDate value="${review.REPORT_DATE }" pattern="yyyy-MM-dd"/></td>
	
	<c:if test="${review.REPORT_STATUS == 'n' }">
		<td><button class="btnStatusN${review.REVIEW_NO }" onclick="statusToY(${review.REVIEW_NO});" >미완료</button></td>
	</c:if>
	<c:if test="${review.REPORT_STATUS == 'y' }">
		<td><button class="btnStatusY${review.REVIEW_NO }" onclick="statusToN(${review.REVIEW_NO});">완료</button></td>
	</c:if>
	
</tr>
</c:forEach>

</table>
<button id="btnDelete" class="pull-left">삭제</button>

<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- <!-- 신고 처리 코드 영역 --> -->
<!-- <div class="popupWrap1 hide1"> -->
<!-- 	<div class="popup1"> -->
<!-- 		<div class="title"> -->
<!-- 			<p>신고 내용</p><span class="close1">❌</span> -->
<!-- 		</div> -->
<!-- 		<select id="reportCategory" name="reportCategory" class="select"> -->
<!-- 			<option value="A">부적절한 홍보 게시글</option> -->
<!-- 			<option value="B">음란성 또는 청소년에게 부적합한 내용</option> -->
<!-- 			<option value="C">명예훼손/사생활 침해 및 저작권침해등</option> -->
<!-- 			<option value="D">기타</option> -->
<!-- 		</select>	 -->
<!-- 		<textarea name="reportContent" id="reportContent" cols="30" rows="10"></textarea> -->
<!-- 		<div class="btnWrap1"> -->
<!-- 			<button id="setReport">보내기</button> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
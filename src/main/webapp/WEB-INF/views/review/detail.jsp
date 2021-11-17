<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />

<link rel="stylesheet" type="text/css" href="/resources/css/reportPopup.css">
<!-- header end -->

<script type="text/javascript">
$(document).ready(function() {
	if(${isScrap}) {
		$("#scrap")
			.html('스크랩 취소');
	} else {
		$("#scrap")
			.html('스크랩');
	}
	
	$("#scrap").click(function() {
		
		$.ajax({
			type: "get"
			, url: "/review/scrap"
			, data: { "reviewNo": '${review.REVIEW_NO }' }
			, dataType: "json"
			, success: function( data ) {
					console.log("성공");
	
				if( data.resultScrap ) { //스크랩 성공
					$("#scrap")
					.html('스크랩 취소');
				
				} else { //스크랩 취소 성공
					$("#scrap")
					.html('스크랩');
				
				}
				
// 				//추천수 적용
// 				$("#recommend").html(data.cnt);
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#btnRecommend").click() end
	
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/review/comment/write",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"reviewNo",
				value:"${review.REVIEW_NO }"
			})
		).append(
			$("<textarea>")
				.attr("name", "reviewComContent")
				.css("display", "none")
				.text($("#reviewComContent").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnCommInsert").click() end

	$("#btnDelete").click(function() {

		var result = confirm("정말 삭제하시겠습니까?");

		if (result == true) {
			$(location).attr("href", "/review/delete?reviewNo=${review.REVIEW_NO }");
		}

	});	//$("#btnDelete").click() end

});

function deleteComment(reviewComNo) {
	$.ajax({
		type: "post"
		, url: "/review/comment/delete"
		, dataType: "json"
		, data: {
			reviewComNo: reviewComNo
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-reviewComNo='"+reviewComNo+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}
</script>

<style type="text/css">
// Class
#item .center-block {
/*   display: block; */
  margin-left: auto;
  margin-right: auto;
}
</style>

<div class="container">


<h1 style="text-align: center;">${review.REVIEW_TITLE }</h1>
<hr>

<span class="pull-left">작성자 ${review.USER_NICK }</span>
<span class="pull-left"><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy-MM-dd HH:mm"/></span>
	<c:if test="${review.USER_NO ne userNo }">
		<c:if test="${review.USER_NO ne 0 }">
			<button id="scrap">스크랩</button>
			<button id="report" class="popupOpen1">신고</button>
		</c:if>
	</c:if>
<span class="pull-right">조회수 ${review.REVIEW_HIT }</span>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 33%;">브랜드</th>
			<th style="width: 33%;">상품명</th>
			<th style="width: 33%;">가격</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${item.itemBrand }</td>		
			<td>${item.itemName }</td>		
			<td>${item.itemPrice }원</td>	
		</tr>
	</tbody>
</table>

<div id="item" class="center-block">
	<img id="itemImg" src="/upload/${file.fileStored}" class="img-responsive" alt="Responsive image" />
</div>
<%-- <a href="/board/download?fileNo=${file.fileNo }">${file.fileOrigin }</a> --%>

<div style="text-align: center;">${review.REVIEW_CONTENT }</div><!-- 본문 -->

<hr>

<div class="text-center">
	<a href="/review/list">
	<button class="btn btn-default">목록</button></a>
	<c:if test="${userNo eq review.USER_NO }">
		<a href="/review/update?reviewNo=${review.REVIEW_NO }">
			<button class="btn btn-primary">수정</button></a>
		<a href="/review/delete?reviewNo=${review.REVIEW_NO }">
			<button  type="button" class="btn btn-danger"  id="btnDelete">삭제</button></a>
	</c:if>
</div>

<!-- 댓글 처리 -->
<hr>
<div>

	<!-- 비로그인상태 -->
	<c:if test="${not login }">
	<strong>로그인이 필요합니다</strong><br>
	<button onclick='location.href="/member/login";'>로그인</button>
	<button onclick='location.href="/member/join";'>회원가입</button>
	</c:if>
	
	<!-- 로그인상태 -->
	<c:if test="${login }">
	<!-- 댓글 입력 -->
	<div class="form-inline text-center">
		<input type="text" size="10" class="form-control" id="userNick" value="${userNick }" readonly="readonly"/>
		<textarea rows="2" cols="60" class="form-control" id="reviewComContent"></textarea>
		<button id="btnCommInsert" class="btn">입력</button>
	</div>	<!-- 댓글 입력 end -->
	</c:if>
	
	<!-- 댓글 리스트 -->
	<table class="table table-striped table-hover table-condensed">
	<thead>
	<tr>
		<!-- 		<th style="width: 5%;">번호</th> -->
		<th style="width: 10%;">작성자</th>
		<th style="width: 65%;">댓글</th>
		<th style="width: 20%;">작성일</th>
		<th style="width: 5%;"></th>
	</tr>
	</thead>

	<tbody id="commentBody">
	<c:forEach items="${commentList }" var="reviewComment">
	<tr data-reviewComNo="${reviewComment.REVIEW_COM_NO }">
<%-- 		 		<td style="width: 5%;">${reviewComment.rnum }</td> --%>
		<td style="width: 10%;">${reviewComment.USER_NICK }</td>
		<td style="width: 50%;">${reviewComment.REVIEW_COM_CONTENT }</td>
		<td style="width: 20%;">
			<fmt:formatDate value="${reviewComment.REVIEW_COM_DATE }" pattern="yy-MM-dd hh:mm:ss" /></td>
		<td style="width: 5%;">
			<c:if test="${sessionScope.userNo eq reviewComment.USER_NO }">
			<button class="btn btn-default btn-xs"
				onclick="deleteComment(${reviewComment.REVIEW_COM_NO });">삭제</button>
			</c:if>
		</td>		
	</tr>
	</c:forEach>
	</table>
	<!-- 	댓글 리스트 end -->

</div><!-- 댓글 처리 end -->

<!-- <div class="text-center"> -->
<!-- 	<a href="/review/list"> -->
<!-- 	<button class="btn btn-default">목록</button></a> -->
<%-- 	<c:if test="${userNo eq review.USER_NO }"> --%>
<%-- 		<a href="/review/update?reviewNo=${review.REVIEW_NO }"> --%>
<!-- 			<button class="btn btn-primary">수정</button></a> -->
<%-- 		<a href="/review/delete?reviewNo=${review.REVIEW_NO }"> --%>
<!-- 			<button type="button" class="btn btn-danger" id="btnDelete">삭제</button></a> -->
<%-- 	</c:if> --%>
<!-- </div> -->
	
</div><!-- .container end -->
<!-- </div>.wrap end -->

<div class="popupWrap1 hide1">
<form action="/review/report" method="post">
	<input type="hidden" name="reviewNo" value="${review.REVIEW_NO }" />
	<div class="popup1">
		<div class="title">
			<p>신고 하기</p><span class="close1">❌</span>
		</div>
		<select name="reportCategory" class="select">
			<option value="A">부적절한 홍보 게시글</option>
			<option value="B">음란성 또는 청소년에게 부적합한 내용</option>
			<option value="C">명예훼손/사생활 침해 및 저작권침해등</option>
			<option value="D">기타</option>
		</select>	
		<textarea name="reportContent" id="reportContent" cols="30" rows="10"></textarea>
		<div class="btnWrap1">
			<button>보내기</button>
		</div>
	</div>
</form>
</div>
	
<script>
$('.popupOpen1').on('click', function() {
	$('.popupWrap1').removeClass('hide1');
});
$('.close1').on('click', function() {
	$(this).parents('.popupWrap1').addClass('hide1');
	$(this).parents('.popup1').children('textarea').val('');
});

$(".btnWrap1").click(function() {
	$(this).parents("form").submit();
		history.go(-1);
});
</script>


<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
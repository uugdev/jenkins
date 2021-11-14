<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->


<script type="text/javascript">
$(document).ready(function() {
// 	if(${isRecommend}) {
// 		$("#btnRecommend")
// 			.addClass("btn-warning")
// 			.html('추천 취소');
// 	} else {
// 		$("#btnRecommend")
// 			.addClass("btn-primary")
// 			.html('추천');
// 	}
	
// 	$("#btnRecommend").click(function() {
		
// 		$.ajax({
// 			type: "get"
// 			, url: "/board/recommend"
// 			, data: { "boardNo": '${viewBoard.boardNo }' }
// 			, dataType: "json"
// 			, success: function( data ) {
// 					console.log("성공");
	
// 				if( data.result ) { //추천 성공
// 					$("#btnRecommend")
// 					.removeClass("btn-primary")
// 					.addClass("btn-warning")
// 					.html('추천 취소');
				
// 				} else { //추천 취소 성공
// 					$("#btnRecommend")
// 					.removeClass("btn-warning")
// 					.addClass("btn-primary")
// 					.html('추천');
				
// 				}
				
// 				//추천수 적용
// 				$("#recommend").html(data.cnt);
// 			}
// 			, error: function() {
// 				console.log("실패");
// 			}
// 		}); //ajax end
		
// 	}); //$("#btnRecommend").click() end
	
	
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

<div class="container">


<h1 style="text-align: center;">${review.REVIEW_TITLE }</h1>
<hr>

<span class="pull-left">작성자 ${review.USER_NICK }</span>
<span class="pull-left"><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy-MM-dd HH:mm"/></span>
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

<div id="item">
	<img id="itemImg" src="/upload/${file.fileStored}" alt="상품사진" />
</div>


<div style="text-align: center;">${review.reviewComContent }</div>

<div class="text-center">
	<a href="/review/list"><button class="btn btn-default">목록</button></a>
	<c:if test="${user.userNo eq review.USER_NO }">
		<a href="/review/update?reviewNo=${review.REVIEW_NO }"><button class="btn btn-primary">수정</button></a>
		<a href="/review/delete?reviewNo=${review.REVIEW_NO }"><button class="btn btn-danger">삭제</button></a>
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

<!-- 	<tbody id="commentBody"> -->
<%-- 	<c:forEach items="${commentList }" var="reviewComment"> --%>
<%-- 	<tr data-reviewComNo="${reviewComment.reviewComNo }"> --%>
<%-- 		<c:forEach items="${userList }" var="userList"> --%>
<%-- 			<c:if test="${reviewComment.userNo eq userList.userNo }"> --%>
<%-- 				<td style="width: 10%;">${userList.USER_NICK }</td> --%>
<%-- 			</c:if> --%>
<%-- 		</c:forEach> --%>
<%-- 		<td style="width: 65%;">${reviewComment.reviewComContent }</td> --%>
<!-- 		<td style="width: 20%;"> -->
<%-- 			<fmt:formatDate value="${reviewComment.reviewComDate }" pattern="yy-MM-dd hh:mm:ss" /></td> --%>
<%-- 			<c:if test="${review.USER_NO eq reviewComment.userNo }"> --%>
<!-- 			<td style="width: 5%;"> -->
<!-- 			<button class="btn btn-default btn-xs" -->
<%-- 				onclick="deleteComment(${reviewComment.reviewComNo });">삭제</button> --%>
<%-- 			</c:if> --%>
<!-- 		</td>		 -->
<!-- 	</tr> -->
<%-- 	</c:forEach> --%>
<!-- 	</table> -->
<!-- 	댓글 리스트 end -->

	<tbody id="commentBody">
	<c:forEach items="${commentList }" var="reviewComment">
	<tr data-reviewComNo="${reviewComment.reviewComNo }">
<%-- 		 		<td style="width: 5%;">${reviewComment.rnum }</td> --%>
		<td style="width: 10%;">${review.USER_NICK }</td>
		<td style="width: 50%;">${reviewComment.reviewComContent }</td>
		<td style="width: 20%;">
			<fmt:formatDate value="${reviewComment.reviewComDate }" pattern="yy-MM-dd hh:mm:ss" /></td>
		<td style="width: 5%;">
			<c:if test="${review.USER_NO eq reviewComment.userNo }">
			<button class="btn btn-default btn-xs"
				onclick="deleteComment(${reviewComment.reviewComNo });">삭제</button>
			</c:if>
		</td>		
	</tr>
	</c:forEach>
	</table>
	<!-- 	댓글 리스트 end -->

</div><!-- 댓글 처리 end -->


<%-- --%>
	
</div><!-- .container end -->
<!-- </div>.wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "ask/comment/write",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"askNo",
				value:"${viewBoard.askNo }"
			})
		).append(
			$("<textarea>")
				.attr("name", "content")
				.css("display", "none")
				.text($("#commentContent").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnCommInsert").click() end

});

function deleteComment(commentNo) {
	$.ajax({
		type: "post"
		, url: "/ask/comment/delete"
		, dataType: "json"
		, data: {
			askComNo: askComNo
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-askComNo='"+askComNo+"']").remove();
				
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
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

#item {
 width : 200px;
 height: 200px
}

#votedate {
	text-align: center;
}

#choice {
	text-align: center;
	height: 100px;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<%-- --%>

<h1 style="text-align: center;">${ask.askTitle }</h1>
<!-- <button id="btnRecommend" class="btn pull-right">추천</button> -->
<!-- <div class="clearfix"></div> -->
<hr>

<span>작성자 : ${user.userNick }</span> |
<span><fmt:formatDate value="${ask.askDate }" pattern="yy-MM-dd HH:mm"/></span>
조회수 : ${ask.askHit }

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

<div id="item"  style="text-align: center;">
	<img src="/upload/${file.fileStored}" alt="상품사진" />
</div>


<div style="text-align: center;">${ask.askContent }</div>

<hr>



<div id="votedate">
<fmt:formatDate value="${vote.voteStart}" pattern="yy-MM-dd HH:mm"/>
~
<fmt:formatDate value="${vote.voteEnd}" pattern="yy-MM-dd HH:mm"/>
</div>

<div id="choice">투표 영역</div>

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
		<input type="text" size="10" class="form-control" id="commentWriter" value="${userNick }" readonly="readonly"/>
		<textarea rows="2" cols="60" class="form-control" id="commentContent"></textarea>
		<button id="btnCommInsert" class="btn">입력</button>
	</div>	<!-- 댓글 입력 end -->
	</c:if>
	
	<!-- 댓글 리스트 -->
	<table class="table table-striped table-hover table-condensed">
	<thead>
	<tr>
		<th style="width: 5%;">번호</th>
		<th style="width: 10%;">작성자</th>
		<th style="width: 50%;">댓글</th>
		<th style="width: 20%;">작성일</th>
		<th style="width: 5%;"></th>
	</tr>
	</thead>
	<tbody id="commentBody">
	<c:forEach items="${commentList }" var="comment">
	<tr data-commentno="${comment.commentNo }">
		<td style="width: 5%;">${comment.rnum }</td>
		<td style="width: 10%;">${comment.id }</td><!-- 닉네임으로 해도 좋음 -->
		<td style="width: 50%;">${comment.content }</td>
		<td style="width: 20%;"><fmt:formatDate value="${comment.writeDate }" pattern="yy-MM-dd hh:mm:ss" /></td>
		<td style="width: 5%;">
			<c:if test="${sessionScope.id eq comment.id }">
			<button class="btn btn-default btn-xs"
				onclick="deleteComment(${comment.commentNo });">삭제</button>
			</c:if>
		</td>
		
	</tr>
	</c:forEach>
	</table>	<!-- 댓글 리스트 end -->

</div>	<!-- 댓글 처리 end -->

<div class="text-center">
	<a href="/ask/list"><button class="btn btn-default">목록</button></a>
	<c:if test="${user.userNo eq ask.userNo }">
		<a href="/ask/update?askNo=${ask.askNo }"><button class="btn btn-primary">수정</button></a>
		<a href="/ask/delete?askNo=${ask.askNo }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>


<%-- --%>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


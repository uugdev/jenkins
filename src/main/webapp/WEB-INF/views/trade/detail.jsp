<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/tradeDetail.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	// 댓글 입력
// 	$("#btnCommInsert").click(function() {
		
// 		var newForm = $('<form></form>');
// 		//set attribute (form)
// 		newForm.attr("name","newForm");
// 		newForm.attr("method","post");
// 		newForm.attr("action","/trade/comment/write");
		
// 		var textarea = $("#tradeComContent").val();
		
// 		// create element & set attribute (input)
// 		newForm.append($('<input/>', {type: 'hidden', name: 'tradeNo', value:'${tradeDetail.TRADE_NO }' }));
// 		newForm.append($('<textarea/>', {display: 'none', name: 'tradeComContent', text: textarea }));
		
// 		if($("input:checkbox[id='tradeComSecret']").is(":checked") == true){
// 			newForm.append($('<input/>', {type: 'hidden', name: 'tradeComSecret', value:'y' }));
// 		}
		
// 		if($("input:checkbox[id='tradeComSecret']").is(":checked") == false){
// 			newForm.append($('<input/>', {type: 'hidden', name: 'tradeComSecret', value:'n' }));
// 		}

// 		// append form (to body)
// 		newForm.appendTo('body');

// 		// submit form
// 		newForm.submit();
		
// 	});
	//$("#btnCommInsert").click() end
	
	//댓글 수정 updateComment
	
})

function insertComment() {
	
	var textarea = $("#tradeComContent").val();
	var tradeComSecret = null;
	
	if($("input:checkbox[id='tradeComSecret']").is(":checked") == true){
		tradeComSecret = 'y';
	}
	
	if($("input:checkbox[id='tradeComSecret']").is(":checked") == false){
		tradeComSecret = 'n';
	}
	
	console.log(${tradeDetail.TRADE_NO })
	console.log(textarea)
	console.log(tradeComSecret)
	
	$.ajax({
		type: "post"
		, url: "/trade/comment/write"
		, dataType: "json"
		, data: {
			tradeNo: ${tradeDetail.TRADE_NO }
			, tradeComContent: textarea
			, tradeComSecret: tradeComSecret
		}
		, success: function(data){
			if(data.success) {
				console.log("ajax 성공")
				console.log(data.addComment)
				
				var userNo = '<%= session.getAttribute("userNo")%>';
				var tradeComDate = moment(data.addComment.tradeComDate).format("YY-MM-DD HH:mm:ss");
				
				if(data.addComment.tradeComSecret == 'y') {
					$('#commentBody').after('<tr data-updateTradeComNo="'+ data.addComment.tradeComNo +'"></tr>' +
							'<tr data-tradeComNo="'+ data.addComment.tradeComNo +'" style="text-align: left;">' +
							'<td style="width: 4%; text-align: center; padding: 5px;">' +
							'<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">' +
							'</td>' +
							'<td style="width: 10%; padding: 5px;">'+ data.userNick +'</td>' +
							'<td id="td'+ data.addComment.tradeComNo +'" style="width: 66%; padding: 5px;">'+ data.addComment.tradeComContent +'</td>' +
							'<td style="width: 10%; padding: 5px;">'+ tradeComDate +'</td>' +
							'<td style="width: 10%; padding: 5px;">' +
							'<button class="btn btn-default btn-xs" onclick="deleteComment('+ data.addComment.tradeComNo +');">삭제</button> ' +
							'<button class="btn btn-default btn-xs" onclick="updateComment('+ data.addComment.tradeComNo +');">수정</button>' +
							'</td>' +
							'</tr>');
				}
				
				if(data.addComment.tradeComSecret == 'n') {
					$('#commentBody').after('<tr data-updateTradeComNo="'+ data.addComment.tradeComNo +'"></tr>' +
							'<tr data-tradeComNo="'+ data.addComment.tradeComNo +'" style="text-align: left;">' +
							'<td style="width: 4%; text-align: center; padding: 5px;"></td>' +
							'<td style="width: 10%; padding: 5px;">'+ data.userNick +'</td>' +
							'<td id="td'+ data.addComment.tradeComNo +'" style="width: 66%; padding: 5px;">'+ data.addComment.tradeComContent +'</td>' +
							'<td style="width: 10%; padding: 5px;">'+ tradeComDate +'</td>' +
							'<td style="width: 10%; padding: 5px;">' +
							'<button class="btn btn-default btn-xs" onclick="deleteComment('+ data.addComment.tradeComNo +');">삭제</button> ' +
							'<button class="btn btn-default btn-xs" onclick="updateComment('+ data.addComment.tradeComNo +');">수정</button>' +
							'</td>' +
							'</tr>');
				}
				
				$('#tradeComContent').val('');
						
			} else {
				console.log("ajax 실패")
			}
		}
		, error: function() {
			console.log("error");
		}
	});
	
}

function updateComment(tradeComNo) {
	
    var tdText = $("#td"+tradeComNo).text();
	console.log(tdText);
	
	console.log(tradeComNo);
	$("[data-tradeComNo='"+tradeComNo+"']").css("display", "none");
	$("[data-updateTradeComNo='"+tradeComNo+"']").append('<td style="width: 4%;"></td>' +
			'<td style="width: 10%;"></td>' +
			'<td style="width: 66%;">' +
			'<div class="form-inline text-center">' +
			'<div class="form-inline text-center">' +
			'<input type="text" size="10" class="form-control" id="userNick" value="${userNick }" readonly="readonly"/>' +
			'<textarea rows="2" cols="60" class="form-control" id="tradeComUpdateContent'+ tradeComNo +'">'+ tdText +'</textarea>' +
			'<button id="btnCommUpdate" class="btn" onclick="updateCom('+ tradeComNo +');">수정</button>　' +
			'<button id="btnCommUpdateCancel" class="btn" onclick="cancelCom('+ tradeComNo +');">취소</button>' +
			'</div>' +
			'</td>' +
			'<td style="width: 10%;"></td>' +
			'<td style="width: 10%;"></td>');
}

function updateCom(tradeComNo) {
	
	var textarea = $("#tradeComUpdateContent"+ tradeComNo).val();
	console.log(textarea)
	
	$.ajax({
		type: "post"
		, url: "/trade/comment/update"
		, dataType: "json"
		, data: {
			tradeComNo: tradeComNo
			, tradeComContent: textarea
		}
		, success: function(data){
			if(data.success) {
				$("[data-tradeComNo='"+tradeComNo+"']").css("display", "table-row");
				$("#td"+tradeComNo).html(data.tradeComment.tradeComContent);
				$("[data-updateTradeComNo='"+tradeComNo+"']").html('');
			} else {
				console.log("ajax 실패")
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}

function cancelCom(tradeComNo) {
	$("[data-tradeComNo='"+tradeComNo+"']").css("display", "table-row");
	$("[data-updateTradeComNo='"+tradeComNo+"']").html('');
}


function deleteComment(tradeComNo) {
	$.ajax({
		type: "post"
		, url: "/trade/comment/delete"
		, dataType: "json"
		, data: {
			tradeComNo: tradeComNo
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-tradeComNo='"+tradeComNo+"']").remove();
				
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

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

	<h1>${tradeDetail.TRADE_TITLE }</h1>
	<span style="float: left;">
		${tradeDetail.USER_NICK } | <fmt:formatDate value="${tradeDetail.TRADE_DATE }" pattern="YYYY-MM-dd HH:ss" />
	</span>
	<span style="float: right;">
		신고 | 조회 ${tradeDetail.TRADE_HIT } | 댓글 4
	</span>
	<hr style="margin-top: 40px;">
	
	<div id="detailMain" style="height: 500px;">
		<img alt="#" src="/upload/${tradeDetail.FILE_STORED }">
		<div id="writeContent">
			${tradeDetail.TRADE_CONTENT }
		</div>
	</div>

	<!-- 댓글 처리 -->
	<hr>
	<div>
	
		<!-- 댓글 리스트 -->
		<table class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 4%;"></th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 66%;">댓글</th>
					<th style="width: 10%;">작성일</th>
					<th style="width: 10%;"></th>
				</tr>
			</thead>
		
			<tbody id="commentBody">
				<c:forEach items="${tradeComment }" var="tradeComment">
					<tr data-updateTradeComNo="${tradeComment.TRADE_COM_NO }"></tr>
					<tr data-tradeComNo="${tradeComment.TRADE_COM_NO }">
						<c:choose>
		                	<c:when test="${tradeComment.TRADE_COM_SECRET eq 'y' }">
							<!-- 비밀글일 경우 -->
							
		                		<!-- 게시글 유저와 글쓴이가 아닐 경우 -->
		                		<c:if test="${sessionScope.userNo ne tradeDetail.USER_NO and sessionScope.userNo ne tradeComment.USER_NO }">
									<td style="width: 4%; text-align: center;">
										<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">
									</td>
									<td style="width: 10%;"></td>
									<td style="width: 66%; text-align: center;">비밀글입니다!</td>
									<td style="width: 10%;"></td>
									<td style="width: 10%;"></td>
		                		</c:if>
								
								<!-- 게시글 유저와 비밀글쓴이일 경우 -->
		                		<c:if test="${sessionScope.userNo eq tradeDetail.USER_NO or sessionScope.userNo eq tradeComment.USER_NO }">
									<td style="width: 4%; text-align: center;">
										<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">
									</td>
									<td style="width: 10%;">${tradeComment.USER_NICK }</td>
									<td id="td${tradeComment.TRADE_COM_NO }" style="width: 66%;">${tradeComment.TRADE_COM_CONTENT }</td>
									<td style="width: 10%;">
										<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd hh:mm:ss" />
									</td>
									<td style="width: 10%;">
										<c:if test="${sessionScope.userNo eq tradeComment.USER_NO }">
											<button class="btn btn-default btn-xs"
													onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
													삭제
											</button>
											<button class="btn btn-default btn-xs"
													onclick="updateComment(${tradeComment.TRADE_COM_NO });">
													수정
											</button>
										</c:if>
									</td>
		                		</c:if>
							</c:when>
						
		                	<c:when test="${tradeComment.TRADE_COM_SECRET eq 'n' }">
							<!-- 비밀글이 아닐 경우 -->
								<td style="width: 4%;"></td>
								<td style="width: 10%;">${tradeComment.USER_NICK }</td>
								<td id="td${tradeComment.TRADE_COM_NO }" style="width: 66%;">${tradeComment.TRADE_COM_CONTENT }</td>
								<td style="width: 10%;">
									<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd hh:mm:ss" />
								</td>
								<td style="width: 10%;">
									<c:if test="${sessionScope.userNo eq tradeComment.USER_NO }">
										<button class="btn btn-default btn-xs"
												onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
												삭제
										</button>
										<button class="btn btn-default btn-xs"
												onclick="updateComment(${tradeComment.TRADE_COM_NO });">
												수정
										</button>
									</c:if>
								</td>
							</c:when>
						</c:choose>
					</tr>
					<tr id="appendArea"></tr>
				</c:forEach>
			</tbody>
		</table>
		
		<hr style="border: 1px solid #ddd; margin-top: 0;">
		
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
			<input type="checkbox" id="tradeComSecret" name="tradeComSecret" />
			<label for="tradeComSecret">비밀글　</label>
			<input type="text" size="10" class="form-control" id="userNick" value="${userNick }" readonly="readonly"/>
			<textarea rows="2" cols="60" class="form-control" id="tradeComContent"></textarea>
			<button id="btnCommInsert" class="btn" onclick="insertComment();">입력</button>
		</div>
		<!-- 댓글 입력 end -->
		</c:if>
		
		<div class="text-right">
			<button type="button" onclick="location.href='/trade/list';" >목록으로</button>
		</div>
		
	</div>	<!-- 댓글 리스트 end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


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

function insertComment() {
	
	var textarea = $("#tradeComContent").val();
	var tradeComSecret = null;
	
	if($("input:checkbox[id='tradeComSecret']").is(":checked") == true){
		tradeComSecret = 'y';
	}
	
	if($("input:checkbox[id='tradeComSecret']").is(":checked") == false){
		tradeComSecret = 'n';
	}
	
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
				
				var userNo = '<%= session.getAttribute("userNo")%>';
				var tradeComDate = moment(data.addComment.tradeComDate).format("YY-MM-DD HH:mm:ss");
				
				if(data.addComment.tradeComSecret == 'y') {
					$('#appendArea').before('<tr data-updateTradeComNo="'+ data.addComment.tradeComNo +'"></tr>' +
							'<tr data-tradeComNo="'+ data.addComment.tradeComNo +'" style="text-align: left;">' +
							'<td style="width: 4%; text-align: center; padding: 5px;">' +
							'<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">' +
							'</td>' +
							'<td style="width: 10%; padding: 5px;">'+ data.userNick +'</td>' +
							'<td id="td'+ data.addComment.tradeComNo +'" style="width: 66%; padding: 5px;">'+ data.addComment.tradeComContent +'</td>' +
							'<td id="dateTd'+ data.addComment.tradeComNo +'" style="width: 10%; padding: 5px;">'+ tradeComDate +'</td>' +
							'<td style="width: 10%; padding: 5px;">' +
							'<button class="btn btn-default btn-xs" onclick="deleteComment('+ data.addComment.tradeComNo +');">삭제</button> ' +
							'<button class="btn btn-default btn-xs" onclick="updateComment('+ data.addComment.tradeComNo +');">수정</button>' +
							'</td>' +
							'</tr>');
				}
				
				if(data.addComment.tradeComSecret == 'n') {
					$('#appendArea').before('<tr data-updateTradeComNo="'+ data.addComment.tradeComNo +'"></tr>' +
							'<tr data-tradeComNo="'+ data.addComment.tradeComNo +'" style="text-align: left;">' +
							'<td style="width: 4%; text-align: center; padding: 5px;"></td>' +
							'<td style="width: 10%; padding: 5px;">'+ data.userNick +'</td>' +
							'<td id="td'+ data.addComment.tradeComNo +'" style="width: 66%; padding: 5px;">'+ data.addComment.tradeComContent +'</td>' +
							'<td id="dateTd'+ data.addComment.tradeComNo +'" style="width: 10%; padding: 5px;">'+ tradeComDate +'</td>' +
							'<td style="width: 10%; padding: 5px;">' +
							'<button class="btn btn-default btn-xs" onclick="deleteComment('+ data.addComment.tradeComNo +');">삭제</button> ' +
							'<button class="btn btn-default btn-xs" onclick="updateComment('+ data.addComment.tradeComNo +');">수정</button>' +
							'</td>' +
							'</tr>');
				}
				
				$('#tradeComContent').val('');
						
			} else {
				alert("댓글 작성 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
	
}

function updateComment(tradeComNo) {
	
    var tdText = $("#td"+tradeComNo).text();
    
	$("[data-tradeComNo='"+tradeComNo+"']").css("display", "none");
	$("[data-updateTradeComNo='"+tradeComNo+"']").append('<td style="width: 4%;"></td>' +
			'<td style="width: 10%;"></td>' +
			'<td style="width: 66%;">' +
			'<div class="form-inline text-center">' +
			'<input type="text" size="10" class="form-control" id="userNick" value="${userNick }" readonly="readonly"/> ' +
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
				var tradeComDate = moment(data.tradeComment.tradeComDate).format("YY-MM-DD HH:mm:ss");
				
				$("[data-tradeComNo='"+tradeComNo+"']").css("display", "table-row");
				$("#td"+tradeComNo).html(data.tradeComment.tradeComContent);
				$("#dateTd"+tradeComNo).html(tradeComDate);
				$("[data-updateTradeComNo='"+tradeComNo+"']").html('');
			} else {
				alert("댓글 수정 실패");
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
	
		<h1>
			${tradeDetail.TRADE_TITLE }
			<c:if test="${tradeDetail.TRADE_CATEGORY eq 1 }">
				[삽니다] 
			</c:if>
			<c:if test="${tradeDetail.TRADE_CATEGORY eq 0 }">
				[팝니다] 
			</c:if>
		</h1>
		<span style="float: left;">
		<c:if test="${sessionScope.userNo eq tradeDetail.USER_NO }">
		${tradeDetail.USER_NICK }
		</c:if>
		<c:if test="${sessionScope.userNo ne tradeDetail.USER_NO }">
		<a href="<%=request.getContextPath() %>/message/write?userNick=${user.userNick }"
					onclick="return confirm('쪽지를 보내시겠습니까?');">${tradeDetail.USER_NICK }</a>
		 </c:if>
	
			| <fmt:formatDate value="${tradeDetail.TRADE_DATE }" pattern="YYYY-MM-dd HH:ss" />
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
										<td id="dateTd${tradeComment.TRADE_COM_NO }" style="width: 10%;">
											<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
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
									<td id="dateTd${tradeComment.TRADE_COM_NO }" style="width: 10%;">
										<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
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
					</c:forEach>
					<tr id="appendArea"></tr>
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
				<button style="float: left;" type="button" onclick="location.href='/trade/list';" >목록으로</button>
				<c:if test="${sessionScope.userNo eq tradeDetail.USER_NO }">
					<button type="button" onclick="location.href='/trade/update?tradeNo=${tradeDetail.TRADE_NO}';" >수정</button>
					<button type="button" onclick="location.href='/trade/delete?tradeNo=${tradeDetail.TRADE_NO}';">삭제</button>
				</c:if>
			</div>
			
		</div>	<!-- 댓글 리스트 end -->
	
	</div><!-- .container end -->
<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div><!-- .wrap end -->



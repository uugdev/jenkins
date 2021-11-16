<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/tradeDetail.css" />

<script type="text/javascript">
$(document).ready(function() {
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		var newForm = $('<form></form>');
		//set attribute (form)
		newForm.attr("name","newForm");
		newForm.attr("method","post");
		newForm.attr("action","/trade/comment/write");
		
		var textarea = $("#tradeComContent").val();
		
		// create element & set attribute (input)
		newForm.append($('<input/>', {type: 'hidden', name: 'tradeNo', value:'${tradeDetail.TRADE_NO }' }));
		newForm.append($('<textarea/>', {display: 'none', name: 'tradeComContent', text: textarea }));
		
		if($("input:checkbox[id='tradeComSecret']").is(":checked") == true){
			newForm.append($('<input/>', {type: 'hidden', name: 'tradeComSecret', value:'y' }));
		}
		
		if($("input:checkbox[id='tradeComSecret']").is(":checked") == false){
			newForm.append($('<input/>', {type: 'hidden', name: 'tradeComSecret', value:'n' }));
		}

		// append form (to body)
		newForm.appendTo('body');

		// submit form
		newForm.submit();
		
	});
	//$("#btnCommInsert").click() end
	
})
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
					<tr data-tradeComNo="${tradeComment.TRADE_COM_NO }">
						<c:choose>
		                	<c:when test="${tradeComment.TRADE_COM_SECRET eq 'n' }">
							<!-- 비밀글이 아닐 경우 -->
								<td style="width: 4%;"></td>
								<td style="width: 10%;">${tradeComment.USER_NICK }</td>
								<td style="width: 66%;">${tradeComment.TRADE_COM_CONTENT }</td>
								<td style="width: 10%;">
									<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd hh:mm:ss" />
								</td>
								<td style="width: 10%;">
									<c:if test="${sessionScope.userNo eq tradeComment.USER_NO }">
										<button class="btn btn-default btn-xs"
												onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
												삭제
										</button>
									</c:if>
								</td>
							</c:when>
							
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
									<td style="width: 66%;">${tradeComment.TRADE_COM_CONTENT }</td>
									<td style="width: 10%;">
										<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd hh:mm:ss" />
									</td>
									<td style="width: 10%;">
										<c:if test="${sessionScope.userNo eq tradeComment.USER_NO }">
											<button class="btn btn-default btn-xs"
													onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
													삭제
											</button>
										</c:if>
									</td>
		                		</c:if>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 비로그인상태 -->
		<c:if test="${not login }">
			<hr style="border: 1px solid #ddd;">
			<strong>로그인이 필요합니다</strong><br>
			<button onclick='location.href="/member/login";'>로그인</button>
			<button onclick='location.href="/member/join";'>회원가입</button>
		</c:if>
		
		<!-- 로그인상태 -->
		<c:if test="${login }">
		<!-- 댓글 입력 -->
		<div class="form-inline text-center">
			<hr style="border: 1px solid #ddd;">
			<input type="checkbox" id="tradeComSecret" name="tradeComSecret" />
			<label for="tradeComSecret">비밀글 </label>
			<input type="text" size="10" class="form-control" id="userNick" value="${userNick }" readonly="readonly"/>
			<textarea rows="2" cols="60" class="form-control" id="tradeComContent"></textarea>
			<button id="btnCommInsert" class="btn">입력</button>
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


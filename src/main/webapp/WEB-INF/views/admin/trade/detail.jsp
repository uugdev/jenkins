<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />

<link rel="stylesheet" type="text/css" href="/resources/css/reportPopup.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/tradeDetail.css" />
<!-- header end -->

<script type="text/javascript">
$(document).ready(function() {	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/trade/comment/write",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"tradeNo",
				value:"${trade.TRADE_NO }"
			})
		).append(
			$("<textarea>")
				.attr("name", "tradeComContent")
				.css("display", "none")
				.text($("#tradeComContent").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnCommInsert").click() end

	$("#btnDelete").click(function() {

		var result = confirm("정말 삭제하시겠습니까?");

		if (result == true) {
			$(location).attr("href", "/admin/trade/delete?tradeNo=${tradeDetail.TRADE_NO }");
		}

	});	//$("#btnDelete").click() end

});

$("#btnDelete").click(function() {

	var result = confirm("정말 삭제하시겠습니까?") 

	if (result == true) {
		$(location).attr("href", "/admin/ask/delete?askNo=${ask.askNo }");
	}
	
});

var tradeComCount = ${tradeDetail.TRADE_COM_COUNT }

function deleteComment(tradeComNo) {
	
	var result = confirm("정말 삭제하시겠습니까?")
	
	if (result == true) {
        	
			$.ajax({
				type: "post"
				, url: "/trade/comment/delete"
				, dataType: "json"
				, data: {
					tradeComNo: tradeComNo
				}
				, success: function(data){

					$("#tradeComCount").html(--tradeComCount, tradeComCount);
					$("[data-tradeComNo='"+tradeComNo+"']").remove();

				}
				, error: function() {
					console.log("error");
				}
			});
			
	}
}

</script>

<div class="wrap">
	<div id="mainContainer" class="container">
	
		<div class="logo">
			<img alt="#" src="https://i.imgur.com/fdRrD3i.png">
		</div>
		<div style="font-size: 20px;">
		<p>
			<c:if test="${tradeDetail.TRADE_CATEGORY eq 1 }">
				[삽니다] 
			</c:if>
			<c:if test="${tradeDetail.TRADE_CATEGORY eq 0 }">
				[팝니다] 
			</c:if>
		</p>
		</div>
		
		<p style="font-size: 32px; margin-bottom: 20px;">
			${tradeDetail.TRADE_TITLE }
		</p>
		
		<div>
			<c:if test="${!empty tradeDetail.GRADE_URL }">
				<img alt="#" src="${tradeDetail.GRADE_URL }" width="20px" height="20px;">
			</c:if>
			<c:if test="${tradeDetail.USER_NO eq null }">
				탈퇴한 회원
			</c:if>
			<c:if test="${sessionScope.userNo eq tradeDetail.USER_NO || empty sessionScope.userNo  }">
				${tradeDetail.USER_NICK }
			</c:if>
			<c:if test="${sessionScope.userNo ne tradeDetail.USER_NO and !empty sessionScope.userNo }">
				${tradeDetail.USER_NICK }
			</c:if>
			<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<span><fmt:formatDate value="${tradeDetail.TRADE_DATE }" pattern="yy-MM-dd HH:mm"/></span>
			<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>				
			<span>조회 <span id="cntCom">${tradeDetail.TRADE_HIT }</span></span>
			<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			댓글<span id="tradeComCount"> ${tradeDetail.TRADE_COM_COUNT}</span>
		</div>
		
		<hr style="margin-top: 65px; border: 1px dashed;">
		
		<div id="detailMain">
			<c:if test="${tradeDetail.FILE_STORED ne null }">
				<img alt="#" src="/upload/${tradeDetail.FILE_STORED }" class="img-responsive center-block">
			</c:if>
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
						<th style="width: 15%;">닉네임</th>
						<th style="width: 58%;">댓글</th>
						<th style="width: 13%;">작성일</th>
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
								
									<!-- 게시글 유저와 비밀글쓴이일 경우 -->
			                			<c:if test="${tradeComment.USER_NICK eq null }">
											<td style="text-align: center;">
												<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">
											</td>
											<td>탈퇴한 회원</td>
			                			</c:if>
			                			<c:if test="${tradeComment.USER_NICK ne null }">
											<td style="text-align: center;">
												<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">
											</td>
											<td style="text-align: left;">
												<img alt="#" src="${tradeComment.GRADE_URL }" width="20px;" height="20px;"> ${tradeComment.USER_NICK }
											</td>
			                			</c:if>
										<td id="td${tradeComment.TRADE_COM_NO }">${tradeComment.TRADE_COM_CONTENT }</td>
										<td id="dateTd${tradeComment.TRADE_COM_NO }">
											<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
										</td>
										<td>
											<button class="btn_d"
													onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
													삭제
											</button>
										</td>
								</c:when>
							
			                	<c:when test="${tradeComment.TRADE_COM_SECRET eq 'n' }">
								<!-- 비밀글이 아닐 경우 -->
									<td></td>
									<c:if test="${tradeComment.USER_NICK eq null }">
										<td>탈퇴한 회원</td>
									</c:if>
									<c:if test="${tradeComment.USER_NICK ne null }">
										<td style="text-align: left;">
											<img alt="#" src="${tradeComment.GRADE_URL }" width="20px;" height="20px;"> ${tradeComment.USER_NICK }
										</td>
									</c:if>
									<td id="td${tradeComment.TRADE_COM_NO }">${tradeComment.TRADE_COM_CONTENT }</td>
									<td id="dateTd${tradeComment.TRADE_COM_NO }">
										<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
									</td>
									<td>
										<button class="btn_d"
												onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
												삭제
										</button>
									</td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
					<tr id="appendArea"></tr>
				</tbody>
			</table>
			
			<hr style="border: 1px solid #ddd; margin-top: 0;">
			
			<div class="text-center" style="margin-bottom: 20px;">
				<a href="/admin/trade/list"><button class="button">목록</button></a>
				<button type="button" class="button" id="btnDelete">삭제</button>
			</div>
		</div>	<!-- 댓글 리스트 end -->
	
	</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
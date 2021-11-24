<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />

<link rel="stylesheet" type="text/css" href="/resources/css/reportPopup.css">
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

<div class="wrap">
	<div class="container">
	
		<h1>
			<c:if test="${tradeDetail.TRADE_CATEGORY eq 1 }">
				[삽니다] 
			</c:if>
			<c:if test="${tradeDetail.TRADE_CATEGORY eq 0 }">
				[팝니다] 
			</c:if>
			${tradeDetail.TRADE_TITLE }
		</h1>
		<span style="float: left;">
		<c:if test="${tradeDetail.USER_NO eq null }">
			탈퇴(된)한 회원
		</c:if>
		<c:if test="${tradeDetail.USER_NO ne null }">
			${tradeDetail.USER_NICK }
		</c:if>
			| <fmt:formatDate value="${tradeDetail.TRADE_DATE }" pattern="YYYY-MM-dd HH:ss" />
		</span>
		<span style="float: right;">
			 | 조회 ${tradeDetail.TRADE_HIT } | 댓글 <span id="tradeComCount">${tradeDetail.TRADE_COM_COUNT }</span>
		</span>
		<hr style="margin-top: 40px;">
		
		<div id="detailMain" style="height: auto; padding-top: 20px; padding-bottom: 20px;">
			<c:if test="${tradeDetail.FILE_STORED ne null }">
				<img alt="#" src="/upload/${tradeDetail.FILE_STORED }">
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
						<th style="width: 12%;">작성자</th>
						<th style="width: 62%;">댓글</th>
						<th style="width: 12%;">작성일</th>
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
									<td style="width: 4%; text-align: center;">
										<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">
									</td>
									<td style="text-align: left;">
										<img alt="#" src="${tradeComment.GRADE_URL }" width="20px;" height="20px;"> ${tradeComment.USER_NICK }
									</td>
									<td id="td${tradeComment.TRADE_COM_NO }" style="width: 66%;">${tradeComment.TRADE_COM_CONTENT }</td>
									<td id="dateTd${tradeComment.TRADE_COM_NO }" style="width: 10%;">
										<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
									</td>
									<td style="width: 10%;">
										<button class="btn btn-default btn-xs"
												onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
												삭제
										</button>
									</td>
								</c:when>
							
			                	<c:when test="${tradeComment.TRADE_COM_SECRET eq 'n' }">
								<!-- 비밀글이 아닐 경우 -->
									<td style="width: 4%;"></td>
									<td style="text-align: left;">
										<img alt="#" src="${tradeComment.GRADE_URL }" width="20px;" height="20px;"> ${tradeComment.USER_NICK }
									</td>
									<td id="td${tradeComment.TRADE_COM_NO }" style="width: 66%;">${tradeComment.TRADE_COM_CONTENT }</td>
									<td id="dateTd${tradeComment.TRADE_COM_NO }" style="width: 10%;">
										<fmt:formatDate value="${tradeComment.TRADE_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
									</td>
									<td style="width: 10%;">
										<button class="btn btn-default btn-xs"
												onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
												삭제
										</button>
									</td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<hr style="border: 1px solid #ddd; margin-top: 0;">
			
		</div><!-- 댓글 리스트 end -->
		
		<div class="text-center">
			<a href="/admin/trade/list"><button class="btn btn-default">목록</button></a>
			<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
		</div>
		
	</div><!-- .container end -->
</div><!-- .wrap end -->
<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
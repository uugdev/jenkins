<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/reportPopup.css">
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="/resources/js/segbar.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	var userno = "<c:out value='${userNo}' />";
	var askUserno = "<c:out value='${ask.userNo}' />";
	var result = "<c:out value='${result}' />";
	var loginUserVoteState = "<c:out value='${status.voteState}' />";
	
	$("#like").click(function() {
							
		$.ajax({
			type: "get"
			, url: "/ask/votelike"
			, data: { "askNo": '${ask.askNo }' }
			, dataType: "json"
			, success: function( data ) {
				console.log("성공");
				$("#like")
				.attr("src", "https://i.imgur.com/aH44JbJ.png").removeClass('vote')
				.addClass('success');
									
				//투표수 적용
				$("#cntY").html(data.cntY);
									
				initChart(data.cntY, $("#cntN").html())
									
			} //success
			, error: function() {
				console.log("실패");
			} //error
		}); //ajax end
	}); //$("#like").click() end
		
	
	$("#hate").click(function() {
				
		$.ajax({
			type: "get"
			, url: "/ask/votehate"
			, data: { "askNo": '${ask.askNo }' }
			, dataType: "json"
			, success: function( data ) {
				console.log("성공");
				$("#hate")
				.attr("src", "https://i.imgur.com/C4qO9bG.png").removeClass('vote')
				.addClass('success');
						
				//투표수 적용
				$("#cntN").html(data.cntN);
							
				initChart($("#cntY").html(), data.cntN)

			} //success
			, error: function() {
				console.log("실패");
			} //error
		}) //ajax end
	}) //$("#hate").click() end
	


	
	$("#btnDelete").click(function() {

		action_popup.confirm("정말 삭제하시겠습니까?", function (result) {

		if (result == true) {
			$(location).attr("href", "/admin/ask/delete?askNo=${ask.askNo }");
		}
		
		})
		
		/* 닫는 창으로 꼭 필요함 */
	    $(".modal_close").on("click", function () {
	        action_popup.close(this);
	    });

	});

	
	
	initChart(${cntY}, ${cntN})

});

function initChart(cntY, cntN) {
	$('.chart').empty();
	
	$('.chart').segbar([
		{
		  data: [ 
		    {  value: Number(cntY), color:'#3A539B'  },
		    {  value: Number(cntN), color:'#F22613'  }
		  ]
		}
	]);
} 

function deleteComment(askComNo) {
	$.ajax({
		type: "post"
		, url: "/admin/ask/comment/delete"
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

.success {
	width: 50px;
	height: 50px;
}

#item {
	width: 300px;
	height: 300px;
	margin: 0 auto;
	margin-top: 100px;
	margin-bottom: 100px;
}

#votedate {
	text-align: center;
}

.check {
	display: flex;
	justify-content: space-between;
	text-align: center;
	width: 500px;
	margin: 0 auto;
	width: 500px;
	text-align: center;
}

#itemImg {
	width: 100%;
	height: 100%;
}

.vote {
	width: 45px;
	height: 45px;
}

.cnt {
	font-size: 20px;
	margin: 0 10px;
}

#chartBox {
	width: 300px;
}

.item-wrapper {
	height: 30px !important;
}

.item-percentage {
	line-height: 30px;
}
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
	<div class="container">

		<%-- --%>

		<h1 style="text-align: center; margin-top: 50px;">${ask.askTitle }</h1>
		<!-- <button id="btnRecommend" class="btn pull-right">추천</button> -->
		<!-- <div class="clearfix"></div> -->
		<hr>
		<c:if test="${userNo eq ask.userNo }">
			<span>작성자 : ${user.userNick }</span>
		</c:if>
		<c:if test="${userNo ne ask.userNo }">
			<a
				href="<%=request.getContextPath() %>/message/write?userNick=${user.userNick }"
				onclick="return confirm('쪽지를 보내시겠습니까?');"><span>작성자 :
					${user.userNick }</span></a>
		</c:if>
		| <span><fmt:formatDate value="${ask.askDate }"
				pattern="yy-MM-dd HH:mm" /></span> <span class="pull-right">조회수 :
			${ask.askHit }</span>

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
					<td><fmt:formatNumber type="number" maxFractionDigits="3"
							value="${item.itemPrice }" />원</td>
				</tr>
			</tbody>
		</table>

		<div id="item">
			<img id="itemImg" src="/upload/${file.fileStored}" alt="상품사진" />
		</div>


		<div style="text-align: center;">${ask.askContent }</div>

		<hr>



		<div id="votedate">
			<fmt:formatDate value="${vote.voteStart}" pattern="yy-MM-dd HH:mm" />
			~
			<fmt:formatDate value="${vote.voteEnd}" pattern="yy-MM-dd HH:mm" />
		</div>

		<div class="check">
			<div>
				<div class="pull-left cnt" id="cntY">${cntY }</div>
				<c:if test="${cntY > cntN}">
					<img class="pull-left success"
						src="https://i.imgur.com/aH44JbJ.png" alt="찬성투표후" />
				</c:if>
				<c:if test="${cntY <= cntN}">
					<img class="vote pull-left" src="https://i.imgur.com/iLdts0b.png"
						alt="찬성" />
				</c:if>
			</div>
			<div id="chartBox">
				<div class="chart"></div>
			</div>

			<div>
				<div class="pull-right cnt" id="cntN">${cntN }</div>
				<c:if test="${cntY < cntN}">
					<img class="pull-right success"
						src="https://i.imgur.com/C4qO9bG.png" alt="반대투표후" />
				</c:if>
				<c:if test="${cntY >= cntN}">
					<img class="vote pull-right" src="https://i.imgur.com/0sDsZn8.png"
						alt="반대" />
				</c:if>
			</div>
		</div>

		<br> <br>
		<hr>

		<!-- 댓글 리스트 -->
		<table class="table table-striped table-hover table-condensed">
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
				<c:forEach items="${askComment}" var="askComment">
					<tr data-updateAskComNo="${askComment.ASK_COM_NO }"></tr>
					<tr data-askComNo="${askComment.ASK_COM_NO }">
						<td></td>
						<c:if test="${askComment.USER_NICK ne null }">
							<td style="text-align: left;"><img alt="#"
								src="${askComment.GRADE_URL }" width="20px;" height="20px;">
								${askComment.USER_NICK }</td>
						</c:if>
						<c:if test="${askComment.USER_NICK eq null}">
							<td class="pull-left">탈퇴한 회원입니다</td>
						</c:if>
						<td id="td${askComment.ASK_COM_NO }" style="text-align: left">${askComment.ASK_COM_CONTENT }</td>
						<td id="dateTd${askComment.ASK_COM_NO }" style="width: 10%;">
							<fmt:formatDate value="${askComment.ASK_COM_DATE }"
								pattern="yy-MM-dd hh:mm:ss" />
						</td>
						<td>
							<button class="btn btn-default btn-xs"
								onclick="deleteComment(${askComment.ASK_COM_NO });">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 댓글 리스트 end -->


		<!-- 댓글 처리 -->




		<!-- 댓글 처리 end -->

		<div class="text-center" style="margin-bottom: 100px;">
			<a href="/admin/ask/list"><button class="btn btn-default">목록</button></a>
			<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
		</div>


		<%-- --%>
		<!-- .container end -->
	</div>
	<!-- footer start -->
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
	<!-- .wrap end -->
</div>



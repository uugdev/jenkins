<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/reportPopup.css">
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/resources/js/segbar.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	if( ${isScrap } ) {
		$("#scrap")
			.html('스크랩 취소');
	} else {
		$("#scrap")
			.html('스크랩');
	}
	
	$("#scrap").click(function() {
		
		$.ajax({
			type: "get"
			, url: "/ask/scrap"
			, data: { "askNo": '${ask.askNo }' }
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
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#btnRecommend").click() end
	
	
$("#setReport").click(function() {
		
		var content = $("#reportContent").val() ;
		var category = $("#reportCategory").val();
		if( content == ""  ) {
			
			alert("신고사유를 입력해주세요")
			return;
			
		} else {
			
			$.ajax({
				type: "post"
				, url: "/ask/report"
				, data: { reportCategory: category ,reportContent: content, "askNo": '${ask.askNo }'}
				, dataType: "json"
				, success: function( data ) {
						console.log("성공");
						$('.popupWrap1').addClass('hide1');
						$('#reportContent').val('');
						
						if( data.reportCheck ) {
							
							alert("신고가 완료되었습니다.");
							
						} else {
							
							alert("이미 신고한 게시글입니다.");
							
							
						}
						
				}
				, error: function() {
					console.log("실패");
				}
			}); //ajax end
			
			
		}
		
	});
	
	
	
	
	var userno = "<c:out value='${userNo}' />";
	var askUserno = "<c:out value='${ask.userNo}' />";
	var result = "<c:out value='${result}' />";
	var loginUserVoteState = "<c:out value='${status.voteState}' />";
	
	if(userno != askUserno) {
		if(result) {
			if(loginUserVoteState == null || loginUserVoteState == "")  {
			$("#like").click(function() {
				
				var check = confirm("투표하시면 수정이 불가능합니다. 투표하시겠습니까?");
				
				if(check) {
				
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
				} //check like중복투표확인 if문 end
	 		}); //$("#like").click() end
			}//loginUserVoteState //로그인유저 투표상태체크 if문 end
		}//result 투표확인 if문 end
	};//userNo != askUserno 본인게시글	if문 end
	
	
	
	
	if(userno != askUserno) {
		if(result) {
			if(loginUserVoteState == null || loginUserVoteState == "")  {
			$("#hate").click(function() {
				
				var check = confirm("투표하시면 수정이 불가능합니다. 투표하시겠습니까?");
				
				if(check) {
				
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
					}); //ajax end
				} //check like중복투표확인 if문 end
	 		}); //$("#hate").click() end
			}//loginUserVoteState //로그인유저 투표상태체크 if문 end
		}//result 투표확인 if문 end
	};//userNo != askUserno 본인게시글	if문 end

	
	$("#btnDelete").click(function() {

		var result = confirm("정말 삭제하시겠습니까?");

		if (result == true) {
			$(location).attr("href", "/ask/delete?askNo=${ask.askNo }");
		}

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
</script>
<script type="text/javascript">
function insertComment() {
	var textarea = $("#askComContent").val();
	
	$.ajax({
		type: "post"
		, url: "/ask/comment/write"
		, dataType: "json"
		, data: {
			askNo: ${ask.askNo }
			, askComContent: textarea
		}
		, success: function(data){
			if(data.success) {
				
			var userNo = '<%=session.getAttribute("userNo")%>';
			var askComDate = moment(data.addComment.askComDate).format("YY-MM-DD HH:mm:ss");
				
			$('#appendArea').before('<tr data-updateAskComNo="'+ data.addComment.askComNo +'"></tr>' +
					'<tr data-askComNo="'+ data.addComment.askComNo +'">' +
					'<td style="width: 4%; text-align: center; padding: 5px;"></td>' +
					'<td style="width: 10%; padding: 5px;">'+ data.userNick +'</td>' +
					'<td id="td'+ data.addComment.askComNo +'" style="width: 66%; padding: 5px;">'+ data.addComment.askComContent +'</td>' +
					'<td style="width: 10%; padding: 5px;">'+ askComDate +'</td>' +
					'<td style="width: 10%; padding: 5px;">' +
					'<button class="btn btn-default btn-xs" onclick="deleteComment('+ data.addComment.askComNo +');">삭제</button> ' +
					'<button class="btn btn-default btn-xs" onclick="updateComment('+ data.addComment.askComNo +');">수정</button>' +
					'</td>' +
					'</tr>');
				
				$('#askComContent').val('');
						
			} else {
				alert("댓글 작성 실패");
			}
		}
		 ,error: function() {
			console.log("error");
		}
	});
	
}

function updateComment(askComNo) {
	
    var askText = $("#td"+askComNo).text();
    
	$("[data-askComNo='"+askComNo+"']").css("display", "none");
	$("[data-updateAskComNo='"+askComNo+"']").append('<td style="width: 4%;"></td>' +
			'<td style="width: 10%;"></td>' +
			'<td style="width: 66%;">' +
			'<div class="form-inline text-center">' +
			'<div class="form-inline text-center">' +
			'<input type="text" size="10" class="form-control" id="userNick" value="${userNick }" readonly="readonly"/>' +
			'<textarea rows="2" cols="60" class="form-control" id="askComUpdateContent'+ askComNo +'">'+ askText +'</textarea>' +
			'<button id="btnCommUpdate" class="btn" onclick="updateCom('+ askComNo +');">수정</button>　' +
			'<button id="btnCommUpdateCancel" class="btn" onclick="cancelCom('+ askComNo +');">취소</button>' +
			'</div>' +
			'</td>' +
			'<td style="width: 10%;"></td>' +
			'<td style="width: 10%;"></td>');
}

function updateCom(askComNo) {
	
	var textarea = $("#askComUpdateContent"+ askComNo).val();
	
	$.ajax({
		type: "post"
		, url: "/ask/comment/update"
		, dataType: "json"
		, data: {
			askComNo: askComNo
			, askComContent: textarea
		}
		, success: function(data){
			if(data.success) {
				$("[data-askComNo='"+askComNo+"']").css("display", "table-row");
				$("#td"+askComNo).html(data.askComment.askComContent);
				$("[data-updateAskComNo='"+askComNo+"']").html('');
			} else {
				alert("댓글 수정 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}

function cancelCom(askComNo) {
	$("[data-askComNo='"+askComNo+"']").css("display", "table-row");
	$("[data-updateAskComNo='"+askComNo+"']").html('');
}


function deleteComment(askComNo) {
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
	justify-content: space-between; text-align : center; width : 500px;
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

		<h1 style="text-align: center;">${ask.askTitle }</h1>
		<!-- <button id="btnRecommend" class="btn pull-right">추천</button> -->
		<!-- <div class="clearfix"></div> -->
		<hr>
		<c:if test="${userNo eq ask.userNo }" >
		<span>작성자 : ${user.userNick }</span>
		</c:if>
		<c:if test="${userNo ne ask.userNo }">
		<a href="<%=request.getContextPath() %>/message/write?userNick=${user.userNick }"
			onclick="return confirm('쪽지를 보내시겠습니까?');"><span>작성자 :
				${user.userNick }</span></a></c:if> | <span><fmt:formatDate
				value="${ask.askDate }" pattern="yy-MM-dd HH:mm" /></span>
				<c:if test="${ask.userNo ne userNo }">
					<c:if test="${ask.userNo ne 0 }">
						<button id="scrap">스크랩</button>
						<button id="report" class="popupOpen1">신고</button>
					</c:if>
				</c:if>
				<span class="pull-right">조회수 : ${ask.askHit }</span>

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


		<div style="text-align: center;">${ask.askContent }</div>

		<hr>



		<div id="votedate">
			<fmt:formatDate value="${vote.voteStart}" pattern="yy-MM-dd HH:mm" />
			~
			<fmt:formatDate value="${vote.voteEnd}" pattern="yy-MM-dd HH:mm" />
		</div>


		<c:if test="${check eq 'y'}">
			<div class="check">
				<div>
					<div class="pull-left cnt" id="cntY">${cntY }</div>
					<c:if test="${status.voteState eq 'y'}">
						<img class="pull-left success"
							src="https://i.imgur.com/aH44JbJ.png" alt="찬성투표후" />
					</c:if>
					<c:if test="${status.voteState ne 'y'}">
						<img class="vote pull-left" id="like"
							src="https://i.imgur.com/iLdts0b.png" alt="찬성" />
					</c:if>
				</div>
				<div id="chartBox">
					<div class="chart"></div>
				</div>

				<div>
					<div class="pull-right cnt" id="cntN">${cntN }</div>
					<c:if test="${status.voteState eq 'n'}">
						<img class="pull-right success"
							src="https://i.imgur.com/C4qO9bG.png" alt="반대투표후" />
					</c:if>
					<c:if test="${status.voteState ne 'n'}">
						<img class="vote pull-right" id="hate"
							src="https://i.imgur.com/0sDsZn8.png" alt="반대" />
					</c:if>
				</div>
			</div>
		</c:if>
		
		
		<c:if test="${check eq 'n'}">
			<div class="check">
				<div>
					<div class="pull-left cnt" id="cntY">${cntY }</div>
					<c:if test="${cntY > cntN}">
						<img class="pull-left success"
							src="https://i.imgur.com/aH44JbJ.png" alt="찬성투표후" />
					</c:if>
					<c:if test="${cntY <= cntN}">
						<img class="vote pull-left"
							src="https://i.imgur.com/iLdts0b.png" alt="찬성" />
					</c:if>
				</div>
				<div id="chartBox"> 투표가 종료되었습니다
					<div class="chart"></div>
				</div>

				<div>
					<div class="pull-right cnt" id="cntN">${cntN }</div>
					<c:if test="${cntY < cntN}">
						<img class="pull-right success"
							src="https://i.imgur.com/C4qO9bG.png" alt="반대투표후" />
					</c:if>
					<c:if test="${cntY >= cntN}">
						<img class="vote pull-right"
							src="https://i.imgur.com/0sDsZn8.png" alt="반대" />
					</c:if>
				</div>
			</div>
		</c:if>

		<br> <br>
		<hr>
		<!-- 댓글 리스트 -->
		<table class="table table-striped table-hover table-condensed">
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
				<c:forEach items="${askComment}" var="askComment">
					<tr data-updateAskComNo="${askComment.askComNo }"></tr>
					<tr data-askComNo="${askComment.askComNo }">
					<td style="width: 4%;"></td>
					<c:forEach items="${userList }" var="userList">
						<c:if test="${askComment.userNo eq userList.userNo}">
							<td style="width: 10%;">${userList.userNick }</td>
						</c:if>
					</c:forEach>
					
					<td id="td${askComment.askComNo }" style="width: 66%;">${askComment.askComContent }</td>
					<td style="width: 10%;">
						<fmt:formatDate value="${askComment.askComDate }" pattern="yy-MM-dd hh:mm:ss" /></td>
					<td style="width: 10%;">
						<c:if test="${userNo eq askComment.userNo }">
							<button class="btn btn-default btn-xs"
							onclick="deleteComment(${askComment.askComNo });">삭제</button>
							<button class="btn btn-default btn-xs"
							onclick="updateComment(${askComment.askComNo });">수정</button>
						</c:if>
					</td>
					</tr>
				</c:forEach>
				<tr id="appendArea"></tr>
			</tbody>
		</table>
		<!-- 댓글 리스트 end -->

	
	<!-- 댓글 처리 -->

	<!-- 로그인상태 -->
	<c:if test="${login }">
		<!-- 댓글 입력 -->
		<div class="form-inline text-center">
			<input type="text" size="10" class="form-control" id="userNick"
				value="${userNick }" readonly="readonly" />
			<textarea rows="2" cols="60" class="form-control" id="askComContent"></textarea>
			<button id="btnCommInsert" class="btn" onclick="insertComment();">입력</button>
		</div>
		<!-- 댓글 입력 end -->
	</c:if>

	
	<!-- 댓글 처리 end -->

	<div class="text-center" style="margin-bottom: 100px;">
		<a href="/ask/list"><button class="btn btn-default">목록</button></a>
		<c:if test="${userNo eq ask.userNo }">
			<a href="/ask/update?askNo=${ask.askNo }"><button
					class="btn btn-primary">수정</button></a>
			<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
		</c:if>
	</div>


	<%-- --%>

	</div>
<!-- .container end -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>
<!-- .wrap end -->

			<div class="popupWrap1 hide1">
					<div class="popup1">
						<div class="title">
							<p>신고 하기</p>
							<span class="close1">❌</span>
						</div>
						<select id="reportCategory" name="reportCategory" class="select">
							<option value="A">부적절한 홍보 게시글</option>
							<option value="B">음란성 또는 청소년에게 부적합한 내용</option>
							<option value="C">명예훼손/사생활 침해 및 저작권침해등</option>
							<option value="D">기타</option>
						</select>	
						<textarea name="reportContent" id="reportContent" cols="30" rows="10"></textarea>
						<div class="btnWrap1">
							<button id="setReport">보내기</button>
						</div>
					</div>
			</div>
	
<script>
	$('.popupOpen1').on('click', function() {
		$('.popupWrap1').removeClass('hide1');
	});
	$('.close1').on('click', function() {
		$(this).parents('.popupWrap1').addClass('hide1');
		$(this).parents('.popup1').children('textarea').val('');
	});

// 	$(".btnWrap1").click(function() {
// 		$(this).parents("form").submit();
// 	});
</script>
<!-- footer start -->



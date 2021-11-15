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
	
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/ask/comment/write",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"askNo",
				value:"${ask.askNo }"
			})
		).append(
			$("<textarea>")
				.attr("name", "askComContent")
				.css("display", "none")
				.text($("#askComContent").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnCommInsert").click() end

	
	$("#btnDelete").click(function() {

		var result = confirm("정말 삭제하시겠습니까?");

		if (result == true) {
			$(location).attr("href", "/ask/delete?askNo=${ask.askNo }");
		}

	});

// 	$("#scrap").click(function() {

// 		var result = confirm("확인버튼을 누르시면 스크랩이 완료됩니다.");

// 		if (result == true) {
// 			$(location).attr("href", "/ask/scrap?askNo=${ask.askNo }");
			
// 		}

// 	});

	
	
	
	$('.chart').segbar([

		{

		  data: [ 

		    {  value: ${cntY}, color:'#3A539B'  },

		    {  value: ${cntN}, color: '#F22613' }

		  ]

		}
				

		]);

		$('.chart').segbar({
		width:"100%",
		height:"80px"
		});



	
	
});

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

// function updateComment(askComNo) {
// 	$.ajax({
// 		type: "post"
// 		, url: "/ask/comment/update"
// 		, dataType: "json"
// 		, data: {
// 			askComNo: askComNo

// 		}
// 		, success: function(data){
// 			if(true) {
// 			console.log("성공");
				
// 				$("#askComContent")
// 				.test("value", "data.askComContent");
				
// 			}
// 		}
// 		, error: function() {
// 			console.log("error");
// 		}
// 	});
// }

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
					<button id="scrap">스크랩</button>
					<button id="report" class="popupOpen1">신고</button>
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
					<!-- 		<th style="width: 10%;">번호</th> -->
					<th style="width: 10%;">작성자</th>
					<th style="width: 65%;">댓글</th>
					<th style="width: 20%;">작성일</th>
					<th style="width: 5%;"></th>
<!-- 					<th style="width: 5%;"></th> -->
				</tr>
			</thead>
			<tbody id="commentBody">
				<c:forEach items="${askComment}" var="askComment">
					<tr data-askComNo="${askComment.askComNo }">
						<%-- 		<td style="width: 5%;">${comment.rnum }</td> --%>
						<c:forEach items="${userList }" var="userList">
							<c:if test="${askComment.userNo eq userList.userNo}">
								<td style="width: 10%;">${userList.userNick }</td>
							</c:if>
						</c:forEach>
						<td style="width: 65%;" id="askComCon">${askComment.askComContent }</td>
						<td style="width: 20%;"><fmt:formatDate
								value="${askComment.askComDate }" pattern="yy-MM-dd hh:mm:ss" /></td>
						<c:if test="${userNo eq askComment.userNo }">
<!-- 							<td style="width: 5%;"><button -->
<!-- 									class="btn btn-default btn-xs" -->
<%-- 									onclick="updateComment(${askComment.askComNo });">수정</button></td> --%>
							<td style="width: 5%;"><button
									class="btn btn-default btn-xs"
									onclick="deleteComment(${askComment.askComNo });">삭제</button></td>
						</c:if>
					</tr>
				</c:forEach>
		</table>
		<!-- 댓글 리스트 end -->

	</div>
	
	<!-- 댓글 처리 -->

		<!-- 비로그인상태 -->
		<c:if test="${not login }">
			<strong>로그인이 필요합니다</strong>
			<br>
			<button onclick='location.href="/member/login";'>로그인</button>
			<button onclick='location.href="/member/join";'>회원가입</button>
		</c:if>

		<!-- 로그인상태 -->
		<c:if test="${login }">
			<!-- 댓글 입력 -->
			<div class="form-inline text-center" id="textarea">
				<input type="text" size="10" class="form-control" id="userNick"
					value="${userNick }" readonly="readonly" />
				<textarea rows="2" cols="60" class="form-control" id="askComContent"></textarea>
				<button id="btnCommInsert" class="btn">입력</button>
			</div>
			<!-- 댓글 입력 end -->
		</c:if>
	
	
	
	<!-- 댓글 처리 end -->

	<div class="text-center">
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
</div>
<!-- .wrap end -->





		
			<div class="popupWrap1 hide1">
				<form action="/ask/report" method="post">
					<input type="hidden" name="askNo"
						value="${ask.askNo }" />
					<div class="popup1">
						<div class="title">
							<p>신고 하기</p>
							<span class="close1">❌</span>
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
// 		history.go(-1);
	});
</script>
<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


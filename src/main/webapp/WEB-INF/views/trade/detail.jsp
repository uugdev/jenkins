<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<link rel="stylesheet" type="text/css" href="/resources/css/reportPopup.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/tradeDetail.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript">

function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

$(document).ready(function() {
	
	var patId = getParameterByName('commentFocus');
	
	if(patId == 'true') {
		document.getElementById('commentBody').scrollIntoView();
	}

	$('.layerpopup').click(function(e) {
		$('#layer').show();
		
	});
	
	$('#layerClose').click(function() {
		$('#layer').css('display', 'none');
	});
	
	$('.popupOpen1').on('click', function() {
		$('.popupWrap1').removeClass('hide1');
	});
	
	$('.close1').on('click', function() {
		$(this).parents('.popupWrap1').addClass('hide1');
		$(this).parents('.popup1').children('textarea').val('');
	});
	
	if(${isScrap}) {
		$("#scrap").html('스크랩 취소');
	} else {
		$("#scrap").html('스크랩');
	}
	
	$("#scrap").click(function() {
		
		$.ajax({
			type: "get"
			, url: "/trade/scrap"
			, data: { "tradeNo": '${tradeDetail.TRADE_NO }' }
			, dataType: "json"
			, success: function( data ) {
	
				if( data.resultScrap ) { //스크랩 성공
					$("#scrap").html('스크랩 취소');
				
				} else { //스크랩 취소 성공
					$("#scrap").html('스크랩');
				}
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#scrap").click() end
	
	$("#setReport").click(function() {
		
		var content = $("#reportContent").val() ;
		var category = $("#reportCategory").val();
		if( content == ""  ) {
			
			action_popup.alert("경고");
			
			/* 닫는 창으로 꼭 필요함 */
		    $(".modal_close").on("click", function () {
		        action_popup.close(this);
		    });
			return;
			
		} else {
			
			$.ajax({
				type: "post"
				, url: "/trade/report"
				, data: { reportCategory: category, reportContent: content, "tradeNo": "${tradeDetail.TRADE_NO }"}
				, dataType: "json"
				, success: function( data ) {
						console.log("성공");
						$('.popupWrap1').addClass('hide1');
						$('#reportContent').val('');
						
						if( data.reportCheck ) {
							action_popup.alert("신고가 완료되었습니다.");
						} else {
							action_popup.alert("이미 신고한 게시글입니다.");
						}
						
						/* 닫는 창으로 꼭 필요함 */
					    $(".modal_close").on("click", function () {
					        action_popup.close(this);
					    });
						
				}
				, error: function() {
					console.log("실패");
				}
			}); //ajax end
			
		}
		
	});
	
});

var tradeComCount = ${tradeDetail.TRADE_COM_COUNT }

function insertComment() {
	
	var textarea = $("#tradeComContent").val();
	var content = textarea.replace(/(\n|\r\n)/g, '<br>');
	
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
			, tradeComContent: content
			, tradeComSecret: tradeComSecret
		}
		, success: function(data){
			if(data.success) {
				
				$("#tradeComCount").html(++tradeComCount, tradeComCount);
				
				var userNo = '<%= session.getAttribute("userNo")%>';
				var tradeComDate = moment(data.addComment.tradeComDate).format("YY-MM-DD HH:mm:ss");
				
				if(data.addComment.tradeComSecret == 'y') {
					$('#appendArea').before('<tr data-updateTradeComNo="'+ data.addComment.tradeComNo +'"></tr>' +
							'<tr data-tradeComNo="'+ data.addComment.tradeComNo +'" style="text-align: left;">' +
							'<td style="text-align: center; padding: 5px;">' +
							'<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">' +
							'</td>' +
							'<td style="padding: 5px; text-align: left;">' +
							'<img alt="#" src="'+ data.gradeUrl +'" width="20px;" height="20px;"> ' +
							data.userNick +'</td>' +
							'<td id="td'+ data.addComment.tradeComNo +'" style=" padding: 5px;">'+ data.addComment.tradeComContent +'</td>' +
							'<td id="dateTd'+ data.addComment.tradeComNo +'" style="padding: 5px;">'+ tradeComDate +'</td>' +
							'<td style="padding: 5px;">' +
							'<button class="btn_d" onclick="deleteComment('+ data.addComment.tradeComNo +');">삭제</button> ' +
							'<button class="btn_u" onclick="updateComment('+ data.addComment.tradeComNo +');">수정</button>' +
							'</td>' +
							'</tr>');
				}
				
				if(data.addComment.tradeComSecret == 'n') {
					$('#appendArea').before('<tr data-updateTradeComNo="'+ data.addComment.tradeComNo +'"></tr>' +
							'<tr data-tradeComNo="'+ data.addComment.tradeComNo +'" style="text-align: left;">' +
							'<td style="text-align: center; padding: 5px;"></td>' +
							'<td style="padding: 5px; text-align: left;">' +
							'<img alt="#" src="'+ data.gradeUrl +'" width="20px;" height="20px;"> ' +
							data.userNick +'</td>' +
							'<td id="td'+ data.addComment.tradeComNo +'" style="padding: 5px;">'+ data.addComment.tradeComContent +'</td>' +
							'<td id="dateTd'+ data.addComment.tradeComNo +'" style="padding: 5px;">'+ tradeComDate +'</td>' +
							'<td style="padding: 5px;">' +
							'<button class="btn_d" onclick="deleteComment('+ data.addComment.tradeComNo +');">삭제</button> ' +
							'<button class="btn_u" onclick="updateComment('+ data.addComment.tradeComNo +');">수정</button>' +
							'</td>' +
							'</tr>');
				}
				
				$('#tradeComContent').val('');
				
				
				var textEle = $('#tradeComContent');
				textEle[0].style.height = '45px';
				var textEleHeight = textEle.prop('scrollHeight');
				textEle.css('height', textEleHeight);
						
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
	
    var tdText = $("#td"+tradeComNo).html();
    var content = tdText.replace(/<br>/ig, '\n');
    
	$("[data-tradeComNo='"+tradeComNo+"']").css("display", "none");
	$("[data-updateTradeComNo='"+tradeComNo+"']").append('<td colspan="5">' +
			'<div class="CommentWriter" style="width: 1010px;">' +
			'<div class="comment_inbox">' +
			'<span class="comment_inbox_name pull-left" id="userNick">' +
			'<img alt="#" src="${gradeUrl }" style="width: 20px; height: 20px;">${userNick }</span>' +
			'<textarea onkeyup="adjustHeight(this);" placeholder="댓글을 남겨보세요" rows="1"' +
			'class="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word; height: 45px;"' +
			'id="tradeComUpdateContent'+ tradeComNo +'">'+ content +'</textarea>' +
			'<div class="register_box">' +
			'<button id="btnCommUpdateCancel" class="btn" onclick="cancelCom('+ tradeComNo +');">취소</button> ' +
			'<button id="btnCommUpdate" class="btn" onclick="updateCom('+ tradeComNo +');">수정</button>' +
			'</div>' +
			'</div>' +
			'</div>' +
			'</td>');
	
	var textEle = $('#tradeComUpdateContent' + tradeComNo);
	textEle[0].style.height = '45px';
	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight);
	
}

function updateCom(tradeComNo) {
	
	var textarea = $("#tradeComUpdateContent"+ tradeComNo).val();
	var content = textarea.replace(/(\n|\r\n)/g, '<br>');
	
	var tradeComSecret = null;
	
	$.ajax({
		type: "post"
		, url: "/trade/comment/update"
		, dataType: "json"
		, data: {
			tradeComNo: tradeComNo
			, tradeComContent: content
		}
		, success: function(data){
			if(data.success) {
				
				console.log(data.tradeComment.tradeComDate)
				
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
	
	action_popup.confirm("댓글을 삭제하시겠습니까?", function (res) {
        if (res) {
        	
        	/* ----------------------------------------- */
        	
			$.ajax({
				type: "post"
				, url: "/trade/comment/delete"
				, dataType: "json"
				, data: {
					tradeComNo: tradeComNo
				}
				, success: function(data){
					if(data.success) {
						
						$("#tradeComCount").html(--tradeComCount, tradeComCount);
						$("[data-tradeComNo='"+tradeComNo+"']").remove();
						
					} else {
						alert("댓글 삭제 실패");
					}
				}
				, error: function() {
					console.log("error");
				}
			});
        	
        	/* ----------------------------------------- */
           
        }
    })
    
	/* 닫는 창으로 꼭 필요함 */
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
	
}

function message() {
	
    action_popup.confirm("쪽지를 보내시겠습니까?", function (res) {
        if (res) {
        	
        	/* ----------------------------------------- */
        	
        	window.open('/message/write?userNick=${tradeDetail.USER_NICK}', '쪽지 보내기', 'height=500, width=620, left=400, top=500, resizable=no');
        	
        	/* ----------------------------------------- */
           
        }
    })
    
	/* 닫는 창으로 꼭 필요함 */
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
	
}

function userinfo() {

	window.open('/member/detail?userNick=${tradeDetail.USER_NICK }', '회원정보 조회', 'width=620, height=640, left=400, top=500, resizable=no');
		
}

function tradeDelete() {
	
    action_popup.confirm("게시글을 삭제하시겠습니까?", function (res) {
        if (res) {
        	
        	/* ----------------------------------------- */
        	
        	location.href='/trade/delete?tradeNo=${tradeDetail.TRADE_NO}';
        	
        	/* ----------------------------------------- */
           
        }
    })
    
	/* 닫는 창으로 꼭 필요함 */
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
	
}

function adjustHeight(obj) {
    obj.style.height = '45px';
    obj.style.height = (obj.scrollHeight) + 'px';
};

</script>

<!-- 개별 영역 끝 -->

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
				<a class="layerpopup">${tradeDetail.USER_NICK }</a>
					<div id="layer">
						<ul>
							<li><a onclick="userinfo();">회원정보 보기</a></li>
							<li><a onclick="message();">쪽지 보내기</a></li>
							<li><a id="layerClose">닫기</a></li>
						</ul>
					</div>
			</c:if>
			<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<span><fmt:formatDate value="${tradeDetail.TRADE_DATE }" pattern="yy-MM-dd HH:mm"/></span>
			<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>				
			<span>조회 <span id="cntCom">${tradeDetail.TRADE_HIT }</span></span>
			<span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			댓글<span id="tradeComCount"> ${tradeDetail.TRADE_COM_COUNT}</span>
		</div>
		<div class="btnWrap" style="text-align: right;">
			<c:if test="${sessionScope.userNo ne tradeDetail.USER_NO and !empty sessionScope.userNo }">
				<button id="scrap">스크랩</button>
				<c:if test="${tradeDetail.USER_NO ne null }">
					<button id="report" class="popupOpen1">신고</button>
				</c:if>
			</c:if>
		</div>
		
		<hr style="margin-top: 30px; border: 1px dashed;">
		
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
								
			                		<!-- 게시글 유저와 글쓴이가 아닐 경우 -->
			                		<c:if test="${sessionScope.userNo ne tradeDetail.USER_NO and sessionScope.userNo ne tradeComment.USER_NO }">
										<td style="width: 4%; text-align: center;">
											<img alt="#" src="https://i.imgur.com/uktz9Zo.png" width="20px;" height="20px;">
										</td>
										<td style="width: 15%;"></td>
										<td style="width: 58%; text-align: center;">비밀글입니다!</td>
										<td style="width: 13%;"></td>
										<td style="width: 10%;"></td>
			                		</c:if>
									
									<!-- 게시글 유저와 비밀글쓴이일 경우 -->
			                		<c:if test="${sessionScope.userNo eq tradeDetail.USER_NO or sessionScope.userNo eq tradeComment.USER_NO }">
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
											<c:if test="${sessionScope.userNo eq tradeComment.USER_NO }">
												<button class="btn_d"
														onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
														삭제
												</button>
												<button class="btn_u"
														onclick="updateComment(${tradeComment.TRADE_COM_NO });">
														수정
												</button>
											</c:if>
										</td>
			                		</c:if>
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
										<c:if test="${sessionScope.userNo eq tradeComment.USER_NO }">
											<button class="btn_d"
													onclick="deleteComment(${tradeComment.TRADE_COM_NO });">
													삭제
											</button>
											<button class="btn_u"
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
			
			<!-- 로그인상태 -->
			<c:if test="${login }">
			<!-- 댓글 입력 -->
			<div class="CommentWriter" style="width: 1010px; margin-left: 5px;">
				<div class="comment_inbox">
					<span class="comment_inbox_name pull-left" id="userNick">
						<img alt="#" src="${gradeUrl }" style="width: 20px; height: 20px;"> ${userNick }
					</span>
						<textarea onkeyup="adjustHeight(this);" placeholder="댓글을 남겨보세요" rows="1" class="comment_inbox_text"
								  style="overflow: hidden; overflow-wrap: break-word; height: 45px;" id="tradeComContent"></textarea>
					<div class="comment_attach">
					<div class="register_box">
		                <input type="checkbox" id="tradeComSecret" name="tradeComSecret" />
		                <label for="tradeComSecret">비밀글　</label>
						<button role="button" id="btn_register" onclick="insertComment();">등록</button>
					</div>
					</div>
				</div>
			</div>
			<!-- 댓글 입력 end -->
			</c:if>
			
			<div class="text-right">
				<button class="button" style="float: left; margin-bottom: 20px;" type="button" onclick="location.href='/trade/list';" >목록</button>
				<c:if test="${sessionScope.userNo eq tradeDetail.USER_NO }">
					<button class="button" type="button" onclick="location.href='/trade/update?tradeNo=${tradeDetail.TRADE_NO}';" >수정</button>
					<button class="button" type="button" onclick='tradeDelete();'>삭제</button>
				</c:if>
			</div>
			
		</div>	<!-- 댓글 리스트 end -->
	
	</div><!-- .container end -->
</div><!-- .wrap end -->
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
<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />




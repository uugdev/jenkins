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
function message() {
	 action_popup.confirm('쪽지를 보내시겠습니까?', function (answer) {
        
		if(answer) {
		
			window.open('/message/write?userNick=${user.userNick }', '쪽지 보내기', ' width=620, height=500, left=400, top=500, resizable=no');
	
		} else {
			return false;
		}
	
	 })
	 
	 /* 닫는 창으로 꼭 필요함 */
	 $(".modal_close").on("click", function () {
      action_popup.close(this);
      });
        	
}

function userinfo() {

	window.open('/member/detail?userNick=${user.userNick }', '회원정보 조회', 'width=620, height=640, left=400, top=500, resizable=no');
			
		
}


function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
};

function adjustHeight() {
    var textEle = $('textarea');
    textEle[0].style.height = '45px';
    var textEleHeight = textEle.prop('scrollHeight');
    textEle.css('height', textEleHeight);
};




</script>

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
			
			action_popup.alert("신고사유를 입력해주세요")
			
			/* 닫는 창으로 꼭 필요함 */
			$(".modal_close").on("click", function () {
		     action_popup.close(this);
		    });
			
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
	
	var patId = getParameterByName('commentFocus');

	if(patId == 'true') {
		console.log("댓글포커스")
		document.getElementById('commentBody').scrollIntoView();
	}
	
	
	
	
	
	
	var nonLogin =  ${!empty sessionScope.userNo};
	var userno = "<c:out value='${userNo}' />";
	var askUserno = "<c:out value='${ask.userNo}' />";
	var result = "<c:out value='${result}' />";
	var loginUserVoteState = "<c:out value='${status.voteState}' />";

	
	if(userno != askUserno && nonLogin) {
		if(result) {
			if(loginUserVoteState == null || loginUserVoteState == "")  {
				$("#like").click(function() {
					
				action_popup.confirm("투표하시면 수정이 불가능합니다. 투표하시겠습니까?", function (check) {
					
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
								$("#like").off("click");
								$("#hate").off("click");
								
								//투표수 적용
								$("#cntY").html(data.cntY);
								
								initChart(data.cntY, $("#cntN").html())
								
								
							} //success
							, error: function() {
								console.log("실패");
							} //error
						}); //ajax end
					} //check like중복투표확인 if문 end
				})
			
				/* 닫는 창으로 꼭 필요함 */
			    $(".modal_close").on("click", function () {
			        action_popup.close(this);
			    });
				
	 			}); //$("#like").click() end
			}//loginUserVoteState //로그인유저 투표상태체크 if문 end
		}//result 투표확인 if문 end
	};//userNo != askUserno 본인게시글	if문 end
	
	
	if(userno != askUserno && nonLogin) {
		if(result) {
			if(loginUserVoteState == null || loginUserVoteState == "")  {
			$("#hate").click(function() {
				
			action_popup.confirm("투표하시면 수정이 불가능합니다. 투표하시겠습니까?", function (check) {
				
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
							$("#hate").off("click");
							$("#like").off("click");
						
							//투표수 적용
							$("#cntN").html(data.cntN);
							
							initChart($("#cntY").html(), data.cntN)
							
						} //success
						, error: function() {
							console.log("실패");
						} //error
					}); //ajax end
				} //check like중복투표확인 if문 end
				
				})
			
				/* 닫는 창으로 꼭 필요함 */
			    $(".modal_close").on("click", function () {
			        action_popup.close(this);
			    });
			
			
	 			}); //$("#hate").click() end
			}//loginUserVoteState 로그인유저 투표상태체크 if문 end
		}//result 투표확인 if문 end
	};//userNo != askUserno 본인게시글	if문 end

	
	$("#btnDelete").click(function() {

		action_popup.confirm("정말 삭제하시겠습니까?", function (result) {

			if (result == true) {
				$(location).attr("href", "/ask/delete?askNo=${ask.askNo }");
			}
		
		})
		
		/* 닫는 창으로 꼭 필요함 */
	    $(".modal_close").on("click", function () {
	        action_popup.close(this);
	    });

	});

	
	
	initChart(${cntY}, ${cntN});

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
var cntCom = ${cntCom};

function insertComment() {
	
	
	var textarea = $("#askComContent").val();

	if(textarea == '') {
		
		
		action_popup.alert('댓글을 입력해주세요.');
		$("#askComContent").focus();
		
		/* 닫는 창으로 꼭 필요함 */
    	$(".modal_close").on("click", function () {
	    action_popup.close(this);
		});
		
		return;
		
	}
	
	
	
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
				
				console.log(data.cntCom);
				
			$('#cntCom').html(++cntCom, cntCom);
			
			var userNo = '<%=session.getAttribute("userNo")%>';
			var askComDate = moment(data.addComment.askComDate).format("YY-MM-DD hh:mm:ss");
				
			$('#appendArea').before('<tr data-updateAskComNo="'+ data.addComment.askComNo +'"></tr>' +
					'<tr data-askComNo="'+ data.addComment.askComNo +'">'+
					'<td></td>' +
					'<td style="width: 15%; padding: 8px; text-align: left;"> ' +
					' <img alt="#" src="'+data.gradeUrl+'" width="20px;" height="20px;">'+data.userNick+'</td>' +
					'<td id="td'+ data.addComment.askComNo +'" style="text-align: left;">'+ data.addComment.askComContent +'</td>' +
					'<td id="dateTd'+ data.addComment.askComNo +'" style="width: 10%; padding: 5px;">'+ askComDate +'</td>' +
					'<td>' +
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
	$("[data-updateAskComNo='"+askComNo+"']").append('<div class="CommentWriter" style="width: 1020px;">' +
			'<div class="comment_inbox">' +
			'<span class="comment_inbox_name pull-left" id="userNick">' +
			'<img alt="#" src="${grade}" style="width: 20px; height: 20px;">${userNick}</span>' +
			'<textarea data-v-3b426d7d="" placeholder="댓글을 남겨보세요" onkeyup="adjustHeight();" rows="1"' +
			'class="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word; height: 45px;"' +
			'id="askComUpdateContent'+ askComNo +'">'+ askText +'</textarea>' +
			'<div class="register_box">' +
			'<button id="btnCommUpdate" onclick="updateCom('+ askComNo +');">수정</button>　' +
			'<button id="btnCommUpdateCancel" onclick="cancelCom('+ askComNo +');">취소</button>' +
			'</div>' +
			'</div>' +
			'</div>');
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
				var askComDate = moment(data.askComment.askComDate).format("YY-MM-DD HH:mm:ss");
				
				console.log(data.askComment.askComDate);
				
				$("[data-askComNo='"+askComNo+"']").css("display", "table-row");
				$("#td"+askComNo).html(data.askComment.askComContent);
				$("#dateTd"+askComNo).html(askComDate);
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
				
				action_popup.confirm("댓글을 삭제하시겠습니까?", function (del) {
					
					if(del) {
						$("[data-askComNo='"+askComNo+"']").remove();
					}
				
				})
				
				/* 닫는 창으로 꼭 필요함 */
			    $(".modal_close").on("click", function () {
			        action_popup.close(this);
			    });
				
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

<script>

$(document).ready(function() {

	$('.layerpopup').click(function(e) {
		$('#layer').show();
		
	});
	
	$('#layerClose').click(function() {
		$('#layer').css('display', 'none');
	});

})

</script>

<style type="text/css">
.layerbox {
	position: relative;
	display: inline-block;
}

.layerpopup {
	width: 500px;
}

.layerpopup:hover {
	width: 500px;
	cursor: pointer;
	text-decoration: underline;
	color: #667F92;
}

#layer {
	display: none;
	padding: 10px;
	background: #fff;
	position: absolute;
	top: 24px;
	left: 0;
	z-index: 1;
	width: 110px;
	height: 120px;
	box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
	padding: 0;
}

#layer>ul {
	list-style: none;
	padding-left: 0;
}

#layer>ul>li {
	line-height: 40px;
}

#layer>ul>li:hover {
	background-color: #a1b8c9;
	cursor: pointer;
}

#layer>ul>li>a {
	display: block;
	color: #667F92;
}

#layer>ul>li>a:hover {
	color: #FFF;
	cursor: pointer;
	text-decoration: none;
}

.layerClose {
	font-size: 15px;
	float: right;
}

.layerpopup:hover, #layerClose:hover {
	cursor: pointer;
}

.wrap {
	margin-bottom: 50px;
	background: #f2f2f2;
}

table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

.success {
	width: 65px;
	height: 65px;
}

#item {
	margin: 15px auto 15px;
	padding: 50px 0;
	border-top: 1px solid #000;
	display: flex;
}

#votedate {
	text-align: center;
	font-size: 20px;
	margin-top: 60px;
}

.check {
	display: flex;
	justify-content: space-between;
	text-align: center;
	width: 641px;
	margin: 0 auto;
	text-align: center;
}

#itemImg {
	object-fit: scale-down;
}

.vote {
	width: 60px;
	height: 60px;
}

.cnt {
	font-size: 20px;
	margin: 0 10px;
}

#chartBox {
	width: 418px;
	margin: 15px;
	height: 35px;
	border-radius: 20px;
	overflow: hidden;
}

.item-wrapper {
	height: 35px !important;
}

.item-percentage {
	line-height: 32px;
	color: #f2f2f2 !important;
}

.recipeWrap {
	/*  	width: 700px; */
	width: 100%;
	margin: 100px auto 0;
	padding: 30px;
	background: #fff;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
}

.logo {
	margin: 25px 0 15px;
	text-align: center;
}

.logo img {
	width: 200px;
}

.title p:nth-child(1) {
	font-size: 32px;
	font-weight: 500;
	margin: 30px 0;
}

.title .bar {
	display: inline-block;
	margin: 0 15px;
	color: #777777;
}

.title .username {
	cursor: pointer;
}

.btnWrap {
	text-align: right;
}

.btnWrap button {
	width: 83px;
	height: 35px;
	background: transparent;
	border: 1px solid #333;
	font-weight: 600;
	margin-left: 3px;
}

.lineInfo {
	margin-top: 20px;
	border-bottom: 3px solid #585858;
	border-top: 3px solid #585858;
}

.lineInfo ul {
	padding: 10px 0;
	margin: 0;
	list-style: none;
	overflow: hidden;
}

.lineInfo li {
	float: left;
	line-height: 30px;
}

.lineInfo li+li {
	position: relative;
}

.lineInfo li+li:after {
	position: absolute;
	/* 	top: 6px; */
	top: 1px;
	left: 0;
	content: '';
	clear: both;
	display: inline-block;
	width: 1px;
	/* 	height: 15px; */
	height: 28px;
	background: #333;
}

.lineInfo li:nth-child(1) {
	width: 33%;
}

.lineInfo li:nth-child(2) {
	width: 33%;
}

.lineInfo li:nth-child(3) {
	width: 33%;
}

.lineInfo li dl {
	margin: 0;
	padding: 5px 0;
}

.lineInfo li dl dt, .lineInfo li dl dd {
	float: left;
}

.lineInfo li dl dt {
	width: 80px;
}

.lineInfo li dl dd {
	text-align: left;
	width: calc(100% - 80px);
	word-break: break-all;
}

.barcode {
	position: relative;
	margin: 0 auto;
	background: #fff;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	/* 	border-bottom-left-radius: 6px; */
	/* 	border-bottom-right-radius: 6px; */
	/* 	width: 700px; */
	width: 100%;
	padding: 20px 25px;
}

.barcode:before {
	position: absolute;
	top: 0;
	left: 16px;
	content: '';
	clear: both;
	display: inline-block;
	/* 	width: 665px; */
	width: 1050px;
	border-top: 3px dashed #f2f2f2;
	content: '';
}

.barcode img {
	width: 100%;
	margin-top: 20px;
	padding-right: 10px;
}

.bottom {
	position: absolute;
	bottom: -18px;
	left: -1px;
	width: 100%;
	height: 21px;
	background-image: url("/resources/img/bottom.png");
	background-repeat: repeat;
	background-repeat-y: no-repeat;
}

.content {
	text-align: center;
	padding: 30px 0 15px 0;
	margin: 0 20px 0 20px;
}

.content+p {
	margin: 0px;
}

.priceWrap {
	display: flex;
	justify-content: space-between;
	font-weight: 700;
	font-size: 24px;
}

.priceText {
	text-align: left;
	margin-left: 20px;
}

.price {
	text-align: right;
	margin-right: 20px;
}


#hate:hover {
	cursor: pointer;
}

#like:hover {
	cursor: pointer;
}

.btnGroup {
	height: 35px;
	width: 65px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
	margin-bottom: 100px;
}

.btnGroup:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}


/* 댓글 */

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

.CommentWriter {
	margin: 12px 0 29px;
    padding: 20px;
    border: 2px solid #9f9d9d;
    border-radius: 6px;
    box-sizing: border-box;
    background: #fff;
}
.CommentWriter .comment_inbox_text {
    overflow-x: hidden;
    overflow-y: auto;
    display: block;
    width: 100%;
    min-height: 17px;
    padding-right: 1px;
    border: 0;
    font-size: 13px;
    -webkit-appearance: none;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    color: var(--skinTextColor);
    outline: 0;
}
.CommentWriter .register_box {
    text-align: right;
}

comment_inbox {
	text-align: left;
}

#btn_register ,
#btnCommUpdate, 
#btnCommUpdateCancel {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid #5b6e7a;
    border-radius: 4px;
    background-color: #5b6e7a;
    width: 65px;
    color: #fff;
}

#btnCommUpdate {
	margin-right: -10px;
}

#btnCommUpdateCancel {
	background: #ddd;
	border-color: #ddd;
}
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
	<div class="container">
			<div class="recipeWrap">
				<div class="logo">
					<img alt="#" src="https://i.imgur.com/fdRrD3i.png">
				</div>
				<div class="title">
					<p style="text-align: center;">${ask.askTitle }</p>
				</div>
				<div class="layerbox">
					<c:if test="${userNo eq ask.userNo || empty sessionScope.userNo }">
						<span class="confirmation username">닉네임 : 
						<img alt="#" src="${grade}" style="width: 20px;">${user.userNick }</span>
					</c:if>
					<c:if test="${ask.userNo eq 0 }">
						탈퇴한 회원
					</c:if>
					<c:if
						test="${ask.userNo ne 0 and userNo ne ask.userNo and !empty sessionScope.userNo }">
						<span class="confirmation username layerpopup">닉네임 :
						<img alt="#" src="${grade}" style="width: 20px;">${user.userNick }</span>
					</c:if>
					<div id="layer">
						<ul>
							<li><a onclick="userinfo();">회원정보 보기</a></li>
							<li><a onclick="message();">쪽지 보내기</a></li>
							<li><a id="layerClose">닫기</a></li>
						</ul>
					</div>
					<!-- #layer end -->
				</div>

				<span class="bar">|</span> <span> <fmt:formatDate
						value="${ask.askDate }" pattern="yy-MM-dd HH:mm" />
				</span> <span class="bar">|</span> <span>조회 <span id="cntCom">${ask.askHit }</span>
				</span> <span class="bar">|</span> <span>댓글 ${cntCom }</span>
				<div class="btnWrap">
					<c:if
						test="${ask.userNo ne userNo and !empty sessionScope.userNo and ask.userNo ne 0 }">
						<button id="scrap">스크랩</button>
						<button id="report" class="popupOpen1">신고</button>
					</c:if>
				</div>

			<div class="lineInfo">
				<ul>
					<li>
						<dl class="clearfix">
							<dt>NO</dt>
							<dd>${ask.askNo }</dd>
						</dl>
					</li>
					<li>
						<dl class="clearfix">
							<dt>BRAND</dt>
							<dd>${item.itemBrand}</dd>
						</dl>
					</li>
					<li>
						<dl class="clearfix">
							<dt>NAME</dt>
							<dd>${item.itemName }</dd>
						</dl>
					</li>
				</ul>
			</div>

			<div id="item">
				<img id="itemImg" src="/upload/${file.fileStored}" alt="상품사진"
					class="img-responsive center-block" alt="Responsive image" />
			</div>


			<%-- 			<div style="text-align: center; padding: 20px 0; border-top: 1px solid #000;">${ask.askContent }</div> --%>
			<div style="border-top: 1px solid #000;">
				<div class="content">${ask.askContent }</div>
			</div>
			<div class="priceWrap"
				style="text-align: center; padding: 20px 0; border-top: 1px solid #000;">
				<p class="priceText">PRICE</p>
				<p class="price">
					￦
					<fmt:formatNumber type="number" maxFractionDigits="3"
						value="${item.itemPrice }" />
				</p>
			</div>


		</div>


			<div class="barcode">
				<img alt="#" src="/resources/img/askBarcode2.png">

				<div class="bottom"></div>
			</div>


		
		<c:if test="${vote.voteEnd ne null}">

			<div id="votedate">
				<fmt:formatDate value="${vote.voteStart}" pattern="yy-MM-dd HH:mm" />
				~
				<fmt:formatDate value="${vote.voteEnd}" pattern="yy-MM-dd HH:mm" />
			</div>
		</c:if>
		
		<c:if test="${vote.voteEnd eq null}">
			<div style="margin-top: 60px;"></div>
		</c:if>

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
			<p style="font-size: 16px;">투표가 종료되었습니다</p>
			<div class="check">
				<div>
					<c:if test="${cntY > cntN}">
						<div class="pull-left cnt" id="cntY"><strong>${cntY }</strong></div>
					</c:if>
					
					<c:if test="${cntY <= cntN}">
						<div class="pull-left cnt" id="cntY">${cntY }</div>
					</c:if>
					
					
					<c:if test="${cntY > cntN}">
						<c:if test="${status.voteState eq 'y'}">
							<img class="pull-left success"
								src="https://i.imgur.com/aH44JbJ.png" alt="찬성이많고찬성에투표" />
						</c:if>
					</c:if>
					<c:if test="${cntY > cntN}">
						<c:if test="${status.voteState ne 'y'}">
							<img class="pull-left success"
								src="https://i.imgur.com/iLdts0b.png" alt="찬성이많고찬성에투표하지않음" />
						</c:if>
					</c:if>

					<c:if test="${cntY < cntN}">
						<c:if test="${status.voteState eq 'y'}">
							<img class="pull-left vote" src="https://i.imgur.com/aH44JbJ.png"
								alt="반대가많고찬성에투표" />
						</c:if>
					</c:if>
					<c:if test="${cntY < cntN}">
						<c:if test="${status.voteState ne 'y'}">
							<img class="pull-left vote" src="https://i.imgur.com/iLdts0b.png"
								alt="반대가많고찬성에투표하지않음" />
						</c:if>
					</c:if>

					<c:if test="${cntY == cntN}">
						<c:if test="${status.voteState eq 'y'}">
							<img class="success pull-left"
								src="https://i.imgur.com/aH44JbJ.png" alt="투표수가같고찬성에투표함" />
						</c:if>
					</c:if>
					<c:if test="${cntY == cntN}">
						<c:if test="${status.voteState ne 'y'}">
							<img class="success pull-left"
								src="https://i.imgur.com/iLdts0b.png" alt="투표수가같고찬성에투표하지않음" />
						</c:if>
					</c:if>

				</div>

				<div id="chartBox">
					<div class="chart"></div>
				</div>

				<div>
					<c:if test="${cntN > cntY}">
						<div class="pull-right cnt" id="cntN"><strong>${cntN }</strong></div>
					</c:if>

					<c:if test="${cntN <= cntY}">
						<div class="pull-right cnt" id="cntN">${cntN }</div>
					</c:if>

					<c:if test="${cntY < cntN}">
						<c:if test="${status.voteState eq 'n'}">
							<img class="success pull-right"
								src="https://i.imgur.com/C4qO9bG.png" alt="반대가많고반대에투표함" />
						</c:if>
					</c:if>
					<c:if test="${cntY < cntN}">
						<c:if test="${status.voteState ne 'n'}">
							<img class="success pull-right"
								src="https://i.imgur.com/0sDsZn8.png" alt="반대가많고반대에투표하지않음" />
						</c:if>
					</c:if>

					<c:if test="${cntY > cntN}">
						<c:if test="${status.voteState eq 'n'}">
							<img class="vote pull-right"
								src="https://i.imgur.com/C4qO9bG.png" alt="찬성이많고반대에투표함" />
						</c:if>
					</c:if>
					<c:if test="${cntY > cntN}">
						<c:if test="${status.voteState ne 'n'}">
							<img class="vote pull-right"
								src="https://i.imgur.com/0sDsZn8.png" alt="찬성이많고반대에투표하지않음" />
						</c:if>
					</c:if>

					<c:if test="${cntY == cntN}">
						<c:if test="${status.voteState eq 'n'}">
							<img class="success pull-right"
								src="https://i.imgur.com/C4qO9bG.png" alt="투표수가같고반대에투표함" />
						</c:if>
					</c:if>
					<c:if test="${cntY == cntN}">
						<c:if test="${status.voteState ne 'n'}">
							<img class="success pull-right"
								src="https://i.imgur.com/0sDsZn8.png" alt="투표수가같고반대에투표하지않음" />
						</c:if>
					</c:if>

				</div>
			</div>
		</c:if>

		<br> <br>
		<hr>
		<!-- 댓글 리스트 -->
		<table class="table">
			<thead>
				<tr>
					<th style="width: 1.3%;"></th>
					<th style="width: 15%;">닉네임</th>
					<th style="width: 58%;">댓글</th>
					<th style="width: 13%;">작성일</th>
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
								src="${askComment.GRADE_URL }" width="20px;" height="20px;">${askComment.USER_NICK }</td>
						</c:if>
						<c:if test="${askComment.USER_NICK eq null}">
							<td class="pull-left">탈퇴한 회원</td>
						</c:if>
						<td id="td${askComment.ASK_COM_NO }" style="text-align: left;">${askComment.ASK_COM_CONTENT }</td>
						<td id="dateTd${askComment.ASK_COM_NO }" style="width: 10%;">
							<fmt:formatDate value="${askComment.ASK_COM_DATE }" pattern="yy-MM-dd HH:mm:ss" />
						</td>
						<td>
							<c:if test="${userNo eq askComment.USER_NO }">
								<button class="btn btn-default btn-xs btnDel" onclick="deleteComment(${askComment.ASK_COM_NO });">삭제</button>
								<button class="btn btn-default btn-xs" onclick="updateComment(${askComment.ASK_COM_NO });">수정</button>
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
			<div class="CommentWriter">
				<div class="comment_inbox">
					<span class="comment_inbox_name pull-left" id="userNick">
						<img alt="#" src="${grade}" style="width: 20px; height: 20px;">${userNick}</span>
					<textarea data-v-3b426d7d="" placeholder="댓글을 남겨보세요" rows="1" 
					class="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word; 
					height: 45px;" id="askComContent" onkeyup="adjustHeight();"></textarea>
			
					<div class="register_box">
						<button role="button" id="btn_register" onclick="insertComment();">등록</button>
					</div>
				</div>
			</div>
		</c:if>
			<!-- 댓글 입력 end -->


		<!-- 댓글 처리 end -->

		<div class="text-center"
			style="margin-bottom: 100px; margin-top: 50px;">
			<a href="/ask/list"><button class="btn btnGroup">목록</button></a>
			<c:if test="${userNo eq ask.userNo }">
				<a href="/ask/update?askNo=${ask.askNo }"><button
						class="btn btnGroup">수정</button></a>
				<button type="button" class="btn btnGroup" id="btnDelete">삭제</button>
			</c:if>
		</div>

	</div>
	<%-- --%>

</div>
<!-- .container end -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
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
</script>

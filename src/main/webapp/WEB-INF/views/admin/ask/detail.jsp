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

	$("#btnDelete").click(function() {

		var result = confirm("정말 삭제하시겠습니까?") 

		if (result == true) {
			$(location).attr("href", "/admin/ask/delete?askNo=${ask.askNo }");
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

function deleteComment(askComNo) {
	
		var result = confirm("정말 삭제하시겠습니까?") 

		if (result == false) {
			
			return;
			
		}
	
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
	padding: 100px;
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
	margin: 0 auto 0;
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
	background: #808080;
    border-radius: 0px;
    height: 35px;
    border: 1px solid #808080;
    color: #fff;
    padding: 0 15px;
}

.btnGroup:hover {
	border: 1px solid #808080;
	background: #fff;
	color: #808080;
	transition: all .2s ease-in-out;
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
				<c:if test="${ask.userNo ne 0}">
					<span class="confirmation username">${user.userNick }</span>
				</c:if>
				<c:if test="${ask.userNo eq 0 }">
						탈퇴한 회원
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
					value="${ask.askDate }" pattern="yy-MM-dd HH:mm:ss" />
			</span> <span class="bar">|</span> <span>조회 <span id="cntCom">${ask.askHit }</span>
			</span> <span class="bar">|</span> <span>댓글 ${cntCom }</span>

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

					<img class="vote pull-left" id="like"
						src="https://i.imgur.com/iLdts0b.png" alt="찬성" />
				</div>
				<div id="chartBox">
					<div class="chart"></div>
				</div>

				<div>
					<div class="pull-right cnt" id="cntN">${cntN }</div>
					<img class="vote pull-right" id="hate"
						src="https://i.imgur.com/0sDsZn8.png" alt="반대" />
				</div>
			</div>
		</c:if>


		<c:if test="${check eq 'n'}">
			<p style="font-size: 16px;">투표가 종료되었습니다</p>
			<div class="check">
				<div>
					<c:if test="${cntY > cntN}">
						<div class="pull-left cnt" id="cntY">
							<strong>${cntY }</strong>
						</div>
					</c:if>

					<c:if test="${cntY <= cntN}">
						<div class="pull-left cnt" id="cntY">${cntY }</div>
					</c:if>


					<c:if test="${cntY > cntN}">
							<img class="pull-left success"
								src="https://i.imgur.com/aH44JbJ.png" alt="찬성이많고찬성에투표" />
					</c:if>
					<c:if test="${cntY <= cntN}">
							<img class="pull-left vote"
								src="https://i.imgur.com/iLdts0b.png" alt="찬성이많고찬성에투표하지않음" />
					</c:if>


				</div>

				<div id="chartBox">
					<div class="chart"></div>
				</div>

				<div>
					<c:if test="${cntN > cntY}">
						<div class="pull-right cnt" id="cntN">
							<strong>${cntN }</strong>
						</div>
					</c:if>

					<c:if test="${cntN <= cntY}">
						<div class="pull-right cnt" id="cntN">${cntN }</div>
					</c:if>

					<c:if test="${cntY < cntN}">
							<img class="success pull-right"
								src="https://i.imgur.com/C4qO9bG.png" alt="반대가많고반대에투표함" />
					</c:if>
					<c:if test="${cntY >= cntN}">
							<img class="vote pull-right"
								src="https://i.imgur.com/0sDsZn8.png" alt="반대가많고반대에투표하지않음" />
					</c:if>


				</div>
			</div>
		</c:if>

		<br> <br>
		<hr>
		<!-- 댓글 리스트 -->
		<table class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 4%;"></th>
					<th style="width: 15%; padding-right: 47px;">닉네임</th>
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
							<td style="text-align: left;">${askComment.USER_NICK }</td>
						</c:if>
						<c:if test="${askComment.USER_NICK eq null}">
							<td style="text-align: left;">탈퇴한 회원</td>
						</c:if>
						<td id="td${askComment.ASK_COM_NO }" style="text-align: left;">${askComment.ASK_COM_CONTENT }</td>
						<td id="dateTd${askComment.ASK_COM_NO }" style="width: 10%;">
							<fmt:formatDate value="${askComment.ASK_COM_DATE }"
								pattern="yy-MM-dd HH:mm:ss" />
						</td>
						<td>
							<button class="btn btn-default btn-xs btnDel"
								onclick="deleteComment(${askComment.ASK_COM_NO });">삭제</button>

						</td>
					</tr>
				</c:forEach>
				<tr id="appendArea"></tr>
			</tbody>
		</table>
		<!-- 댓글 리스트 end -->


		<!-- 댓글 처리 -->




		<!-- 댓글 처리 end -->


			<a href="/admin/ask/list"><button class="btn btnGroup">목록</button></a>

			<button type="button" class="btn btnGroup" id="btnDelete">삭제</button>


	</div>
	<%-- --%>

</div>
<!-- .container end -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
<!-- .wrap end -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">
function message () {
	action_popup.confirm("답장을 보내시겠습니까?", function(result) {
	
		if(result == true) {
			window.open('/message/reply?userNo=${senderNo}', '쪽지 보내기', 'height=500, width=620, left=400, top=500, resizable=no');
		} else {
			return false;
		}
		
	})
	
	/* 닫는 창으로 꼭 필요함 */
	$(".modal_close").on("click", function() {
		action_popup.close(this);
	});
}

</script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnDelete").click(function() {
		action_popup.confirm("쪽지를 삭제하시겠습니까? 해당 작업은 되돌릴 수 없습니다.", function(result) {

			if( result == true ){
	
				location.href="/message/receive/delete?msgNo=${msg.msgNo}";
	
			} else {
				return false;
			}
		})
		
		/* 닫는 창으로 꼭 필요함 */
		$(".modal_close").on("click", function() {
			action_popup.close(this);
		});
	})

})
</script>

<style>

body {
	background-color: #f2f2f2;
}

.tablearea {
	margin: 8px auto 0;
	position: relative;
	width: 500px;
	padding: 20px 0 0 0 ;
}

.titlearea {
	background-color: #fff;
	padding: 20px 0 0 0 ;
}

.buttonarea {
	margin: 40px 0 20px 0 ;
}

.messagearea {
	background-color: #fff;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	padding: 30px 20px 30px 20px;
}


.bottom {
	position: absolute;
	bottom: -20px;
	left: 0px;
	width: 500px;
	height: 21px;
	background-image: url("/resources/img/bottom.png");
	background-repeat: repeat;
	background-repeat-y: no-repeat;
}

.barcode {
	position: relative;
	margin: 0 auto;
	background: #fff;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
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
	top: 1px;
	left: 0;
	content: '';
	clear: both;
	display: inline-block;
	width: 1px;
	height: 28px;
	background: #333;
}

.lineInfo li:nth-child(1) {
	width: 22%;
}

.lineInfo li:nth-child(2) {
	width: 38%;
}

.lineInfo li:nth-child(3) {
	width: 40%;
}

.lineInfo li dl {
	margin: 0;
	padding: 5px 0;
}

.lineInfo li dl dt, .lineInfo li dl dd {
	float: left;
}

.lineInfo li dl dt {
	width: 72px;
}

.lineInfo li dl dd {
	text-align: left;
	width: calc(100% - 80px);
	word-break: break-all;
}

.contentbtn {
	height: 35px;
	width: 76px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;

}

.contentbtn:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
	
}

.content {
	font-size: 16px;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="tablearea">
	<div class="wraparea">
		<div class="titlearea">
			<div class="logo">
				<img id="logo" src="https://i.imgur.com/if5laLF.png" width="135px" height="65px"/>
			</div>	
			<h3>${msg.msgTitle }</h3>
			<div class="lineInfo">
				<ul>
					<li>
						<dl class="clearfix">
							<dt>NO</dt>
							<dd>${msg.msgNo }</dd>
						</dl>
					</li>
					<li>
						<dl class="clearfix">
							<dt>TO</dt>
							<dd>${userNick}</dd>
						</dl>
					</li>
					<li>
						<dl class="clearfix">
							<dt>DATE</dt>
							<dd><fmt:formatDate value="${msg.msgDate }" pattern="yy-MM-dd HH:mm" /></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div> <!-- .titlearea end --> 
		
		<div class="messagearea" style="height: 300px;">
			<span class="content">${msg.msgContent }</span>
		</div>
	</div>
	<div class="barcode">
		<img alt="#" src="/resources/img/askBarcode2.png">
		<div class="bottom"></div>
	</div>
</div> <!-- .tablearea end -->
<div class="buttonarea">
	<a href="/message/receive/list"><button class="contentbtn">목록</button></a>
	<button id="btnDelete" class="contentbtn">삭제</button>
</div>

</div><!-- .container end -->
<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div><!-- .wrap end -->


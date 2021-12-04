<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script>

$(document).ready(function() {
	$(".question").click(function() {
		$(this).next(".answer").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".answer").siblings(".answer").slideUp(300); // 1개씩 펼치기
	})

})

</script>


<style>


body {
	background: #f2f2f2;
}

a {
	color: #667F92; 
}

.title > p {
	color: #85969E;
}

* {
	box-sizing: border-box; 
}

#Accordion_wrap > div {
	text-align: left;
	padding-left: 30px;
}
  
.question:first-child {
	border-top: 1px solid #85969e;
}

.question {
	position: relative;
	padding: 17px 0;
	cursor: pointer;
	font-size: 14px;
	border-bottom: 1px solid #dddddd;
	color: #667F92; 
	
}

.question::before{
	display: inline-block;
	content: 'Q';
	font-size: 14px;
	color: #000;
	margin-right: 5px;
	font-weight: bold;
	
}

.question::before{
	display: inline-block;
	content: 'Q';
	font-size: 14px;
	color: #000;
	margin-right: 5px;
	font-weight: bold;
	
}

.question.on>span {
	font-weight: bold;
	color: #667F92; 
}

.answer {
	display: none;
	overflow: hidden;
	font-size: 14px;
	background-color: #BDB8B4;
	padding: 27px 0;
}
  
.answer::before {
	display: inline-block;
	content: 'A';
	font-size: 14px;
	font-weight: bold;
	color: #f2f2f2;
	margin-right: 5px;
}

.pull-left {
	margin: 0 0 0 20px;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div style="height:30px;"></div>

<div class="title">
	<h1>자주 묻는 질문(FAQ)</h1>
	<p>고객님들께서 자주 남겨주시는 질문들을 모았습니다.</p>
</div>

<div style="height:20px;"></div>

<div id="Accordion_wrap">
     <div class="question">
      <span>게시글을 신고하면 상대방이 알 수 있나요?</span>
     </div>
     <div class="answer">
      <span>상대방(신고를 당한 사람)은 누가 신고했는지 알 수 없습니다. 그러니 신고해야 할 일이 생겼다면 안심하고 신고해 주세요.</span>
     </div>
      <div class="question">
      <span>오이장터에 올라온 상품 가격이 너무 비싸요.</span>
     </div>
     <div class="answer">
      <span>중고거래인 만큼 판매자가 자유롭게 가격을 책정하도록 하고, 개입하여 판매 가격을 조정하지 않습니다.<br>
			제품 상태에 따라 가격이 천차만별일 수 있기 때문에 임의로 적정 가격을 제시하기 어렵습니다.<br>
			하지만 시간이 지나고, 거래가 활성화되면 자연스럽게 적정 가격이 형성됩니다.</span>
     </div>
      <div class="question">
      <span>거래를 하다가 사기를 당했을 경우, 보상 절차는 어떻게 되나요?</span>
     </div>
     <div class="answer">
      <span> KH영수증은 중개자로, 운영정책에 따라 운영될 뿐 거래에 대한 모든 책임은 거래 당사자에게 있습니다.<br>
			따라서 거래 관련 문제가 발생했을 경우 구매자와 판매자가 직접 합의하여 해결하는 것을 기본으로 합니다. <br>
			하지만 합의가 어려운 경우 위에 명시한 권리 및 의무에 따라 구매자나 판매자를 이용제재 할 수 있고, 분쟁이 해결된 경우에만 이용제재를 해제합니다.<br>
			구매자와 판매자 모두 분쟁을 해결하는 과정에서 상대방에게 비하/조롱/모욕/반말 등의 언행을 했다면 비매너 경고 또는 이용제재를 받을 수 있습니다.</span>
     </div>
      <div class="question">
      <span>로그인에 문제가 있어요.</span>
     </div>
     <div class="answer">
      <span>로그인이 되지 않는 경우는 다음 사항을 확인하시기 바랍니다.<br><br>
			1. 아이디 비밀번호 확인<br>
			로그인이 안 될 경우에는 로그인 페이지에 있는 아이디 찾기 또는 비밀번호 찾기에서 아이디와 비밀번호를 확인하여 주십시오.<br><br>

			2. 비밀번호 입력 오류<br>
			비밀번호 찾기를 통해 비밀번호를 재발급 받을 수 있습니다.<br><br>
			
			3. 웹브라우져 확인사항 체크<br>
			아이디, 비밀번호가 일치하지만 로그인이 되지 않을 경우에는 PC에서 웹브라우져의 확인사항을 체크해 주십시오.</span>
     </div>
      <div class="question">
      <span>회원 탈퇴는 어떻게 하나요?</span>
     </div>
     <div class="answer">
      <span>회원탈퇴는 마이페이지의 회원정보 페이지에서 신청하실 수 있습니다.</span>
     </div>
      <div class="question">
      <span>포인트는 언제 지급되고, 등급은 어떻게 정해지나요?</span>
     </div>
     <div class="answer">
      <span>포인트와 등급제도에 대한 안내는 공지사항에서 확인하실 수 있습니다<br>
      공지사항 링크 걸게요</span>
     </div>
      <div class="question">
      <span>차단된 회원이라며 로그인이 되지 않아요.</span>
     </div>
     <div class="answer">
      <span>이용제한 상태로 로그인이 되지 않는 경우에는 공지사항 - 서비스 이용 제한 회원 목록을 확인하시기 바랍니다.</span>
     </div>
</div>


<div style="height:50px;"></div>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


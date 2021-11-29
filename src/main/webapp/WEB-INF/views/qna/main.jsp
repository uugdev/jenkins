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

<div class="pull-left">
	<a href="<%=request.getContextPath() %>/qna/list"><span>문의하기&nbsp;</span></a><span>|</span>
	<a href="<%=request.getContextPath() %>/notice/list"><span>&nbsp;공지사항</span></a>
</div>

<div class="title">
	<h1>자주 묻는 질문(FAQ)</h1>
	<p>고객님들께서 자주 남겨주시는 질문들을 모았습니다.</p>
</div>

<div style="height:20px;"></div>

<div id="Accordion_wrap">
     <div class="question">
      <span>자주 묻는 질문 1</span>
     </div>
     <div class="answer">
      <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec ultricies magna. Fusce egestas libero sit amet metus tincidunt, et molestie ex pharetra. Mauris vitae pulvinar libero. <br>
     Suspendisse eu efficitur neque. Maecenas nec ultrices velit. Donec viverra molestie purus quis egestas.<br>
     Vestibulum cursus semper venenatis. Maecenas malesuada porta quam id hendrerit. Fusce iaculis, magna in faucibus euismod, neque lorem venenatis mauris, a rutrum nisi nunc at massa.<br>
     Etiam maximus lorem congue, suscipit neque eget, vulputate mauris. Nam risus est, venenatis sed finibus tincidunt, pellentesque nec libero.</span>
     </div>
      <div class="question">
      <span>자주 묻는 질문 2</span>
     </div>
     <div class="answer">
      <span>대답 2</span>
     </div>
      <div class="question">
      <span>자주 묻는 질문 3</span>
     </div>
     <div class="answer">
      <span>대답 3</span>
     </div>
      <div class="question">
      <span>자주 묻는 질문 4</span>
     </div>
     <div class="answer">
      <span>대답 4</span>
     </div>
      <div class="question">
      <span>자주 묻는 질문 5</span>
     </div>
     <div class="answer">
      <span>대답 5</span>
     </div>
      <div class="question">
      <span>자주 묻는 질문 6</span>
     </div>
     <div class="answer">
      <span>대답 6</span>
     </div>
      <div class="question">
      <span>자주 묻는 질문 7</span>
     </div>
     <div class="answer">
      <span>대답 7</span>
     </div>
      <div class="question">
      <span>자주 묻는 질문 8</span>
     </div>
     <div class="answer">
      <span>대답 8</span>
     </div>
</div>









<div style="height:50px;"></div>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


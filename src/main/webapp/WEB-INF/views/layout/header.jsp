<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

$(document).ready(function() {
	
    $('#boardA').hover(function() {
    	$(".blockNav").slideDown();
    });
    
    $('#topContainer').mouseleave(function() {
    	$(".blockNav").slideUp();
    });
    
});

</script>

<header>
	<nav class="navbar navbar-default navbar-fixed-top" style="border: 0;">
		<div id="topContainer" class="container-fluid" style="padding: 0;">
			<div class="navbar-header">
				<a href="/main">
				<img id="logo" src="https://i.imgur.com/if5laLF.png"
				   alt="huxley" width="135px" height="65px" style="margin: 15px; margin-left: 50px;"></a>
				   
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					    data-target="#myNavbar"style="border: 1px solid black; background: #f2f2f2;">
					<span class="icon-bar" style="background: black;"></span>
					<span class="icon-bar" style="background: black;"></span>
					<span class="icon-bar" style="background: black;"></span>
				</button>
			</div>
			
			<div class="collapse navbar-collapse" id="myNavbar"
				 style="background: white; height: 100px;">
				<ul class="nav navbar-nav" id="navbar">
					<li>
						<a id="boardA" role="button">
							<h3 style="font-weight: bold;">게시판</h3>
						</a>
					</li>
					<li><a href="/account/main"><h3 style="font-weight: bold;">가계부</h3></a></li>
					<li><a href="/mypage/info"><h3 style="font-weight: bold;">마이페이지</h3></a></li>
					<li><a href="/qna/list"><h3 style="font-weight: bold;">문의</h3></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${login }">
							<li><a href="/message/receive/list" style="padding: 3px; margin: 12px 0 0 0;">MESSAGE(${unreadMsg })</a></li>
							<li style="padding: 0; margin: 14px 0 0 0;"> ｜ </li>
							<li><a href="/member/logout" style="padding: 3px; margin: 12px 34px 0 0;">LOGOUT</a></li>
						</c:when>
						<c:when test="${empty login }">
							<li><a href="/member/login" style="padding: 3px; margin: 12px 0 0 0;">LOGIN</a></li>
							<li style="padding: 0; margin: 14px 0 0 0;"> ｜ </li>
							<li><a href="/member/join" style="padding: 3px; margin: 12px 34px 0 0;">JOIN</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
			<div id="boardNav" class="blockNav container"
				 style="background: gray; display: none; width: 100%; height: 45px; text-align: left;">
				<p style="line-height: 46px;">
					<a href="/ask/list" style="margin-left: 228px;">질문 게시판</a>
					<a href="/review/list">후기 게시판</a>
					<a href="/trade/list">거래 게시판</a>
				</p>
			</div>
		</div>
	</nav>
</header>


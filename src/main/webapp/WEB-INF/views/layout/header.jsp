<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="/main">
				<img src="https://i.imgur.com/DEHqUdu.png"
				   alt="huxley" width="250px" height="65px" style="margin: 15px;"></a>
				   
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
					<li class="dropdown">
						<a class="dropdown-toggle" data-target="#" data-toggle="dropdown" role="button" aria-expanded="false" style="margin: 7px 0 0 30px;"><h3>게시판</h3></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/ask/list">질문 게시판</a></li>
							<li class="divider"></li>
							<li><a href="/review/list">후기 게시판</a></li>
							<li class="divider"></li>
							<li><a href="/trade/list">거래 게시판</a></li>
						</ul>
					</li>
					<li><a href="#" style="margin: 7px 0 0 30px;"><h3>가계부</h3></a></li>
					<li><a href="/mypage/info" style="margin: 7px 0 0 30px;"><h3>마이페이지</h3></a></li>
					<li><a href="/qna/list" style="margin: 7px 0 0 30px;"><h3>문의</h3></a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${login }">
							<li><a href="/message/receive/list" style="padding: 3px; margin: 12px 0 0 0;">MESSAGE</a></li>
							<li style="padding: 0; margin: 14px 0 0 0;"> ｜ </li>
							<li><a href="/member/logout" style="padding: 3px; margin: 12px 15px 0 0;">LOGOUT</a></li>
						</c:when>
						<c:when test="${empty login }">
							<li><a href="/member/login" style="padding: 3px; margin: 12px 0 0 0;">LOGIN</a></li>
							<li style="padding: 0; margin: 14px 0 0 0;"> ｜ </li>
							<li><a href="/member/join" style="padding: 3px; margin: 12px 15px 0 0;">JOIN</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</header>


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
				<ul class="nav navbar-nav">
					<li><a href="/admin/user/list" style="margin: 7px 0 0 30px;"><h4>회원 관리</h4></a></li>
					<li><a href="#" style="margin: 7px 0 0 30px;"><h4>공지 관리</h4></a></li>
					<li><a href="#" style="margin: 7px 0 0 30px;"><h4>질문게시판 관리</h4></a></li>
					<li><a href="#" style="margin: 7px 0 0 30px;"><h4>후기게시판 관리</h4></a></li>
					<li><a href="#" style="margin: 7px 0 0 30px;"><h4>거래게시판 관리</h4></a></li>
					<li><a href="#" style="margin: 7px 0 0 30px;"><h4>신고 관리</h4></a></li>
					<li><a href="#" style="margin: 7px 0 0 30px;"><h4>문의 관리</h4></a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${adminLogin }">
							<li><a href="/main" style="padding: 3px; margin: 12px 0 0 0;">MEMBER PAGE</a></li>
							<li style="padding: 0; margin: 14px 0 0 0;"> ｜ </li>
							<li><a href="/admin/logout" style="padding: 3px; margin: 12px 15px 0 0;">LOGOUT</a></li>
						</c:when>
						<c:when test="${empty adminLogin }">
							<li><a href="/main" style="padding: 3px; margin: 12px 0 0 0;">MEMBER PAGE</a></li>
							<li style="padding: 0; margin: 14px 0 0 0;"> ｜ </li>
							<li><a href="/admin/login" style="padding: 3px; margin: 12px 15px 0 0;">LOGIN</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</header>


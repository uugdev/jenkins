<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

$(function(){
    $('#boardB').hover(function() {
    	$("#adminBoardNav").slideDown("fast");
    	$("#adminReportNav").slideUp(0);
    	$("#adminCscenterNav").hide();
    });
    
    $('#reportB').hover(function() {
    	$("#adminBoardNav").slideUp(0);
    	$("#adminReportNav").slideDown("fast");
    	$("#adminCscenterNav").slideUp(0);
    });

    $('#cscenterB').hover(function() {
    	$("#adminBoardNav").hide();
    	$("#adminReportNav").slideUp(0);
    	$("#adminCscenterNav").slideDown("fast");
    });
    
    $('#topContainer').mouseleave(function(){
    	$('.blockNav').slideUp();
    });
    
})


</script>


<header>
	<nav class="navbar navbar-default navbar-fixed-top" style="border: 0;">
		<div id="topContainer" class="container-fluid" style="padding: 0;">
			<div class="navbar-header">
				<a href="/main">
				<img src="https://i.imgur.com/if5laLF.png"
				   alt="huxley" width="135px" height="65px" style="margin: 15px; margin-left: 100px;"></a>
				   
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
					<li><a href="/admin/user/list" style="margin: 7px 0 0 30px;"><h3 style="font-weight: bold;">회원 관리</h3></a></li>
					<li>
						<a id="boardB" role="button" style="margin: 7px 0 0 30px;"><h3 style="font-weight: bold;">게시판 관리</h3></a>
					</li>
					<li>
						<a id="reportB" role="button" style="margin: 7px 0 0 30px;"><h3 style="font-weight: bold;">신고 관리</h3></a>
					</li>
					<li><a id="cscenterB" role="button" style="margin: 7px 0 0 30px;"><h3 style="font-weight: bold;">고객센터 관리</h3></a></li>
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
			<div id="adminBoardNav" class="blockNav container"
				style="background: gray; display: none; width: 100%; height: 45px; text-align: left; z-index: 1;">
				<p style="line-height: 46px;">
					<a href="/admin/ask/list" style="margin-left: 433px;">질문게시판</a>
					<a href="/admin/review/list">후기게시판</a>
					<a href="/admin/trade/list">거래게시판</a>
				</p>
			</div>
			<div id="adminReportNav" class="blockNav container"
				style="background: gray; display: none; width: 100%; height: 45px; text-align: left; z-index: 1;">
				<p style="line-height: 46px;">
					<a href="/admin/report/ask/list" style="margin-left: 425px;">질문게시글 신고</a>
					<a href="/admin/report/review/list">후기게시글 신고</a>
					<a href="#">거래게시글 신고</a>
				</p>
			</div>
			<div id="adminCscenterNav" class="blockNav container"
				style="background: gray; display: none; width: 100%; height: 45px; text-align: left; z-index: 1;">
				<p style="line-height: 46px;">
					<a href="/admin/notice/list" style="margin-left: 732px;">공지사항</a>
					<a href="/admin/qna/list">1:1 문의</a>
				</p>
			</div>
		</div>
	</nav>
</header>


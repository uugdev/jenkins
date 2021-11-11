<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/main.css" />
<!-- 개별 영역 끝 -->

<div class="wrap">
    <div class="container-fluid" style="background-color: black;">
        <div class="container" style="padding: 0; margin-bottom: 25px;">
            <div class="col-md-8" style="margin-top: 25px;">
            	<div>
	                <div>
			           	<!-- 인기 게시글 -->
						<div class="table-responsive" style="background-color:#eee;">
							<p style="font-size: 25px;">
								<img alt="fire" src="https://i.imgur.com/9LX0LXQ.png" width="30px;" height="30px;"> 현재 뜨거운 게시글
							</p>
							<table class="table" id="popular_table">
								<tr>
									<td><img alt="#" src="#"></td>
									<td>게시글1</td>
									<td><img alt="#" src="#"></td>
									<td>게시글2</td>
								</tr>
								<tr>
									<td><img alt="#" src="#"></td>
									<td>게시글3</td>
									<td><img alt="#" src="#"></td>
									<td>게시글4</td>
								</tr>
								<tr>
									<td><img alt="#" src="#"></td>
									<td>게시글5</td>
									<td><img alt="#" src="#"></td>
									<td>게시글6</td>
								</tr>
							</table>
						</div>
					</div>
					<br>
					<!-- 메인 멘트 -->
	                <div class="table-responsive" style="background-color:#eee; height: 153px;">
	                	<p class="pull-right" style="font-size: 16px;">회원님이 이번 달 아낀 돈은 - 원입니다.</p>
	                </div>
                </div>
            </div>
            
            <div class="col-md-1"></div>
            
            <!-- 영수증 -->
            <div class="col-md-4" id="bill" style="background-color:#eee; margin-top: 25px;">
                <p>[주문(대기)번호]</p>
	                <div style="margin: auto; text-align: center;">
		                <c:choose>
		                	<c:when test="${!empty userNo }">
				                <span style="font-size: 30px;">${userNo }</span>
		                	</c:when>
		                	<c:when test="${empty userNo }">
				                <span style="font-size: 30px;">1004</span>
		                	</c:when>
		                </c:choose>
	                </div>
	            <span>주문내역</span>
                <hr style="border: 3px solid black; margin: 0 10px 10px 0;">
                <div style="width: auto; height: 300px; overflow: auto;">
                
                </div>
                <hr style="border: 2px dashed black; margin: 0 10px 10px 0;">
                <span>총 주문금액</span>
                <span style="float: right;">0 원</span>
                <img alt="barcode" src="https://i.imgur.com/hGHStFZ.png" style="margin-top: 10px; width: 100%;">
                <span id="time" style="float: right;"></span>
                
            </div>
        </div>
    </div>
<div class="container" id="main">

<hr class="featurette-divider">

	<!-- 등수 -->
	<div class="row">
		<p style="font-size: 30px; text-align: center;">
			<img alt="good" src="https://i.imgur.com/jGvv25B.png" width="30px;" height="30px;"> 너가 최고야!
		</p>
		<div class="col-lg-4">
			<img class="img-circle"
				src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				alt="일반 자리 표시자 이미지" width="140" height="140">
			<h2>1등</h2>
			<p>1등 닉네임</p>
		</div>
		<div class="col-lg-4">
			<img class="img-circle"
				src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				alt="일반 자리 표시자 이미지" width="140" height="140">
			<h2>2등</h2>
			<p>2등 닉네임</p>
		</div>
		<div class="col-lg-4">
			<img class="img-circle"
				src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				alt="일반 자리 표시자 이미지" width="140" height="140">
			<h2>3등</h2>
			<p>3등 닉네임</p>
		</div>
	</div>

	<hr class="featurette-divider">

		<div class="row featurette">
			<!-- 공지사항 -->
			<div class="col-md-9">
				<div class="table-responsive">
					<table class="table table-hover" id="notice_table" style="height: 350px;">
						<tr>
							<th style="text-align: center; font-size: 20px; background-color: gray;">공지사항</th>
						</tr>
						<tr>
							<td>게시글1</td>
						</tr>
						<tr>
							<td>게시글2</td>
						</tr>
						<tr>
							<td>게시글3</td>
						</tr>
						<tr>
							<td>게시글4</td>
						</tr>
						<tr>
							<td>게시글5</td>
						</tr>
						<tr>
							<td>게시글6</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="col-md-1"></div>
			
			<!-- 인기 게시글 -->
			<div class="col-md-3">
				<table class="table table-hover" id="rank_table" style="height: 342px;">
					<tr>
						<td>4</td>
						<td>유저</td>
					</tr>
					<tr>
						<td>5</td>
						<td>유저</td>
					</tr>
					<tr>
						<td>6</td>
						<td>유저</td>
					</tr>
					<tr>
						<td>7</td>
						<td>유저</td>
					</tr>
					<tr>
						<td>8</td>
						<td>유저</td>
					</tr>
					<tr>
						<td>9</td>
						<td>유저</td>
					</tr>
					<tr>
						<td>10</td>
						<td>유저</td>
					</tr>
				</table>
			</div>
		</div>

		<hr class="featurette-divider">
	<p class="pull-right"><a href="#">맨 위로</a></p>

</div><!-- .container #main end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
<script src="/resources/js/main.js"></script>

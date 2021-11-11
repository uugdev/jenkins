<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<!-- 개별 영역 끝 -->

<div class="wrap">
    <div class="container-fluid" style="background-color: black;">
        <div class="container">
            <div class="col-md-7" style="width: 58%; margin: 20px;">
            	<div>
	                <div>
						<div class="table-responsive" style="background-color:#eee;">
							<p style="font-size: 16px;">현재 뜨거운 게시글</p>
							<table class="table">
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
	                <div class="table-responsive" style="background-color:#eee;">
	                	<p class="pull-right" style="font-size: 16px;">회원님이 이번 달 아낀 돈은 - 원입니다.</p>
	                </div>
                </div>
            </div>
            <div class="col-md-4" style="background-color:#eee; margin: 20px;">
                <p>Content.</p>
                <p>Content.</p>
                <p>Content.</p>
            </div>
        </div>
    </div>
<div class="container" id="main">

<hr class="featurette-divider">

	<!-- 등수 -->
	<div class="row">
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
		<div class="col-md-7 col-md-push-5">
			<h2 class="featurette-heading">
				테스트
			</h2>
			<p class="lead">
				테스트
			</p>
		</div>
		<div class="col-md-5 col-md-pull-7">
			<img class="featurette-image img-responsive center-block"
				data-src="holder.js/500x500/auto" alt="500x500"
				src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgdmlld0JveD0iMCAwIDUwMCA1MDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzUwMHg1MDAvYXV0bwpDcmVhdGVkIHdpdGggSG9sZGVyLmpzIDIuNi4wLgpMZWFybiBtb3JlIGF0IGh0dHA6Ly9ob2xkZXJqcy5jb20KKGMpIDIwMTItMjAxNSBJdmFuIE1hbG9waW5za3kgLSBodHRwOi8vaW1za3kuY28KLS0+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48IVtDREFUQVsjaG9sZGVyXzE3ZDBjOGUxMmVjIHRleHQgeyBmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MjVwdCB9IF1dPjwvc3R5bGU+PC9kZWZzPjxnIGlkPSJob2xkZXJfMTdkMGM4ZTEyZWMiPjxyZWN0IHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIiBmaWxsPSIjRUVFRUVFIi8+PGc+PHRleHQgeD0iMTg1LjEyNSIgeT0iMjYxLjI4MjgxMjUiPjUwMHg1MDA8L3RleHQ+PC9nPjwvZz48L3N2Zz4="
				data-holder-rendered="true">
		</div>
    </div>
    
	<hr class="featurette-divider">
	<p class="pull-right"><a href="#">맨 위로</a></p>

</div><!-- .container #main end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


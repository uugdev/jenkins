<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <%--page title--%>
    <title>이건못참조</title>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body style="height:1500px">
<%--header--%>
<c:import url="/WEB-INF/views/layout/header.jsp" />


    <div class="container-fluid" style="background-color: black;">
        <div class="container">
            <div class="col-md-4" style="border:1px solid white; background-color:#eee;">
                <div><p>MENU</p></div>
                <div><p>MENU</p></div>
            </div>
            <div class="col-md-8"
                style="border:1px solid white; background-color:#eee;">
                <p>Content.</p><p>Content.</p><p>Content.</p></div>
        </div>
    </div>

<hr class="featurette-divider">

<div class="container marketing">

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

	<hr class="featurette-divider">
	<p class="pull-right"><a href="#">맨 위로</a></p>
      <!-- /END THE FEATURETTES -->

    </div>
</div>

<%--footer--%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>

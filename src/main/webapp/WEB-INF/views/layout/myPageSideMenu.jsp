<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>

#menu {
	margin: 80px 0 0 0;
}

#menu a {
    display: block;
    text-decoration: none;
}

.M01 {
    margin-left: 20px;
    width: 100px;
}

.M01>li, .M02>li {
    position: relative;
    width: 100%;
    height: 50px;
    text-align: center;
    line-height: 50px;
}

.M01>li:hover .M02 {
    left: 100px;
}

.M01>li a:hover {
    display: block;
}

.M02 {
    width: 100px;
    position: absolute;
    top: 0;
    left: -9999px;
}

.M02>li:hover .M03 {
    left: 100px;
}

.M02>li a:hover {
    display: block;
}

ul {
	list-style: none; 
	padding-left: 0;
}




</style>
<div class="col-md-3" style="height: 500px;">
	<div id="menu">
		<ul class="M01">
			<li><h4>마이페이지</h4></li>
			<li><a>회원정보</a>
				<ul class="M02">
					<li><a href="/mypage/info">내 정보 조회</a></li>
					<li><a href="/mypage/update">내 정보 수정</a></li>
				</ul>
			</li>
			<li><a href="/mypage/item/list">결제 체크하기</a>
			<li><a>작성한 글</a>
				<ul class="M02">
					<li><a href="/mypage/ask/list">질문 게시판</a></li>
					<li><a href="/mypage/review/list">후기 게시판</a></li>
					<li><a href="/mypage/trade/list">거래 게시판</a></li>
				</ul>
			</li>
			<li><a>작성한 댓글</a>
				<ul class="M02">
					<li><a href="/mypage/ask/comment/list">질문 게시판</a></li>
					<li><a href="/mypage/review/comment/list">후기 게시판</a></li>
					<li><a href="/mypage/trade/comment/list">거래 게시판</a></li>
				</ul>
			</li>
			<li><a>스크랩</a>
				<ul class="M02">
					<li><a href="/mypage/ask/scrap/list">질문 게시판</a></li>
					<li><a href="/mypage/review/scrap/list">후기 게시판</a></li>
					<li><a href="/mypage/trade/scrap/list">거래 게시판</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
	
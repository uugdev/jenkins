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

.M02>li a:hover {
    display: block;
}

ul {
	list-style: none; 
	padding-left: 0;
}

li {
	font-weight: bold;
	cursor: pointer;
}

a {
	color: #5F6062;
}

a:hover {
    color: #85969E;
    text-decoration: none;
}

h4 {
	color: #667F92;
}



</style>
<div class="col-md-3" style="height: 500px;">
	<div id="menu">
		<ul class="M01">
			<li><h4><strong>마이페이지</strong></h4></li>
			<li><a>회원정보</a>
				<ul class="M02">
					<li><a href="/mypage/info">>&nbsp;&nbsp;&nbsp;&nbsp; 내 정보 조회</a></li>
					<li><a href="/mypage/update">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 내 정보 수정</a></li>
				</ul>
			</li>
			<li><a href="/mypage/item/list">결제 체크하기</a>
			<li><a>작성한 글</a>
				<ul class="M02">
					<li><a href="/mypage/ask/list">>&nbsp;&nbsp;&nbsp;&nbsp;머니토론</a></li>
					<li><a href="/mypage/review/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지출내역서</a></li>
					<li><a href="/mypage/trade/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오이장터</a></li>
				</ul>
			</li>
			<li><a>작성한 댓글</a>
				<ul class="M02">
					<li><a href="/mypage/ask/comment/list">>&nbsp;&nbsp;&nbsp;&nbsp;머니토론</a></li>
					<li><a href="/mypage/review/comment/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지출내역서</a></li>
					<li><a href="/mypage/trade/comment/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오이장터</a></li>
				</ul>
			</li>
			<li><a>스크랩</a>
				<ul class="M02">
					<li><a href="/mypage/ask/scrap/list">>&nbsp;&nbsp;&nbsp;&nbsp;머니토론</a></li>
					<li><a href="/mypage/review/scrap/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지출내역서</a></li>
					<li><a href="/mypage/trade/scrap/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오이장터</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
	
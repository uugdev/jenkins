<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">
function userupdate() {
    action_popup.confirm("회원정보 수정 페이지로 이동하시겠습니까?", function (res) {
        if (res) {
			location.href="/mypage/update?userNo=${user.userNo }";
        }
    })
    /* 닫는 창으로 꼭 필요함 */
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
};

function userdelete() {
    action_popup.confirm("정말 탈퇴하시겠습니까? 작성하신 글은 삭제되지 않습니다.", function (res) {
        if (res) {
			$("form").submit();
        }
    })
    /* 닫는 창으로 꼭 필요함 */
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
};
</script>

<style>


body {
	background-color: #f2f2f2;

}
.container {
	width: 1200px;
}

#btnUpdate {
	float: left;
	margin: 0 0 0 20px;
}

#btnDelete {
	float: right;
	margin: 0 20px 0 0;
}

table {
	margin: 0 auto;
}

td {
	height: 45px;
	vertical-align: center;
}

.titlearea {
	margin: 50px 0 30px 0;
}

.wrap {
	margin-bottom: 0;
	height: 725px;
}

.col-md-9 {
	margin-top : 50px;
	background: #fff;
}

.buttonarea {
	background: #fff;
	margin: 0 auto;
}

.tablearea {
	margin-bottom: 40px;

}

#btnUpdate {
	height: 35px;
	width: 76px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

#btnDelete {
	height: 35px;
	width: 76px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

#btnUpdate:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

#btnDelete:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}


</style>
<!-- 개별 영역 끝 -->
<!-- 카카오 로그인 확인 절차 -->
<c:set var="userId" value="${user.userId }" />
<c:set var="kakaoUser" value="${fn:substringBefore(userId, '-') }" />
<!-- 카카오 로그인 확인 절차 끝 -->

<div class="wrap">
<div class="container">

<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />
	<div class="one">
		<div class="col-md-9" style="height: 600px;">
			<div class="titlearea"> 
				<h3>회원정보 조회</h3>
			</div>
			<div class="tablearea">
				<table class="table table-hover" style="width: 500px">
					<tr>
						<td style="width:10%" ><strong>아이디</strong></td>
						<c:if test="${kakaoUser == 'kakao'}">
							<td style="width:10%">소셜 로그인 회원입니다.</td>
						</c:if>
						<c:if test="${kakaoUser == '' }">
							<td style="width:10%" >${user.userId }</td>			
						</c:if>
					</tr>
					<tr>
						<td><strong>닉네임</strong></td>
						<td>${user.userNick }</td>
					</tr>
					<tr>
						<td><strong>이메일</strong></td>
						<td>${user.userMail }</td>
					</tr>
					<tr>
						<td><strong>성별</strong></td>
						<c:if test="${user.userGender == 'M' }">
							<td>남</td>
						</c:if>
						<c:if test="${user.userGender == 'F' }">
							<td>여</td>
						</c:if>
						<c:if test="${user.userGender == 'N' }">
							<td>선택 안함</td>
						</c:if>
					</tr>
					<tr>
						<td><strong>생일</strong></td>
						<td>${user.userBday }</td>
					</tr>
					<tr>
						<td><strong>가입일</strong></td>
						<td><fmt:formatDate value="${user.joinDate }" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td><strong>포인트</strong></td>
						<td>${user.userPoint }</td>
					</tr>
				
				</table>
			</div>
			
			<div class="buttonarea" style="width:200px; height: 100px;">
				<button id="btnUpdate" class="left" onclick='userupdate();'>수정하기</button>
				<form action="/mypage/delete" method="post">
				<button type="button" id="btnDelete" onclick='userdelete();'>회원탈퇴</button>
				<button hidden="hidden"></button>
				<input type="hidden" name="userNo" value="${user.userNo }">
				</form>
			</div><!-- .buttonarea end -->

		
		</div> <!-- .col-md-9 end -->
	</div> <!-- .one end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


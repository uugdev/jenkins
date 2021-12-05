<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script>
function itemstatustoY(t) {
    action_popup.confirm("구매하기로 결정하셨나요?", function (res) {
        if (res) {
        	location.href="/mypage/item/yes?itemNo="+t;
        }
    })
    /* 닫는 창으로 꼭 필요함 */
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
};

function itemstatustoN(t) {
    action_popup.confirm("구매하지 않기로 결정하셨나요? 취소가 불가능하니 신중하게 　선택해주세요!", function (res) {
        if (res) {
        	location.href="/mypage/item/no?itemNo="+t;
        }
    })
    /* 닫는 창으로 꼭 필요함 */
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
};

function writereview(t) {
    action_popup.confirm("후기 작성 페이지로 이동하시겠어요?", function (res) {
        if (res) {
        	location.href="/review/write?askNo="+t;
        }
    })
    /* 닫는 창으로 꼭 필요함 */
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
};

function itemcancel(t) {
    action_popup.confirm("다시 선택하시겠어요?", function (res) {
        if (res) {
        	location.href="/mypage/item/cancel?itemNo="+t;
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

.titlearea {
	margin: 50px 0 30px 0;
}

.contentbtn {
	height: 35px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
	width: 122px;
}

.contentbtn:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
	width: 122px;
}

.btnUpdateY, .btnUpdateN {
	padding-left: 11.5px;
	padding-right: 11.5px;
}

.tablearea {
	background-color: #fff;
	padding: 20px 30px 20px 30px;
	margin-bottom: 100px;
}

.titlearea > p {
	color: #85969E;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">


<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />

<div class="col-md-9">
	<div class="titlearea">
		<h2>결제 체크하기</h2>
		<p>작성하신 머니토론의 결과를 체크해주세요.</p>
		
	</div>
	<div class="tablearea">
		<div style="height: 30px; background-color: #fff;"></div>
		<table class="table table-striped table-hover">
			<tr>
				<th style="width:28%"><strong>상품명</strong></th>
				<th style="width:12%"><strong>가격</strong></th>
				<th style="width:10%"><strong>작성일</strong></th>
				<th style="width:16%"><strong>투표 마감시각</strong></th>
				<th style="width:34%"><strong>상태</strong></th>
			</tr>
			
			<c:forEach items="${list }" var="list">
			<tr>
				<td><a href="<%=request.getContextPath() %>/ask/detail?askNo=${list.ITEM_NO }">${list.ITEM_NAME }</a></td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.ITEM_PRICE }" />원</td>
				<fmt:formatDate value="${list.ASK_DATE }" pattern="yyyyMMdd" var="timeStr" />
				<fmt:formatDate value="<%=new Date()%>" pattern="yyyyMMdd" var="nowStr" />
	
				<td>
					<c:choose>
						<c:when test="${timeStr lt nowStr }">
							<fmt:formatDate value="${list.ASK_DATE }" pattern="yy-MM-dd" />
						</c:when>
						<c:when test="${timeStr eq nowStr }">
							<fmt:formatDate value="${list.ASK_DATE }" pattern="HH:mm" />
						</c:when>
					</c:choose>
				</td>
				
				<td><fmt:formatDate value="${list.VOTE_END }" pattern="yy-MM-dd HH:mm" /></td>
				<c:if test="${list.ITEM_STATUS == 'n'&& empty list.ITEM_DATE}">
					<td><button class="btnUpdateY contentbtn" onclick="itemstatustoY(${list.ITEM_NO});">살게요</button>
					<button class="btnUpdateN contentbtn" onclick="itemstatustoN(${list.ITEM_NO});">안살게요</button></td>
				</c:if>
				<c:if test="${list.ITEM_STATUS == 'n'&& not empty list.ITEM_DATE}">
					<td><span style="font-size: 15px; font-weight:bold; color:#667F92;">안살래요</span></td>
				</c:if>
				<c:if test="${list.ITEM_STATUS == 'y' && not empty list.ITEM_DATE && empty list.REVIEW_NO }">
					<td><button class="btnWrite contentbtn" onclick="writereview(${list.ITEM_NO});">지출내역서 쓰기</button>
					<button class="btnCancel contentbtn" onclick="itemcancel(${list.ITEM_NO });">마음이 바뀌었어요</button></td>
				</c:if>	
				<c:if test="${list.ITEM_STATUS == 'y' && not empty list.ITEM_DATE && not empty list.REVIEW_NO }">
					<td><a href="<%=request.getContextPath() %>/review/detail?reviewNo=${list.REVIEW_NO }"><button class="btnDetail contentbtn">지출내역서 보기</button></a></td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/layout/paging.jsp" />
	</div><!-- .tablearea end -->
</div> <!-- .col-md-9 end -->



</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />



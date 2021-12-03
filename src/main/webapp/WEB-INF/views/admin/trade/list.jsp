<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script type="text/javascript">
$(document).ready(function(){
	
	$(document).on('click', '#selectAll', function() {
	    if($('#selectAll').is(':checked')){
	       $('.check').prop('checked', true);
	    } else {
	       $('.check').prop('checked', false);
	    }
	});
	
	$(document).on('click', '.check', function() {
	    if($('input[class=check]:checked').length==$('.check').length){
	        $('#selectAll').prop('checked', true);
	    } else {
	       $('#selectAll').prop('checked', false);
	    }
	});
	
	
	$("#btnDelete").click(function(){
		var result = confirm("선택한 게시글을 삭제하시겠습니까?")
		var deleteTrade = [];
   
	    $('.check:checked').each(function(){
	    	deleteTrade.push($(this).val());
	    });
		if( result == true ){
			location.href="/admin/trade/delete?tradeNo="+deleteTrade;
		} else {
			return false;
		}
	})
	
	$("#btnSearch").click(function() {
		
		var target = getParameterByName("target")
		
		console.log(target)
		
		if(!target) {
			location.href="/admin/trade/list?search="+$("#search").val();
		} else {
			location.href="/admin/trade/list?search="+$("#search").val()+"&target="+target;
		}
		
	});
	
	$("#search").keypress(function(event){
	     if ( event.which == 13 ) {
	         $("#btnSearch").click();
	         return false;
	     }
	});

})

function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

</script>

<style type="text/css">

table {
	text-align: center;
	margin: auto;
	margin-top: 10px;
}

th, td {
	text-align: center;
}

label {
	font-weight: normal !important;
}

li.active>a {
	background-color: #5b6e7a !important;
}

.title {
	margin: 50px 0 30px 0;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
	<div class="container">
		<div class="title">
			<h1><a href="/admin/trade/list" style="color: #000;">오이장터 목록</a></h1>
		</div>
			
		<span class="pull-left">
			총 ${paging.totalCount }개
		</span>
		<select onchange="if(this.value) location.href=(this.value);" style="margin-left: 585px; height: 33px;">
		    <c:if test="${param.target ne 0 and param.target ne 1}">
			    <option value="/admin/trade/list?search=${param.search }" >전체보기</option>
			    <option value="/admin/trade/list?search=${param.search }&target=0" >팝니다</option>
			    <option value="/admin/trade/list?search=${param.search }&target=1" >삽니다</option>
		    </c:if>
		    <c:if test="${param.target eq 0 }">
			    <option value="/admin/trade/list?search=${param.search }" >전체보기</option>
			    <option selected="selected" value="/admin/trade/list?search=${param.search }&target=0" >팝니다</option>
			    <option value="/admin/trade/list?search=${param.search }&target=1" >삽니다</option>
		    </c:if>
		    <c:if test="${param.target eq 1 }">
			    <option value="/admin/trade/list?search=${param.search }" >전체보기</option>
			    <option value="/admin/trade/list?search=${param.search }&target=0" >팝니다</option>
			    <option selected="selected" value="/admin/trade/list?search=${param.search }&target=1" >삽니다</option>
		    </c:if>
		</select>
		
		<div class="pull-right" style="width: 300px; margin: 0 auto;">
			<input class="form-control pull-left" type="text" id="search" name="search" value="${param.search }" style="width: 80%;"/>
			<button id="btnSearch" class="pull-right btn">검색</button>
		</div>
		
		<div class="clearfix"></div>
		<table class="table table-hover table-condensed">
			<tr>
				<th><input type="checkbox" name="select" id="selectAll" /></th>
				<th>후기글 번호</th>
				<th>카테고리</th>
				<th width="45%">제목</th>
				<th>닉네임</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			
			<c:forEach items="${tradeList }" var="trade">
			<tr>
				<td><input type="checkbox" name="select" id="${trade.TRADE_NO }" value="${trade.TRADE_NO }" class="check" /></td>
				<td><label for="${trade.TRADE_NO }">${trade.TRADE_NO }</label></td>
				<td>
					<c:if test="${trade.TRADE_CATEGORY eq 0 }">
						[팝니다]
					</c:if>
					<c:if test="${trade.TRADE_CATEGORY eq 1 }">
						[삽니다]
					</c:if>
				</td>
				<td style="text-align: left;">
					<label for="${trade.TRADE_NO }">
						<a href="/admin/trade/detail?tradeNo=${trade.TRADE_NO  }">${trade.TRADE_TITLE }</a>
					</label>
				</td>
				
				<c:if test="${trade.USER_NICK eq null }">
					<td>
						탈퇴한 회원
					</td>
				</c:if>
				<c:if test="${trade.USER_NICK ne null }">
					<td>
						<label for="${trade.TRADE_NO }">${trade.USER_NICK }</label>
					</td>
				</c:if>
				<td><label for="${trade.USER_NO }">${trade.TRADE_HIT }</label></td>
				<td><fmt:formatDate value="${trade.TRADE_DATE }" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
		</table>
		
		<button id="btnDelete" class="pull-left btn">삭제</button>
		
		<div class="clearfix"></div>
		
		<c:import url="/WEB-INF/views/admin/trade/paging.jsp" />
		
	</div> <!-- .container end -->
</div> <!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
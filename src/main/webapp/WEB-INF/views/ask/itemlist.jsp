<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th, td {
	text-align: left;
}

td:nth-child(2) {
	text-align: left;
}

.ellipsis2 {
 	display: -webkit-box;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
/* 	line-height: 24px; */
/* 	max-height: 1.2em; */
	word-wrap: break-word;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	width: 162px;
}

#photoList {
	display: flex;
	margin: 0px;
	padding: 0px;
/* 	justify-content: space-between; */
	flex-wrap: wrap;
	width: 100%;
	margin-top: 50px;
	
}

#photoList li {
    margin-right: 15px;
    display: inline-block;
    width: 296px;
    margin-bottom: 35px;
    border-radius: 1px;
    overflow: hidden;
    box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
}

#photoList li:nth-child(3n+0) {

  margin-right: 0;

} 

</style>

<!-- <div> -->
<!-- <div id="ajaxArea"> -->
<div class="listTable">
	<ul id="photoList">
		<c:forEach items="${list}" var="list">
			<li>
				<div style="width: 100%; height: 250px;">
					<a href="/ask/detail?askNo=${list.ASK_NO}">
						<img style="height: 100%;" alt="#" src="/upload/${list.FILE_STORED}">
					</a>
				</div>
				<div style="border: 1px solid #ccc; border-top: none; box-sizing: border-box; padding: 0 5px 10px; ">
					<div style="padding-top: 8px; display:flex; align-items: flex-start; justify-content: space-between;">
							<span class="ellipsis2" style="text-align: left;">제목: ${list.ASK_TITLE}</span>
							<span class="">조회수: ${list.ASK_HIT}</span>
					</div>
		
					<div style="display:flex; align-items: flex-start; justify-content: space-between;">
						<span>작성자: 
							<img alt="#" src="${list.GRADE_URL}" style="width: 20px;">${list.USER_NICK}</span> 
						<span>작성일: <fmt:formatDate value="${list.ASK_DATE}" pattern="yy-MM-dd" /></span>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	
	<div class="form-inline text-center">
		<input class="form-control" type="text" id="search" value="${param.search }" />
		<button id="btnSearch" class="btn btnSearch">검색</button>
	</div>
	<c:import url="/WEB-INF/views/review/paging.jsp" />
</div>	
<!-- 	</div>.container -->
<!-- </div>.wrap end -->
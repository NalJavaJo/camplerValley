<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs/cs.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
.bar-notice {color: black !important;}
</style>
			
<h5 class="cs-header text-center">공지사항</h5>

<div class="notice-wrap" style="width: 85%; float:none; margin:0 auto">
	
	<div class="cs-bar float-left">
		<a href="${pageContext.request.contextPath}/cs/noticeList" class="bar-notice">공지사항</a>
		<a href="${pageContext.request.contextPath}/cs/faq" class="bar-faq">자주 묻는 질문</a>
	</div>

	
		<div class="search-group float-right">
			<input class="input-search" type="text" placeholder="검색어를 입력하세요.">
			<button class="btn-search" type="button">
				<i class="fa fa-search"></i>
			</button>
		</div>
	



<div class="container h-60" id="tb-notice" style="padding: 0px;">
	<table class="table text-center">
		<thead>
			<tr>
				<th class="col-md-1">No.</th>
				<th>제목</th>
				<th class="col-md-2">날짜</th>
				<th class="col-md-1">조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>01</td>
				<td><a href="${pageContext.request.contextPath}/cs/noticeDetail">공지사항</a></td>
				<td>2022-06-08</td>
				<td>0</td>
			</tr>
			<tr>
				<td>01</td>
				<td><a href="${pageContext.request.contextPath}/cs/noticeDetail">공지사항</a></td>
				<td>2022-06-08</td>
				<td>0</td>
			</tr>
			<tr>
				<td>01</td>
				<td><a href="${pageContext.request.contextPath}/cs/noticeDetail">공지사항</a></td>
				<td>2022-06-08</td>
				<td>0</td>
			</tr>
			<tr>
				<td>01</td>
				<td><a href="${pageContext.request.contextPath}/cs/noticeDetail">공지사항</a></td>
				<td>2022-06-08</td>
				<td>0</td>
			</tr>
			<tr>
				<td>01</td>
				<td><a href="${pageContext.request.contextPath}/cs/noticeDetail">공지사항</a></td>
				<td>2022-06-08</td>
				<td>0</td>
			</tr>
			
			
		</tbody>
	</table>
	<button type="button" class="btn btn-primary btn-sm float-right" id="btn-nt-enroll" onclick="location.href='${pageContext.request.contextPath}/cs/noticeEnroll';">글등록</button>
</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
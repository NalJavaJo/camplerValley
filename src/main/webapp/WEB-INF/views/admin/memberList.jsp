<%@page import="org.springframework.security.core.authority.SimpleGrantedAuthority"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.campervalley.member.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css" />
<link href="/path/to/bootstrap.min.css" rel="stylesheet">
<link href="dist/css/component-custom-switch.css" rel="stylesheet">
<style>
.col-form-label {
	width: 80px;
	margin-left: 100px;
	}
.toggle-btn {
  width: 40px;
  height: 21px;
  background: grey;
  border-radius: 50px;
  padding: 3px;
  cursor: pointer;
  -webkit-transition: all 0.3s 0.1s ease-in-out;
  -moz-transition: all 0.3s 0.1s ease-in-out;
  -o-transition: all 0.3s 0.1s ease-in-out;
  transition: all 0.3s 0.1s ease-in-out;
}

.toggle-btn > .inner-circle {
  width: 15px;
  height: 15px;
  background: #fff;
  border-radius: 50%;
  -webkit-transition: all 0.3s 0.1s ease-in-out;
  -moz-transition: all 0.3s 0.1s ease-in-out;
  -o-transition: all 0.3s 0.1s ease-in-out;
  transition: all 0.3s 0.1s ease-in-out;
}

.toggle-btn.active {
  background: #639A67 !important;
}

.toggle-btn.active > .inner-circle {
  margin-left: 19px;
}

</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="container" style="display: flex;" id="admin-container">
	<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />
	<div class="admin-content" style="width: 80%;">
		<h5 class="admin-hd">회원 관리</h5>
		<div class="search-box" style="display: flex;">
			<input class="ad-input-search" type="text" placeholder="전체 사용자 검색">
			<button class="ad-btn-search" type="button">
				<i class="fa fa-search"></i>
			</button>
		</div>
		<table class="table table-hover text-center" id="tb-admin">
			<thead>
				<tr>
					<th>권한</th>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>회원가입일</th>
					<th>상태</th>
					<th class="col-sm-1"></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="list" varStatus="vs">
				<tr data-member-id="${list.memberId}" data-name="${list.name}" data-nickname="${list.nickname}" data-email="${list.email}" data-tel="${list.tel}" data-authorities="${list.authorities}">
					<td>${list.authorities}</td>
					<td>${list.memberId}</td>
					<td>${list.name}</td>
					<td>${list.nickname}</td>
					<td>${list.email}</td>
					<td>
						<fmt:parseDate value="${list.enrollDate}" pattern="yyyy-MM-dd'T'HH:mm" var="enrollDate"/>
						<fmt:formatDate value="${enrollDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>블랙</td>
					<td style="padding: 6px;">
						<button type="button" class="btn btn-outline-camper-color btn-sm btn-update" name="btn-update" data-toggle="modal" data-target="#adminMemberModal" value="">
							수정</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!-- 모달창 -->
<div class="modal fade" id="adminMemberModal" tabindex="-1" role="dialog" aria-labelledby="#adminMemberModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
	<div class="modal-content">
	  <div class="modal-header">
		<h5 class="modal-title" id="adminMemberModalLabel">회원정보</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		  <span aria-hidden="true" style="color:#fff">&times;</span>
		</button>
	  </div>
		<form:form name="adminMemberUpdateFrm" method="post" action="${pageContext.request.contextPath}/admin/memberUpdate">
	  <div class="modal-body pb-1">
			<div class="form-group mt-4">
			  <label for="memberId" class="col-form-label">아이디</label>
			  <input type="text" class="input-member pt-1 pb-1 pl-2" name="memberId" id="memberId" value="" readonly>
			</div>
			<div class="form-group">
			  <label for="name" class="col-form-label">이름</label>
			  <input type="text" class="input-member pt-1 pb-1 pl-2" name="name" id="name" value=""></input>
			</div>
			<div class="form-group">
			  <label for="nickname" class="col-form-label">닉네임</label>
			  <input type="text" class="input-member pt-1 pb-1 pl-2" name="nickname" id="nickname" value=""></input>
			</div>
			<div class="form-group">
			  <label for="email" class="col-form-label">이메일</label>
			  <input type="text" class="input-member pt-1 pb-1 pl-2" name="email" id="email" value=""></input>
			</div>
			<div class="form-group">
			  <label for="tel" class="col-form-label">전화번호</label>
			  <input type="text" class="input-member pt-1 pb-1 pl-2" name="tel" id="tel" value=""></input>
			</div>
			  <div class="form-group">
						<label for="role" class="col-form-label">권한</label>
						<input type="checkbox" name="authorities" id="user" value=""/>
						<label for="user">일반</label>
						&nbsp;
						<input type="checkbox" name="authorities" id="admin" value=""/>
						<label for="admin">관리자</label>
		  </div>	
			<div class="form-group">
			  <p class="form-check form-check-inline mr-4 ml-6" style="margin-left: 100px;">블랙리스트</p>
			  
			  <div class="form-check form-check-inline" style="top: -15px;">
					   <div class="custom-control custom-switch">
					    <input type="checkbox" class="custom-control-input" id="switch1">
					    <label class="custom-control-label" for="switch1"></label>
					  </div>
				</div> 
			</div>
			
		</div>
		

	  <div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		<button type="submit" class="btn btn-primary btn-member-update" id="modalSubmit">수정</button>
	  </div>
	</div>
		  </form:form>
  </div>
</div>
<script>
$(document).ready(function(){

	$('.toggle-btn').click(function() {
	$(this).toggleClass('active').siblings().removeClass('active');
	});

	});
	
document.querySelectorAll(".btn-update").forEach((btn) => {
	btn.addEventListener('click', (e) => {
		console.log(e.target);
		const tr = e.target.parentElement.parentElement;
		console.log(tr);

		const memberId = tr.dataset.memberId;
		const name = tr.dataset.name;		
		const nickname = tr.dataset.nickname;
		console.log(nickname);
		const email = tr.dataset.email;
		const tel = tr.dataset.tel;
		
		const authorities = tr.dataset.authorities;

		
	        
		document.querySelector("#memberId").value = memberId;
		document.querySelector("#name").value = name;
		document.querySelector("#nickname").value = nickname;
		document.querySelector("#email").value = email;
		document.querySelector("#tel").value = tel;
		
	});
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
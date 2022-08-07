<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trade review update</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<!-- 사용자작성 css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tradereview/reviewUpdate.css" />
	<!-- font awesome -->
	<spring:eval var="fontawesomeKey" expression="@customProperties['api.fontawesome']" />
	<script src="https://kit.fontawesome.com/${fontawesomeKey}.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="modal fade" id="reviewUpdate">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content px-5 py-2">
				<div class="modal-header">
					<div>
						<div class="text-20">거래후기</div>
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="" name="camperUpdateFrm" method="POST">
					<div class="modal-body">
						<div class="text-13 text-secondary">&#183; 작성하신 후기는 다른 회원들에게 공개됩니다.</div>
						<div class="text-13 text-secondary">&#183; 개인정보 및 광고, 비속어가 포함된 내용의 후기는 신고의 대상이 될 수 있습니다.</div>
						<table class="mt-3">
							<tbody>
								<tr>
									<td class="label col-md-2 px-0 py-2">
										<div id="starscore">별점</div>
									</td>
									<td class="col-md-10 px-0 py-2">
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star pr-2"></i>
										<span>5점</span>
									</td>
								</tr>
								<tr>
									<td class="label col-md-2 px-0 py-2">
										<label for="content">내용</label>
									</td>
									<td class="col-md-10 px-0 py-2">
										<textarea class="p-2" name="content" cols="100" rows="5" style="width:100%">내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
                    <div class="modal-footer justify-content-center">
						<div>
							<button type="submit" class="btn btn-outline-camper-color px-4 m-2">수정</button>
							<button type="button" class="btn btn-outline-camper-color px-4 my-2">삭제</button>
						</div>
	                </div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$("#reviewUpdate")
	.modal()
	.on('hide.bs.modal', (e) => {
	});
</script>
</html>
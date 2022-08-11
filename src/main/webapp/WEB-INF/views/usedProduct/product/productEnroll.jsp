<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- ajaxForm -->
<script defer src="${pageContext.request.contextPath}/resources/js/usedProduct/jquery.form.js"></script>
<!-- 다음 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음 지도좌표 API -->
<spring:eval var="kakaoLocation" expression="@customProperties['api.kakaoLocation']" />
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoLocation}&libraries=services"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/productForm.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/sidebar.css"/>

<div id="section" style="width: 81%; margin:50px auto">
	<form id="enrollForm" >
		<div class="enrollWrap">
			<!--------- enrollBody  --------->
			<div class="enrollBody">
				<main id="enrollMain">
				
					<!-- section -->
					<section class="section">
						<h2>기본정보<span>*필수항목</span></h2>
						
						<ul class="listBody">
							<li class="list">
								<div class="image_sub">상품이미지<span>*</span><br /><small>(최대 5장)</small></div>
								<div class="image_con">
									<ul class="image-ul" id="image-ul">
										<li class="image-li">이미지 등록
											<input type="file" id="input-image">
										</li>
									</ul>
									<div class="div-image" id="div-image">
												상품 사진을 등록해주세요.</div>
									<div class="add_description" style="">
										<b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b><br>
										- 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.<br>
										- 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다.<br>
										- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br>
										- 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br>
									</div>
								</div>
							</li><!-- 상품이미지 -->
								
								
							<li class="list">
								<div class="subject_sub">제목<span>*</span></div>
								<div class="subject_con">
									<div class="contentDiv">
										<div class="subjectBox">
											<input type="text" placeholder="상품 제목을 입력해주세요." class="input-subject" id="input-subject" name="input-subject">
										</div>
										<div class="subjectSize"><span>최대 30자</span></div>
									</div>
									<div class="div-subject" id="div-subject">상품명을 2자 이상 입력해주세요.</div>
								</div>
							</li><!-- 제목 -->
								
								
							<li class="list">
								<div class="category_sub">카테고리<span>*</span></div>
								<div class="category_con" style="margin-left: -40px;">
									<div class="contentDiv">
										<div class="categoryStep">
											<ul class="categories" id="large_categories">
												<li class="category"><button type="button" class="cate_btn" id="100">텐트/타프</button></li>
												<li class="category"><button type="button" class="cate_btn" id="200">침낭/매트</button></li>
												<li class="category"><button type="button" class="cate_btn" id="300">테이블/의자</button></li>
												<li class="category"><button type="button" class="cate_btn" id="400">조명기구</button></li>
												<li class="category"><button type="button" class="cate_btn" id="500">주방용품</button></li>
												<li class="category"><button type="button" class="cate_btn" id="600">화로/버너/BBQ</button></li>
												<li class="category"><button type="button" class="cate_btn" id="700">안전/위생용품</button></li>
												<li class="category"><button type="button" class="cate_btn" id="800">전기/전자제품</button></li>
												<li class="category"><button type="button" class="cate_btn" id="900">캠핑카/카라반/용품</button></li>
												<li class="category"><button type="button" class="cate_btn" id="1000">루프탑/트레일러</button></li>
												<li class="category"><button type="button" class="cate_btn" id="1100">차박용품</button></li>
												<li class="category"><button type="button" class="cate_btn" id="1200">의류/수납용품</button></li>
												<li class="category"><button type="button" class="cate_btn" id="1300">겨울용품</button></li>
												<li class="category"><button type="button" class="cate_btn" id="1400">기타캠핑용품</button></li>
												<li class="category"><button type="button" class="cate_btn" id="1500">기타생활용품</button></li>
											</ul>
										</div>
									</div>
									<div class="div-category" id="div-category">카테고리를 선택해주세요.</div>
									
									<h3 class="selectedCategory">선택한 카테고리 : <b id="selectedCategory" name="cate_code"></b></h3>
								</div>
							</li><!-- 카테고리 -->
							
							<li class="list">
								<div class="location_sub">거래지역<span>*</span></div>
								<div class="location_con">
									<div class="contentDiv">
										<button type="button" id="search_address">주소 검색</button>
									</div>
									<input placeholder="거래할 지역을 입력해주세요." class="input-location" id="input-location" name="input-location">
									<div class="div-location" id="div-location">거래지역을 선택해주세요.</div>
									<div class="add_description" style="margin-left: 0px;">
										<b>* 주소 검색 후 구매자에게 알려주고 싶은 주소 범위까지만 나타나도록 주소를 수정해주세요.</b><br>
										ex) 서울특별시 서초구 서초동 1303-34 → 서울특별시 서초구 서초동
									</div>
									<div id="map"></div>
								</div>
							</li><!-- 거래지역 -->
						
							<li class="list">
								<div class="price_sub">가격<span>*</span></div>
								<div class="price_con">
									<div class="priceBox">
										<input type="text" placeholder="숫자만 입력해주세요." class="input-price" id="input-price" name="input-price">원
									</div>
		
									<!-- 배송비 포함 여부 -->
									<div class="deliveryArea">
										<div class="deliveryBox">
											<label for="freeDelivery" class="freeDelivery">
												<input id="freeDelivery" type="checkbox">배송비 포함
											</label>
									</div>
									</div>
									<div class="div-price" id="div-price">0원 이상 입력해주세요. (무료 나눔 시 0원으로 설정해주세요)</div>
								</div>
							</li><!-- 가격 -->
							
							
							<li class="list">
								<div class="instruction_sub">설명</div>
								<div class="instruction_con">
									<textarea placeholder="상품 설명을 입력해주세요." rows="6" class="instruction" id="product_content" name="product_content"></textarea>
									<div class="limit">최대 1000자</div>
								</div>
							</li><!-- 설명 -->					
						</ul>
					</section>
				</main>
			</div>
						
						
			<footer class="enrollBtm">
				<div class="btmArea">
					<button type="submit" class="enrollBtn" id="enrollBtn">등록하기</button>
				</div>
			</footer>
		</div>
	</form>
	<div id="nav">
		<jsp:include page="/WEB-INF/views/usedProduct/main/sidebar.jsp"/>
	</div>
</div>

<script>
$('#enrollForm').ready(function() {
	 $('#div-image').hide();
	 $('#div-subject').hide();
	 $('#div-category').hide();
	 $('#div-price').hide();
	 $('#div-location').hide();
});

/* 이미지 등록 (미리보기) */
$('#input-image').on('change', readImage); // 파일 올릴떄마다 readImage함수 호출
const fileBuffer = []; // 파일 저장 변수

function readImage() {
	const limitSize = 10 * 1024 * 1024; // 이미지 사이즈 설정
	const input = this;
	
	if(input.files && input.files[0]) { // 첫번째 선택파일이 있을 경우
		var reader = new FileReader();
		
		// 이미지 갯수(5개)까지
		if($('.registImages').length + input.files.length > 5) {
			alert ('사진은 최대 5장까지 등록 가능합니다.');
			return false;
		}
		var index = 0;
		
		reader.onload = function(e) {
			// 이미지 사이즈 제한
			const imageSize = input.files[index].size;
			if(imageSize > limitSize) {
				alert('이미지 사이즈는 10MB까지 등록 가능합니다.');
				return false;
			}
			const image = input.files[index];
			
			// 이미지 유효성 검사
			const fileEx = image.name.slice(image.name.lastIndexOf(".")+1).toLowerCase();
			if(fileEx != "jpg" && fileEx != "png" && fileEx != "gif" && fileEx != "bmp" && fileEx != "jpeg") {
				alert('파일은 이미지 파일만 등록할 수 있습니다.');
				return false;
			}
			
			fileBuffer.push(image); // push
			
			// 이미지 태그 생성
			const $li = $('<li></li>').addClass('registImages');
			const $div = $('<div></div>').addClass('regist-div');
			const $img = $('<img/>').attr({'src':this.result, alt: '상품이미지'});
			const $button = $('<button></button>');
			
			// 첫번째로 등록한 이미지를 대표이미지로 설정
			if($('.registImages').length == 0) {
				index = 0;
				$div.addClass('rep_image').text('대표이미지');
			}
			
			// ul 태그 아래 붙임
			$('.image-ul').append($li); 
			$li.append($div, $img, $button); // li태그 아래 세개 태그 붙암
			
			// 삭제 버튼 클릭
			$button.attr('type', 'button').addClass('image_delete_btn').click(deleteImage);

			// 한번에 이미지 여러개 첨부
			if(index < input.files.length - 1) {
				reader.readAsDataURL(input.files[++index]);
			}
		}
		// 이미지 > URL로 표현
		reader.readAsDataURL(input.files[index]);
	}
}

// 이미지 삭제 
function deleteImage() {
	// 배열에 있는 파일 제거
	// closest() - 자신부터 부모 요소 단위로 출발하여 각 요소가 지정한 선택자에 만족할 때까지 탐색
	const fileIndex = $(this).closest('li').index();
	fileBuffer.splice(fileIndex - 1, 1);
	
	// 대표이미지 삭제 -> 다음 이미지를 대표로 지정
	if($(this).closest('li').children('div').hasClass('rep_image')) {
		const $next = $(this).closest('li').next().find('div').addClass('rep_image').text('대표이미지');		
	}
	// 요소제거
	$(this).closest('li').remove();
}


/* 제목 */
 
 
/* 카테고리 */
var cate_no = null;
var cate_name = null;
$('.category >.cate_btn').on("click", function(){
	
	//클릭한 카테고리의 id값 가져오기
	cate_no = $(this).attr("id");
	cate_name = $(this).text();
	
	//선택된 리스트에 색깔 적용
	$('.category > .cate_btn').removeClass('selectedList');
	$('#'+cate_no).addClass('selectedList');
	
	// 카테고리 이름 넣기
	$('#selectedCategory').text(cate_name);

});


/* 거래지역 */
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
       mapOption = {
           center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
           level: 5 // 지도의 확대 레벨
       };

   //지도를 미리 생성
   var map = new daum.maps.Map(mapContainer, mapOption);
   //주소-좌표 변환 객체를 생성
   var geocoder = new daum.maps.services.Geocoder();
   //마커를 미리 생성
   var marker = new daum.maps.Marker({
       position: new daum.maps.LatLng(37.537187, 127.005476),
       map: map
   });


$('#search_address').click(function() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("input-location").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
});

/* 가격 */
$('.input-price').on('keyup', function(e) {
   const val = $(this).val();
   if(!(/^[0-9]$/g.test(val))) { // 숫자만 입력되지 않았다면
      $(this).val(val.replace(/[^0-9]/g, '')); // 숫자 제외한 문자 공백으로 대체
   }
});

/* 등록하기 */
$('#enrollBtn').click(function() {
	 
	 // 필수 입력값 입력하지 않았을 경우 
	 // true면 제출X
	 if(confirm()) return false;
	 
	 enrollAction.call(this);
	
	 function confirm() {
		 if(!fileBuffer.length) { $('#div-image').show(); $('#input-image').focus(); return true;}
		 else if($('#input-subject').val()=='') {$('#div-subject').show(); $('#input-subject').focus(); return true;}
		 else if(cate_no == null) { $('#div-category').show(); $('#categories').focus(); return true;}
		 if($('#input-location').val()=='') { $('#div-location').show(); $('#input-location').focus(); return true;}
		 if($('#input-price').val()=='') { $('#div-price').show(); $('#input-price').focus(); return true;}
	 }
	 
	 var token = $("meta[name='_csrf']").attr("content");
	 var header = $("meta[name='_csrf_header']").attr("content");
	 $(document).ajaxSend(function(e, xhr, options) {
	     xhr.setRequestHeader(header, token);
	 });

	 // 동적 파일 업로드를 위한 ajaxForm 
	 function enrollAction() {
		$('#enrollForm').ajaxForm({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false, // 데이터 컨텐트 타입에 맞게 변환 여부
			contentType: false, // 요청 컨텐트 타입
			url: "${pageContext.request.contextPath}/usedProduct/product/productEnroll",
			dataType: 'json',
			beforeSubmit: function(data, form, option) { // submit 전 실행
				// 이미지 정보 동적 할당
				fileBuffer.forEach(function(e, i) {
					const imgObj = {
							name : 'img',
							id : 'productImg'+i,
							type : 'file',
							value : e
					}
					data.push(imgObj);
				});
			
				// 카테고리 
				const cateObj = {
					name : 'cate_no',
					value : cate_no
				}
				data.push(cateObj);
				
				// 배송비 
				const deliveryFeeObj = {
					name : 'productDeliveryFee',
					value : $('#freeDelivery').prop('checked') ? 1 : 0
				} 
				data.push(deliveryFeeObj);
			},
			success: function(data) {
				alert('상품이 등록되었습니다.');
				location.href="${pageContext.request.contextPath}/usedProduct/product/productDetail?no"+data.no;
			},
			error: function(error) {
				console.log('error : ', error);
			}
	 
		});
	 }
		 
 });
 
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세정보</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	font-family: "Noto Sans KR", sans-serif;
	background: #f0f4f8;
	margin: 0;
	padding: 0;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

header {
	background: linear-gradient(135deg, #4a90e2 0%, #d0e2ff 100%);
	color: black;
	padding: 20px 0;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

#mainText {
	font-size: 2.5rem;
	margin-bottom: 10px;
	color: white;
}

.navbar {
	background: rgba(0, 0, 0, 0.8);
}

.navbar-nav .nav-link {
	font-size: 1.15rem;
	font-weight: 600;
	margin: 0 15px;
	color: white;
	transition: color 0.3s;
}

.navbar-nav .nav-link:hover {
	color: #c3cfe2;
}

.btn-outline-light {
	border: 2px solid #fff;
	color: #fff;
	font-weight: 600;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.btn-outline-light:hover {
	background-color: #fff;
	color: #000;
}

.auth-buttons {
	position: absolute;
	top: 20px;
	right: 20px;
}

footer {
	background-color: #000;
	color: white;
	padding: 20px 0;
	margin-top: auto;
	width: 100%;
	box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.2);
}

footer a {
	color: #fff;
	transition: color 0.3s;
}

footer a:hover {
	color: #c3cfe2;
}
</style>

<style>
body {
	background-color: #f8f9fa; /* 배경색 추가 */
}

#container {
	width: 80%; /* 컨테이너 너비 설정 */
	margin: 0 auto; /* 중앙 정렬 */
	background: white; /* 배경 흰색 */
	padding: 20px; /* 내부 여백 */
	border-radius: 10px; /* 모서리 둥글게 */
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}

h2 {
	margin-bottom: 20px; /* 제목 아래 여백 추가 */
}

#map {
	width: 100%;
	height: 350px; /* 지도 높이 */
	border-radius: 10px; /* 지도의 모서리 둥글게 */
	border: 2px solid #ddd; /* 지도 테두리 */
	margin-top: 20px; /* 지도 상단 여백 */
}
/* 테이블 스타일 */
table.table-bordered {
	table-layout: fixed; /* 고정된 레이아웃으로 셀 너비 고정 */
	border-collapse: separate; /* 셀 간격을 두고 테이블을 둥글게 만듦 */
	border-radius: 10px; /* 테이블의 모서리 둥글게 */
	border-spacing: 0; /* 셀 간의 간격 제거 */
	overflow: hidden; /* 둥근 모서리가 셀에 영향을 주도록 처리 */
	width: 100%; /* 테이블의 너비를 고정 */
}

table.table-bordered th, table.table-bordered td {
	border: 1px solid #ddd; /* 셀 테두리 */
	padding: 10px; /* 셀 패딩 추가 */
	text-align: left; /* 셀 텍스트 왼쪽 정렬 */
}
/* 버튼 둥글게 만들기 */
.btn-rounded {
	border-radius: 25px; /* 버튼 둥글게 */
}

.btn-container a {
	width: 150px; /* 버튼의 너비 설정 */
	text-align: center; /* 텍스트 중앙 정렬 */
}
</style>
<script
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8e416858dbb7b162db0be796def5e4fc&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/review.js"></script>
<script src="/js/myPage.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	let searchParams = new URLSearchParams(window.location.search);
	let tour_code = searchParams.get('tour_code');
	console.log(tour_code);
	
	let review = reviewService();
	let me = myPageService();
	
	function listCallback(result) {
    	let htmls = "";

        if (result.length < 1) {
            htmls += "등록된 리뷰가 없습니다.";
        } else {
            $(result).each(function() {
                htmls += '<div>';
                htmls += "<h4>" + this.name + "</h4>";
                htmls += "<p>" + this.content + "</p>";
                htmls += "<p>" + this.create_date + "</p>";
                htmls += '<hr>';
                htmls += '</div>';
            });
        }

        $('#reviewList').append(htmls);
    }
	
	me.myPageList(function(result) {
        let name = result.members.id; // 로그인한 사용자의 ID
        console.log("로그인한 사용자 ID:", name);

        // 폼 제출 이벤트 리스너 설정
        $("#reviewForm").submit(function(event) {
            // 기본 폼 제출 방지
            event.preventDefault();

            // textarea 내용 가져오기
            let content = $("#content").val();

            // 데이터 객체 생성
            let reviewData = {
            	name: name,
                content: content,
                market_tour_code: tour_code
            };

            // write 함수를 호출하여 리뷰 작성
            review.write(reviewData);
        });
    });
	
    review.reviewList(tour_code, listCallback);
});    
</script>
</head>
<body>
	<div class="header-nav-container">
		<header>
			<div class="container position-relative">
				<div
					class="d-flex flex-column justify-content-center align-items-center">
					<h1 id="mainText">전통시장 관광지 검색 사이트</h1>
				</div>

				<div class="auth-buttons">
					<span>환영합니다</span> <a class="btn btn-outline-light me-2"
						href="/logout">로그아웃</a>
				</div>
			</div>
		</header>

		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-center"
					id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="/main.html"><i class="fas fa-home"></i> 홈</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/market/market"><i class="fas fa-shopping-basket"></i>
								시장정보찾기</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/usertour/userlist"><i class="fas fa-map-signs"></i>
								관광지정보찾기</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/userNoticeBoardList.html"><i class="fas fa-bell"></i>
								공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="/myInfo.html"><i
								class="fas fa-user"></i> 마이페이지</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div id="container" class="container mt-5">
		<h2 class="text-center">상세정보</h2>
		<!-- 상세정보 테이블 -->
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th class="tour_name name-cell">관광지명</th>
					<td colspan="3">${usertour.tour_name}</td>
				</tr>
				<tr>
					<th class="tour_address">주소</th>
					<td>${usertour.tour_address}</td>
					<th>전화번호</th>
					<td class="tour_telno">${usertour.tour_telno}</td>
				</tr>
				<tr>
					<th>설명</th>
					<td colspan="3">${usertour.tour_cmmt}</td>
				</tr>
				<tr>
					<th class="custom-capacity-cell">인원</th>
					<td>${usertour.custom_cnt}명</td>
					<th class="parking-cell">주차</th>
					<td>${usertour.car_cnt}대</td>
				</tr>
			</tbody>
		</table>
		<div id="map"></div>
		<!-- 지도 영역 -->
		
		<div>
			<h1 class="mt-3">리뷰쓰기</h1>
			<form id="reviewForm" method="post" class="mt-4 form-container">
	            <div class="form-group mt-3">
	                <textarea class="form-control" id="content" name="content" rows="4"></textarea>
	            </div>
	            <div class="text-center">
	                <input type="submit" class="btn btn-primary btn-rounded mt-3" value="리뷰작성"/>
	            </div>
	        </form>
		</div>
		<div id="reviewList"></div>
		
		<!-- 목록 버튼과 상세조회 버튼을 옆에 배치 -->
		<div class="btn-container text-center mt-3">
			<a class="btn btn-secondary btn-rounded"
				href="${pageContext.request.contextPath}/usertour/userlist">목록</a>
		</div>
	</div>

	<script>
        var mapContainer = document.getElementById('map'), 
            mapOption = { 
                center: new kakao.maps.LatLng(37.5665, 126.978), // 초기 중심 좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); 

        var geocoder = new kakao.maps.services.Geocoder();

        var address = "${usertour.tour_address}"; 
        geocoder.addressSearch(address, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                map.setCenter(coords);
            } else {
                alert('주소를 찾을 수 없습니다.');
            }
        });
    </script>
	<footer class="text-center">
		<div class="container">
			<p>&copy; 2024 전통시장. 모든 권리 보유.</p>
			<a href="#terms">이용약관</a> | <a href="#privacy">개인정보 처리방침</a>
		</div>
	</footer>
</body>
</html>

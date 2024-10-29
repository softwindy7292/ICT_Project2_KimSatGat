<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>전통시장 조회</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
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
<style type="text/css">
#header {
	background-color: steelblue;
	color: white;
	text-align: center;
	height: 50px;
	line-height: 50px;
}

form {
	margin: 10px 0;
	text-align: center; /* 중앙 정렬 */
}

form select, form input[type="text"] {
	margin: 0 10px;
	padding: 5px;
}

form input[type="submit"], form input[type="reset"] {
	margin-left: 10px;
	padding: 5px 10px;
}

thead {
	background-color: steelblue;
	color: white;
	text-align: center;
	height: 20px;
	line-height: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

tr {
	transition: background-color 0.3s;
}

tbody tr:hover {
	background-color: #f1f1f1;
}
</style>

<script type="text/javascript">
	function formCheck() {

		var areaCode = document.getElementById('area_code').value;
		var mrk_open_type = document.getElementById('mrk_open_type').value;
		var market_name = document.getElementById('market_name').value;
		console.log(areaCode)
		console.log(mrk_open_type)
		console.log(market_name)

		// 아무것도 선택안한 경우
		if (market_name == "" && areaCode == "" && mrk_open_type == "") {
			alert("조회하실 시장정보를 입력하세요");
			return false;
		}

		return true;
	}
</script>

<script type="text/javascript">
	function openDetail(marketCode) {
		// 새로운 창을 열어서 상세 페이지를 표시
		var url = "${pageContext.request.contextPath}/market/detail?market_code="
				+ marketCode;
		window.open(url, '_blank', 'width=1000,height=700');
	}
</script>

<script type="text/javascript">
	function goHome() {
		window.location.href = '/main.html';
	}
</script>
<script type="text/javascript">
	function resetFormAndTable() {

		// Clear the table body by setting innerHTML to an empty string
		document.getElementById("result").innerHTML = "";
	}
</script>


<script type="text/javascript">
	function openCreate(marketCode) {
		// 새로운 창을 열어서 상세 페이지를 표시
		var url = "${pageContext.request.contextPath}/market/create";
		window.open(url, '_blank', 'width=500,height=800');
	}
</script>

<script type="text/javascript">
	function openMapWindow(marketCode) {
		var url = "${pageContext.request.contextPath}/market/marketmap?market_code="
				+ marketCode;
		window.open(url, '_blank', 'width=1000,height=700');

	}
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

	<div class="container">
		<div id="header">
			<div
				style="display: flex; align-items: center; justify-content: center; height: 50px;">
				<h1 style="margin: 0; padding-right: 10px;">김삿갓팀 전통시장 안내시스템</h1>
				<div style="display: flex;">
					<button onclick="goHome()">첫화면</button>
				</div>
			</div>
		</div>



		<form id="listForm"
			action="${pageContext.request.contextPath}/market/searchlist"
			onsubmit="return formCheck()" method="get">
			<td>
				<div class="text-center">
					<span>지역구분</span> <select id="area_code" name=area_code>
						<option value="" selected disabled>지역 선택</option>
						<option value="99">전체</option>
						<option value="10">강원도</option>
						<option value="11">경기도</option>
						<option value="12">경상남도</option>
						<option value="13">경상북도</option>
						<option value="14">광주광역시</option>
						<option value="15">대구광역시</option>
						<option value="16">대전광역시</option>
						<option value="17">부산광역시</option>
						<option value="18">서울특별시</option>
						<option value="19">세종특별시</option>
						<option value="20">울산광역시</option>
						<option value="21">인천관역시</option>
						<option value="22">전라남도</option>
						<option value="23">전라북도</option>
						<option value="24">제주특별시</option>
						<option value="25">충청남도</option>
						<option value="26">충청북도</option>
					</select> <span>시장유형</span> <select id="mrk_open_type" name=mrk_open_type>
						<option value="" selected disabled>시장유형선택</option>
						<option value="9">전체</option>
						<option value="1">상설장</option>
						<option value="2">상설+5일장</option>
						<option value="3">5일장</option>
					</select> <span style="font-weight: bold; color: red;">또는</span>&nbsp;&nbsp;</span>
					<span>시장명</span>

					<td><input type="text" id="market_name" name="market_name"></td>
					<input type="submit" value="조회하기"> <input type="button"
						value="지우기" onclick="resetFormAndTable()"> <span
						style="color: blue;">◀◀◀ 시장지역/유형 또는 시장명(우선적용)으로 조회 </span>

				</div>
			</td>
		</form>

		<section>
			<table border="1">
				<thead>
					<tr align="center">

						<td align="center">시장ID</td>
						<td align="center">시장명</td>
						<td align="center">지역</td>
						<td align="center">시장주소</td>
						<td align="center">시장유형</td>
						<td align="center">5일장</td>
						<td align="center">지도보기</td>
						<td align="center">상세정보</td>
					</tr>
				</thead>

				<tbody id="result">
					<c:forEach var="market" items="${marketList}">
						<tr>
							<td align="center">${market.market_code}</td>
							<td align="center">${market.market_name}</td>
							<td align="center">${market.area_name}</td>
							<td align="center">${market.market_address}</td>
							<td align="center">${market.open_type_name}</td>
							<td align="center">${market.mrk_open_date}</td>
							<td align="center"><button
									onclick="openMapWindow('${market.market_code}')">지도</button></td>
							<td align="center"><button
									onclick="openDetail('${market.market_code}')">
									상세보기</a>
								</button></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</section>
	</div>

	<footer class="text-center">
		<div class="container">
			<p>&copy; 2024 전통시장. 모든 권리 보유.</p>
			<a href="#terms">이용약관</a> | <a href="#privacy">개인정보 처리방침</a>
		</div>
	</footer>
</body>
</html>

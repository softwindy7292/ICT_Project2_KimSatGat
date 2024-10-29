<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>게시물 삭제</title>
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
					<span>환영합니다</span>
					<a class="btn btn-outline-light me-2" href="/logout">로그아웃</a>
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
							href="/adminMain.html"><i class="fas fa-home"></i>
								홈</a></li>
						<li class="nav-item"><a class="nav-link" href="/market/mngmarket"><i
								class="fas fa-shopping-basket"></i> 시장정보관리</a></li>
						<li class="nav-item"><a class="nav-link" href="/tour/list"><i
								class="fas fa-map-signs"></i> 관광지정보관리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/noticeBoardList.html"><i
								class="fas fa-bell"></i> 공지사항관리</a></li>
						<li class="nav-item"><a class="nav-link" href="/memberCrud.html"><i
								class="fas fa-user"></i> 유저관리</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	
	<h2>게시물 삭제</h2>

	<p>삭제하시겠습니까?</p>
	<form action="${pageContext.request.contextPath}/tour/delete"
		method="post">
		<input type="hidden" name="tour_code" value="${tour.tour_code}">
		<p>투어 이름: ${tour.tour_name}</p>
		<p>투어 주소: ${tour.tour_address}</p>
		<input type="submit" value="삭제">
	</form>
	<a href="${pageContext.request.contextPath}/tour/list">목록</a>
	
	<footer class="text-center">
		<div class="container">
			<p>&copy; 2024 전통시장. 모든 권리 보유.</p>
			<a href="#terms">이용약관</a> | <a href="#privacy">개인정보 처리방침</a>
		</div>
	</footer>
</body>
</html>

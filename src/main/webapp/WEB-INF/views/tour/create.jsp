<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관광지 등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
        .form-container {
            width: 60%;
            padding: 20px;
            border-radius: 10px; /* 모서리 둥글게 */
            border: 1px solid #ddd; /* 테두리 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }

        .code-cell {
            width: 80px; /* 코드 셀의 너비를 줄임 */
        }
        .name-cell {
            width: 150px; /* 관광지명 셀의 너비를 줄임 */
        }

        /* 버튼 둥글게 만들기 */
        .btn-rounded {
            border-radius: 25px; /* 버튼 둥글게 */
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

    <div class="container d-flex align-items-center justify-content-center" style="height: 100vh;">
        <div class="form-container">
            <h2 class="text-center">관광지 등록</h2>
            <form action="${pageContext.request.contextPath}/tour/create" method="post">
                <div class="form-group">
                    <label for="tour_code">투어 코드 (T로 시작)</label>
                    <input type="text" class="form-control" id="tour_code" name="tour_code" required>
                </div>
                <div class="form-group">
                    <label for="tour_name">관광지명</label>
                    <input type="text" class="form-control" id="tour_name" name="tour_name" required>
                </div>
                <div class="form-group">
                    <label for="tour_address">주소</label>
                    <input type="text" class="form-control" id="tour_address" name="tour_address" required>
                </div>
                <div class="form-group">
                    <label for="tour_cmmt">설명</label>
                    <textarea class="form-control" id="tour_cmmt" name="tour_cmmt" required></textarea>
                </div>
                <div class="form-group">
                    <label for="tour_telno">전화번호</label>
                    <input type="text" class="form-control" id="tour_telno" name="tour_telno" required>
                </div>
                <div class="form-group">
                    <label for="custom_cnt">인원</label>
                    <input type="number" class="form-control" id="custom_cnt" name="custom_cnt" required>
                </div>
                <div class="form-group">
                    <label for="car_cnt">주차</label>
                    <input type="number" class="form-control" id="car_cnt" name="car_cnt" required>
                </div>
                <div class="form-group">
                    <label for="area_code">지역 코드</label>
                    <input type="text" class="form-control" id="area_code" name="area_code" required> <!-- 추가 -->
                </div>
                <div class="text-center"> 
                    <input type="submit" class="btn btn-success btn-rounded" value="등록">
                    <a href="${pageContext.request.contextPath}/tour/list" class="btn btn-secondary btn-rounded ml-2">목록</a>
                </div>
            </form>
        </div>
    </div>
    
    <footer class="text-center">
		<div class="container">
			<p>&copy; 2024 전통시장. 모든 권리 보유.</p>
			<a href="#terms">이용약관</a> | <a href="#privacy">개인정보 처리방침</a>
		</div>
	</footer>
</body>
</html>

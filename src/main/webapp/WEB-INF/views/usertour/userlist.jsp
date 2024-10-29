<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 관광지 조회</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            background-color: #f8f9fa; /* 배경 색상 추가 */
        }
        table {
            margin: 20px auto; 
            width: 80%; /* 테이블 너비 조정 */
            border-radius: 10px; /* 테이블 모서리 둥글게 */
            border: 1px solid #ddd; /* 테이블 테두리 */
            border-collapse: collapse; /* 테두리 중첩 제거 */
        }
        th, td {
            text-align: center;
            padding: 12px; /* 셀 패딩 추가 */
            border: 1px solid #ddd; /* 셀 테두리 추가 */
        }
        th {
            background-color: #007bff; /* 헤더 배경 색상 */
            color: white; /* 헤더 글자 색상 */
        }
        a {
            text-decoration: none; 
            color: #007bff; /* 링크 색상 */
        }
        a:hover {
            text-decoration: underline; /* 링크 호버 효과 */
        }
        .form-inline {
            margin-bottom: 20px; /* 검색 폼 여백 추가 */
            justify-content: flex-end; /* 오른쪽 정렬 */
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
							href="/main.html"><i class="fas fa-home"></i>
								홈</a></li>
						<li class="nav-item"><a class="nav-link" href="/market/market"><i
								class="fas fa-shopping-basket"></i> 시장정보찾기</a></li>
						<li class="nav-item"><a class="nav-link" href="/usertour/userlist"><i
								class="fas fa-map-signs"></i> 관광지정보찾기</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/userNoticeBoardList.html"><i
								class="fas fa-bell"></i> 공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="/myInfo.html"><i
								class="fas fa-user"></i> 마이페이지</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	
    <div class="container text-center">
        <h1 class="my-4">관광지 조회</h1>
        
        <!-- 검색 폼 -->
        <form action="${pageContext.request.contextPath}/usertour/usersearch" method="get" class="form-inline mb-4">
            <div class="form-group mr-2">
                <label for="citySelect" class="mr-2">시.도</label>
                <select id="citySelect" name="keyword" class="form-control">
                    <option value="">전체</option>
                    <option value="경기도" <c:if test="${param.keyword == '경기도'}">selected</c:if>>경기도</option>
                     <option value="세종특별시" <c:if test="${param.keyword == '세종특별시'}">selected</c:if>>세종특별시</option>
                    <option value="인천광역시" <c:if test="${param.keyword == '인천광역시'}">selected</c:if>>인천광역시</option>
                    <option value="서울특별시" <c:if test="${param.keyword == '서울특별시'}">selected</c:if>>서울특별시</option>
                    <option value="강원특별자치도" <c:if test="${param.keyword == '강원특별자치도'}">selected</c:if>>강원특별자치도</option>
                    <option value="충청남도" <c:if test="${param.keyword == '충청남도'}">selected</c:if>>충청남도</option>
                    <option value="대전광역시" <c:if test="${param.keyword == '대전광역시'}">selected</c:if>>대전광역시</option>
                    <option value="충청북도" <c:if test="${param.keyword == '충청북도'}">selected</c:if>>충청북도</option>
                    <option value="부산광역시" <c:if test="${param.keyword == '부산광역시'}">selected</c:if>>부산광역시</option>
                    <option value="울산광역시" <c:if test="${param.keyword == '울산광역시'}">selected</c:if>>울산광역시</option>
                    <option value="대구광역시" <c:if test="${param.keyword == '대구광역시'}">selected</c:if>>대구광역시</option>
                    <option value="경상북도" <c:if test="${param.keyword == '경상북도'}">selected</c:if>>경상북도</option>
                    <option value="경상남도" <c:if test="${param.keyword == '경상남도'}">selected</c:if>>경상남도</option>
                    <option value="전라남도" <c:if test="${param.keyword == '전라남도'}">selected</c:if>>전라남도</option>
                    <option value="광주광역시" <c:if test="${param.keyword == '광주광역시'}">selected</c:if>>광주광역시</option>
                    <option value="전라북도" <c:if test="${param.keyword == '전라북도'}">selected</c:if>>전라북도</option>
                    <option value="제주특별자치도" <c:if test="${param.keyword == '제주특별자치도'}">selected</c:if>>제주특별자치도</option>
           
                </select>
            </div>
            <input type="submit" value="검색" class="btn btn-primary">
        </form>

        <!-- 관광지 목록 테이블 -->
        <table class="table">
            <thead>
                <tr>
                    <th class="tour_name">관광지명</th>
                    <th class="tour_address">주소</th>
                    <th class="tour_telno">전화번호</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty usertourList}">
                    <tr>
                        <td colspan="3">검색 결과가 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach var="usertour" items="${usertourList}">
                    <tr>
                        <td class="tour_name">
                            <a href="${pageContext.request.contextPath}/usertour/userdetail?tour_code=${usertour.tour_code}">
                                ${usertour.tour_name}
                            </a>
                        </td>
                        <td class="tour_address">${usertour.tour_address}</td>
                        <td class="tour_telno">${usertour.tour_telno}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <footer class="text-center">
		<div class="container">
			<p>&copy; 2024 전통시장. 모든 권리 보유.</p>
			<a href="#terms">이용약관</a> | <a href="#privacy">개인정보 처리방침</a>
		</div>
	</footer>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<html>
<head>
    <title>시장 등록</title>
    <style>
          <style>
        body {
            display: flex; /* Flexbox 사용하여 중앙 정렬 */
            flex-direction: column; /* 세로 방향으로 요소 배치 */
            align-items: center; /* 가로 방향 중앙 정렬 */
            margin: 0; /* 기본 여백 제거 */
            padding: 20px; /* 내부 여백 추가 */
            height: 100vh; /* 화면 전체 높이 사용 */
        }

.header {
    background-color: steelblue; /* 청색 배경색 */
    width: 100%; /* 전체 폭 */
    text-align: center; /* 중앙 정렬 */
    padding: 1px 0; /* 위아래 여백을 줄임 (원래 10px에서 3px으로 줄임) */
    color: white; /* 글자색 흰색 */
}
        form {
            width: 80%; /* 폭을 80%로 설정 */
            margin: 20px; /* 여백 설정 */
            padding: 20px; /* 내부 여백 추가 */
            border: 1px solid #ddd; /* 테두리 추가 */
            border-radius: 5px; /* 모서리 둥글게 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        }
        label {
    margin: 0; /* 라벨의 여백을 없앰 */
    display: block; /* 라벨을 블록 요소로 설정하여 다음 줄로 이동하게 함 */
}

        input, textarea {
             width: 100%; /* 입력 필드 너비 100% */
    margin-bottom: 5px; /* 아래쪽 여백을 줄임 (원래 10px에서 5px으로 줄임) */
    padding: 5px; /* 내부 여백을 줄임 (원래 10px에서 5px으로 줄임) */
    border: 1px solid #ccc; /* 테두리 설정 */
    border-radius: 4px; /* 모서리 둥글게 */
        }
    </style>
</head>
<body>
 <div class="header">
        <h2>시장 등록[관리자용]</h2> <!-- 제목이 보이도록 설정 -->
    </div>
<form action="${pageContext.request.contextPath}/market/add" method="post">
    <label for="market_code">시장 코드(7자리, 구조:MK+일련번호 5자리  예:MK12345)</label>
    <input type="text" id="market_code" name="market_code" required>

    <label for="area_code">지역 코드(코드표 참고)</label>
    <input type="text" id="area_code" name="area_code" required>

    <label for="market_name">시장 이름</label>
    <input type="text" id="market_name" name="market_name" required>

    <label for="market_address">시장 주소</label>
    <input type="text" id="market_address" name="market_address" required>

    <label for="tel_no">관리소 전화번호</label>
    <input type="text" id="tel_no" name="tel_no" required>

    <label for="market_type">시장유형(1:재래시장)</label>
    <input type="text" id="market_type" name="market_type" required>

    <label for="mrk_open_type">시장개설유형(1:상설장 , 2:상성+5일장 , 3:5일장)</label>
    <input type="text" id="mrk_open_type" name="mrk_open_type" required>

    <label for="open_1">장날1</label>
    <input type="text" id="open_1" name="open_1" required>

    <label for="open_2">장날2</label>
    <input type="text" id="open_2" name="open_2" required>

    <input type="submit" value="등록">
</form>
</body>
</html>

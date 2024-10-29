<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<html>
<head>
    <title>시장정보 삭제</title>
    
     <style>
        .header {
            background-color: #007FFF; /* 폴란드 청색 배경 */
            text-align: center; /* 중앙 정렬 */
            padding: 20px; /* 상하 여백 */
            color: white; /* 글자색 흰색 */
        }
         .delete-button {
            width: 200px; /* 버튼 폭을 2배로 설정 */
            background-color: yellow; /* 노란색 배경 */
            padding: 10px; /* 버튼 패딩 */
            border: none; /* 기본 테두리 제거 */
            cursor: pointer; /* 커서 포인터로 변경 */
            font-size: 16px; /* 글자 크기 설정 */
        }
    </style>
    <script>
        function confirmDelete(event) {
            // 삭제 확인 창 표시
            if (!confirm("정말 삭제하시겠습니까?")) {
                event.preventDefault(); // 삭제를 취소할 경우 form 제출을 막음
            }
        }
    </script>
    
    
</head>
<body>
<div class="header">
        <h2>시장정보 삭제</h2> <!-- 제목이 보이도록 설정 -->
    </div>

<p> 아래 시장정보를 삭제하시겠습니까?</p>
<form action="${pageContext.request.contextPath}/market/delete?${market.market_code}" method="post" onsubmit="confirmDelete(event)">
        <input type="hidden" name="market_code" value="${market.market_code}">
        <p>시장 코드: ${market.market_code}</p>
        <p>시장 이름: ${market.market_name}</p>
        <p>시장 주소: ${market.market_address}</p>
        <input type="submit" class="delete-button" value="삭제"> <!-- 수정된 버튼 -->
    </form>
    <button class="button" onclick="window.close();">창닫기</button>

</body>
</html>

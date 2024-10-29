<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<html>
<head>
<title>시장정보 수정[관리자용]</title>
<style>
 h2 {
        background-color: lightblue; /* 옅은 청색 배경 */
        text-align: center; /* 중앙 정렬 */
        padding: 10px; /* 상하 여백 */
        margin: 0 0 20px 0; /* 하단 여백 추가 */
        border-radius: 5px; /* 모서리를 둥글게 */
    }
    </style>
</head>
<body>

<h2>시장정보 수정[관리자용]</h2>
<form action="${pageContext.request.contextPath}/market/update" method="post">
<input type="hidden" name="market_code" value="${market.market_code}"/>
<label for="market_name">시장 이름:</label>
<input type="text" name="market_name" value="${market.market_name}"/><br/>

<label for="market_address">시장 주소:</label>
<input type="text" name="market_address" value="${market.market_address}" style="width: 100%;"/><br/>

<label for="tel_no">전화 번호:</label>
<input type="text" name="tel_no" value="${market.tel_no}"/><br/>



<button type="submit">수정</button>
<button class="close-btn" onclick="window.close();">창닫기</button>
</form>
</body>
</html>

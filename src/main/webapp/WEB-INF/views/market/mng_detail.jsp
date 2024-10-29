<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/review.js"></script>
<script src="/js/myPage.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	let searchParams = new URLSearchParams(window.location.search);
	let market_code = searchParams.get('market_code');
	console.log(market_code);
	
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
                htmls += '<button id="deleteReview" data-review-id="' + this.review_id + '" type="button">리뷰 삭제</button>';
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
                market_tour_code: market_code
            };

            // write 함수를 호출하여 리뷰 작성
            review.write(reviewData);
        });
    });
	
    $('#reviewList').on('click', '#deleteReview', function() {
        let reviewId = $(this).data('review-id'); // 리뷰 ID 가져오기
        review.del(reviewId); // 리뷰 삭제 함수 호출
    });
	
    review.reviewList(market_code, listCallback);
});    
</script>
<style>
.header {
	background-color: lightblue; /* 연한 파란색 배경 */
	text-align: center; /* 중앙 정렬 */
	padding: 20px; /* 상하 여백 */
	margin: 0; /* 기본 여백 제거 */
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: center;
	border: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

.button {
	margin-top: 20px;
	padding: 10px 15px;
	background-color: #007BFF; /* 버튼 배경색 */
	color: white; /* 버튼 글자색 */
	border: none;
	border-radius: 5px; /* 모서리 둥글게 */
	cursor: pointer; /* 마우스 커서 변경 */
	text-decoration: none; /* 링크의 파란 줄 제거 */
}

.button:hover {
	background-color: #0056b3; /* hover 시 색상 변화 */
}

.button-container {
	text-align: center; /* 중앙 정렬 */
	margin-top: 20px; /* 위쪽 여백 */
}
</style>



<title>시장 상세 정보[관리자용]</title>
<script type="text/javascript">
        function openMapWindow(marketCode) {
            var url = "${pageContext.request.contextPath}/market/marketmap?market_code=" + marketCode;
            window.open(url, '_blank', 'width=1000,height=700');

        }
    </script>



<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: left;
	border: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

.button {
	margin-top: 20px;
	padding: 10px 15px;
	background-color: #007BFF; /* 버튼 배경색 */
	color: white; /* 버튼 글자색 */
	border: none;
	border-radius: 5px; /* 모서리 둥글게 */
	cursor: pointer; /* 마우스 커서 변경 */
	text-decoration: none; /* 링크의 파란 줄 제거 */
}

.button:hover {
	background-color: #0056b3; /* hover 시 색상 변화 */
}
</style>
</head>
<body>
	<div class="header">
		<h2>시장 상세 정보[관리자용]</h2>
	</div>
	<table>
		<tr>
			<th>시장 코드</th>
			<td>${market.market_code}</td>
		</tr>
		<tr>
			<th>시장 이름</th>
			<td>${market.market_name}</td>
		</tr>
		<tr>
			<th>시장 주소</th>
			<td>${market.market_address}</td>
		</tr>
		<tr>
			<th>관리소 전화번호</th>
			<td>${market.tel_no}</td>
		</tr>
	</table>
	<div class="button-container">
		<button class="map-btn"
			onclick="openMapWindow('${market.market_code}')">지도보기</button>
		<button class="close-btn" onclick="window.close();">창닫기</button>
		<a class="button"
			href="${pageContext.request.contextPath}/market/edit?market_code=${market.market_code}">수정</a>
		<a class="button"
			href="${pageContext.request.contextPath}/market/delchk?market_code=${market.market_code}">삭제</a>
	</div>

	<div>
		<h1 class="mt-3">리뷰쓰기</h1>
		<form id="reviewForm" method="post" class="mt-4 form-container">
			<div class="form-group mt-3">
				<textarea class="form-control" id="content" name="content" rows="4" style="width: 100%; box-sizing: border-box;"></textarea>
			</div>
			<div class="text-center">
				<input type="submit" class="btn btn-primary btn-rounded mt-3"
					value="리뷰작성" />
			</div>
		</form>
	</div>
	<div id="reviewList"></div>

</body>
</html>

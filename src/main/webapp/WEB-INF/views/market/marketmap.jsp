<%@ page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 


<html>
<head>
<%-- <title>전통시장 지도 <시장명 : <%= name %>></title> --%>
<!-- <div id="map" style="width: 500%; height: 350px"></div>
-->
<style type="text/css">
.header {
        background-color: steelblue;
    color: white;
    text-align: center;
    height: auto; /* 높이를 자동으로 조절 */
    padding: 10px 0; /* 필요에 따라 패딩 추가 */
    margin: 0; /* 여백을 없애거나 조정 */
}
.header h3 {
    line-height: 1.2; /* 줄 간격을 줄임 (1.2배) */
    margin: 0; /* 기본 마진을 없애기 */
}
#map {
    width: 100%;
    height: 330px;
    border: 2px solid steelblue; /* 외곽선을 steelblue로 변경 */
    border-radius: 5px; /* 모서리를 둥글게 */
}
/* 버튼 중앙 정렬을 위한 스타일 */
        .button-container {
            text-align: center; /* 버튼을 중앙에 위치 */
            margin: 10px 0; /* 버튼과 지도 간 간격 */
        }
</style>


 <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf8a6db3fda86ed31560967cf7a7cc9d&libraries=services"></script>
</head>
<body>
	<div class="header">
	<h3> 전통시장 지도  
 	 [시장명 :  ${market.market_name} ]  </h3>
	<h3> [시장주소 : ${market.market_address}]  </h3>
	</div>
<div class="button-container"> <!-- 버튼을 감싸는 div 추가 -->
        <button onclick="window.close()">지도닫기</button>
    </div>
	<div id="map" style="width: 100%; height: 330px"  ></div>
<script type="text/javascript">
        function initMap(address,name) {
        	
        	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        	
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

        	// 지도를 생성합니다    
        	var map = new kakao.maps.Map(mapContainer, mapOption); 

        	// 주소-좌표 변환 객체를 생성합니다
        	var geocoder = new kakao.maps.services.Geocoder();

        	// 주소로 좌표를 검색합니다
        	geocoder.addressSearch(address, function(result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px; text-align:center; padding:6px 0; background-color: yellow;">' + name+ '</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
        	
            } else {
                alert("지도를 확인할 수 없습니다.");
            }
            
     	} // function (result, status)
     	);
        }
    </script>
	
	
	
	
<!-- 	<div id="map" style="width: 100%; height: 400px;"></div>
 -->	
</body>
    <script>
	initMap('${market.market_address}','${market.market_name}');
    </script>
<!--     <script>
    	initMap('${market.market_address}','${market.market_name}');
    </script>
 -->
 </html>
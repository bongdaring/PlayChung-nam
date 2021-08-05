<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"
%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="util.movieAction"%>
<%@page import="util.movieEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String search = request.getParameter("search");
	ArrayList<movieEntity> users = new ArrayList<movieEntity>();
	users = new movieAction().getSearchList(search);
%>
<meta charset="UTF-8">

<style>
@import url(tableCSS.css);
</style>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a095acd06863bd39e95b2a2b83b2b5d9&libraries=services"
></script>
<div id="map" style="width: 100%; height: 350px;"></div>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = {
		center : new kakao.maps.LatLng(36.81528, 127.11389), // 지도의 중심좌표
		level : 4
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	<%if (users.size() != 0) {%>
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
		//지도에 표시할 원을 생성합니다
		geocoder.addressSearch('<%=users.get(0).getAddress()%>', function(result, status) {
		
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			var circle = new kakao.maps.Circle({
				center : coords, // 원의 중심좌표 입니다 
				radius : 200, // 미터 단위의 원의 반지름입니다 
				strokeWeight : 5, // 선의 두께입니다 
				strokeColor : '#75B8FA', // 선의 색깔입니다
				strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				strokeStyle : 'dashed', // 선의 스타일 입니다
				fillColor : '#CFE7FF', // 채우기 색깔입니다
				fillOpacity : 0.7
			// 채우기 불투명도 입니다   
			});

			// 지도에 원을 표시합니다 
			circle.setMap(map);
					
	}
	});<%}%>
	<%for (int i = 0; i < users.size(); i++) {
				movieEntity review = users.get(i);%>
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('<%=review.getAddress()%>', function(result, status) {
		
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			var marker = new kakao.maps.Marker({
		        position: coords
		    });

			
		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
		    
		    map.setCenter(coords);

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : "<%=review.getName()%>"
							// 인포윈도우에 표시할 내용
							});

							// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다			
							// 이벤트 리스너로는 클로저를 만들어 등록합니다 							
							// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다							
							kakao.maps.event.addListener(marker, 'mouseover',
									makeOverListener(map, marker, infowindow));
							kakao.maps.event.addListener(marker, 'mouseout',
									makeOutListener(infowindow));
						}
					});
<%}%>
	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
		return function() {
			infowindow.open(map, marker);
		};
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
		return function() {
			infowindow.close();
		};
	}
	function relayout() {
		// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		map.relayout();
	}
</script>
<h2>영화관</h2>
<table>
	<tr>
		<th>위치</th>
		<th>이름</th>
		<th>주소</th>
	</tr>
	<%
		for (int i = 0; i < users.size(); i++) {
			movieEntity movie = users.get(i);
	%>
	<tr>
		<td><%=movie.getWhere()%></td>
		<td><%=movie.getName()%></td>
		<td><%=movie.getAddress()%></td>
		<td>
			<a onclick="return confirm('추가하시겠습니까?')"
				href="./addmovie.jsp?name=<%=movie.getName()%>"
			>추가</a>
		</td>
		<td>
			<a onclick="return confirm('지도보기?')"
				href="./usercheck.jsp?address=<%=movie.getAddress()%>"
			>지도보기</a>
		</td>
	</tr>
	<%
		}
	%>
</table>


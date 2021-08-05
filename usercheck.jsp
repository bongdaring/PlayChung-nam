<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
%>

<%
	request.setCharacterEncoding("UTF-8");
	String address = request.getParameter("address");
%>

<%=address%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a095acd06863bd39e95b2a2b83b2b5d9&libraries=services"
	></script>
	<script>
   var mapContainer = document.getElementById('map');
   var mapOption = {
      center : new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
      level : 3
   // ������ Ȯ�� ����
   };

   var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
 var geocoder = new kakao.maps.services.Geocoder();
 geocoder.addressSearch('<%=address%>', function(result, status) {

			// ���������� �˻��� �Ϸ������ 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				var marker = new kakao.maps.Marker({
					position : coords
				});

				// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
				marker.setMap(map);

				map.setCenter(coords);
			}
		});
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="util.foodAction"%>
<%@ page import="util.foodEntity"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>충남에서 놀아보자!</title>

<style>
html {
	padding: 0% 20%;
}

input {
	all: unset;
	border-radius: 5px;
	border: 1px solid rgba(0, 0, 0, 0.5);
	font-size: 18px;
	margin-bottom: 15px;
}

h2 {
	text-align: center;
}

header {
	padding: 20px 5px;
	background-color: #ff9d00ff;
}

header h2 {
	font-weight: bold;
	font-size: 50px;
}

#setFrame {
	display: block;
	width: 100%;
	height: 600px;
}
</style>

</head>
<body>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a095acd06863bd39e95b2a2b83b2b5d9"
	></script>
	<header>
		<h2>충남에서 놀아보자</h2>
	</header>
	<hr>
	<section id="sectionTitle">
		<form name="form1" method="post">

			<input type="text" id="search" name="search" placeholder="내용을 입력하세요.">
			<br>
			<input id="test" type="button" value="영화관" onclick="ajmovie()">
			<input id="test" type="button" value="음식점" onclick="ajfood()">
			<input id="test" type="button" value="기록" onclick="ajsave()">
			<iframe id="setFrame"> </iframe>
		</form>
	</section>

	<script>

		function ajfood() {
			var search = document.getElementById("search").value;
			var test = "search=" + search;
			document.getElementById('setFrame').src = "./NewFile.jsp?" + test;
		}

		function ajmovie() {
			var search = document.getElementById("search").value;
			var test = "search=" + search;
			document.getElementById('setFrame').src = "./NewFile2.jsp?" + test;
		}
		

		function ajsave(){ //ajax
			var search = document.getElementById("search").value;
			var test = "search=" + search;
			document.getElementById('setFrame').src = "./NewFile3.jsp?" + test;
		}
	</script>
</body>
</html>

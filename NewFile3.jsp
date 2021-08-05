<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="util.movieAction"%>
<%@ page import="util.Choicemovie"%>
<%@ page import="util.foodAction"%>
<%@ page import="util.Choicefood"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<Choicemovie> users = new ArrayList<Choicemovie>();
	users = new movieAction().getsaveMList();
	ArrayList<Choicefood> cfood = new ArrayList<Choicefood>();
	cfood = new foodAction().getsaveFList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style>
@import url(tableCSS.css);
</style>
<body>
	<h2>선택한 영화관</h2>
	<table>
		<tr>
			<th>위치</th>
			<th>이름</th>
			<th>삭제</th>
		</tr>
		<%
			for (int i = 0; i < users.size(); i++) {
				Choicemovie movie = users.get(i);
		%>
		<tr>
			<td><%=movie.getName()%></td>
			<td><%=movie.getAddress()%></td>
			<td>
				<a onclick="return confirm('삭제하시겠습니까?')"
					href="./deletemovie.jsp?name=<%=movie.getName()%>"
				>삭제</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<h2>선택한 음식점</h2>
	<table>
		<tr>
			<th>이름</th>
			<th>주소</th>
			<th>번호</th>
			<th>삭제</th>
		</tr>
		<%
			for (int i = 0; i < cfood.size(); i++) {
				Choicefood food = cfood.get(i);
		%>
		<tr>
			<td><%=food.getName()%></td>
			<td><%=food.getAddress()%></td>
			<td><%=food.getPhone()%></td>
			<td>
				<a onclick="return confirm('삭제하시겠습니까?')"
					href="./deletefood.jsp?name=<%=food.getName()%>"
				>삭제</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>



</body>
</html>
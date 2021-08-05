<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.movieAction"%>
<%@ page import="util.movieEntity"%>
<%@ page import="util.Choicemovie"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*" %>
<% 
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
movieAction user = new movieAction();
String address = user.choicem(name);
movieAction savemovie = new movieAction();
int result = savemovie.savemovie(new Choicemovie(name,address));

if(result == -1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 추가하셨습니다')");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	return;
} else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('추가되었습니다')");
	script.println("history.back()");
	script.println("</script>");
	script.close();
}%>
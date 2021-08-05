<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.foodAction"%>
<%@ page import="util.foodEntity"%>
<%@ page import="util.Choicefood"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*" %>
<% 
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
foodAction user = new foodAction();
String address = user.choicef(name);
String phone = user.choicep(name);
foodAction savefood = new foodAction();
int result =savefood.savefood(new Choicefood(name,address,phone));

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
}

%>
<%=phone
%>
<%=address
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="util.foodAction"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = null;
	if (request.getParameter("name") != null) {
		name = request.getParameter("name");
	}

	int result = new foodAction().delete(name);
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제가 완료되었습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("history.back()");
		script.println("</script>");
		script.close();

	}
%>

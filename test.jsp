 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Connection Test</title>
</head>
<body>
<%


String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost:3306/CHEON?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&autoReconnection=true" ;
Connection conn;
Statement stmt;

try {
	Class.forName(driverName);
 conn = DriverManager.getConnection(dbURL,"root","1234");
 stmt = conn.createStatement();
 conn.close();
 out.println("MySql jdbc test: connect ok!!");
} catch(Exception e) {
 out.println(e.getMessage());
}
%>
</body>
</html>




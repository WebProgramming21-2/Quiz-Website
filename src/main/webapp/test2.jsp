<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Member.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
	</head>
	<body>
		<h1>Test2</h1>
		<%
		String userId = (String)session.getAttribute("userID");
		%>
		<%=userId %> 회원 탈퇴 <br>
		<%
		// id와 넘겨받아 db update
		MemberDAO.getInstance().withdraw(userId);
		%>
	</body>
</html>
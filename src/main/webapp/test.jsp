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
		<h1>Test</h1>
		<%
		MemberDTO member = new MemberDTO("홍길동", "asdf", "hong", -1);
		MemberDAO.getInstance().register(member);
		
		if (MemberDAO.getInstance().login(member)) {
			out.println("<p> 로그인 성공 <p>");
		} else {
			out.println("<p> 로그인 실패 <p>");
		}
		%>
	</body>
</html>
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
		// 테스트용 jsp 실제 코드는 session 등 활용해야 함
		MemberDTO member = new MemberDTO("홍길동", "asdf", "hong", -1);
		
		if (MemberDAO.getInstance().register(member)) {
			out.println("<p> 가입 성공 <p>");
		} else {
			out.println("<p> 가입 실패 <p>");
		}
		
		if (MemberDAO.getInstance().login(member)) {
			out.println("<p> 로그인 성공 <p>");
			out.println("<p>" + MemberDAO.getInstance().getName(member.getId()) + "님 환영합니다!<p>");
		} else {
			out.println("<p> 로그인 실패 <p>");
		}
		%>
	</body>
</html>
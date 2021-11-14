<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Member.*" %>
<%
// id와 score 넘겨받아 db update
MemberDAO.getInstance().setScore("hong", 100);
MemberDAO.getInstance().setScore("aaaa", 75);
MemberDAO.getInstance().setScore("test", 75);
MemberDAO.getInstance().setScore("user001", 0);
// score가 -1보다 큰 것만 순서대로 가져옴
List<Rank> rankList = MemberDAO.getInstance().getRankList();
%>
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
		for(int i = 0; i < rankList.size(); i++) {
			out.println("<p>순위 : " + (i+1) +"</p><br>");
			out.println("<p>아이디 : " + rankList.get(i).getId() +"</p><br>");
			out.println("<p>이름 : " + rankList.get(i).getName() +"</p><br>");
			out.println("<p>점수 : " + rankList.get(i).getScore() +"</p><br>");
			out.println("<hr style='border-top: 1px dotted #000000 !important;'>");
		}
		%>
	</body>
</html>
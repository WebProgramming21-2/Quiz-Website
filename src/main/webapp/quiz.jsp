<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Quiz.*" %>
<%
List<QuizDTO> quizList = QuizDAO.getInstance().getQuizList();
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
		<%
		for (int i=0;i<quizList.size();i++) {
			out.println("<p> No. " + quizList.get(i).getId() + "<p>");
			out.println("<p> 퀴즈 제목 : " + quizList.get(i).getTitle() + "<p>");
			out.println("<p> 퀴즈 내용 : " + quizList.get(i).getContent() + "<p>");
			for (int j=0;j<4;j++) {
				out.println("<p> 선택지" + (j+1) + " : " + quizList.get(i).getChoice()[j] + "<p>");
			}
			out.println("<p> 정답 : " + quizList.get(i).getAnswer() + "<p>");
			out.println("<hr style='border-top: 1px dotted #000000 !important;'>");
		}
		%>
	</body>
</html>
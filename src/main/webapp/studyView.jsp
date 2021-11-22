<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Quiz.*" %>
<%@ page import="java.io.*" %>
<%
	PrintWriter script = response.getWriter();
	String login = (String)session.getAttribute("login");
	if(login == null){
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
%>
<%
List<QuizDTO> quizList = QuizDAO.getInstance().getQuizList();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학습목록</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		
		<style type="text/css">
			font {
				font-family: 'Jua', sans-serif;
			}
		</style>
	</head>
	<body>
		<%
			// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
			String userName = null;
			if(session.getAttribute("userName") != null){
				userName = (String)session.getAttribute("userName");
			}
		%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="main.jsp"><font size="6">동국퀴즈</font></a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor03">
			  <ul class="navbar-nav me-auto">
		        <li class="nav-item">
		          <a class="nav-link active" href="main.jsp"><font size="4">Home</font></a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="studyView.jsp"><font size="4">학습모드</font></a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link active" href="mypage.jsp"><font size="4"><%=userName %></font></a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link active" href="logoutAction.jsp"><font size="4">로그아웃</font></a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		<div class="container">
			<div class="row">
				<table class="table table-hover" style="text-align: center">
				  <thead>
				    <tr>
				      <th scope="col"><font size="">번호</font></th>
				      <th scope="col"><font>문제</font></th>
				    </tr>
				  </thead>
				  <tbody>
					  <%
					  	for(int i = 0; i < quizList.size(); i++) {
					  %>
					    <tr class="table-active">
					      <th scope="row"><font>No.<%= quizList.get(i).getId() %></font></th>
					      <td><a href="study.jsp?quizID=<%= quizList.get(i).getId() %>"><font><%= quizList.get(i).getTitle() %></font></a></td>
					    </tr>
					  <%
					    } 
					  %>
				  </tbody>
				</table>
			</div>
		</div>
	</body>
</html>
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
		<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		
		<style type="text/css">
			.row {
				
			}
		</style>
	</head>
	<body>
		<%
			// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
		%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="main.jsp">동국퀴즈</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor03">
			  <ul class="navbar-nav me-auto">
		        <li class="nav-item">
		          <a class="nav-link active" href="main.jsp">Home</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="studyView.jsp">학습모드</a>
		        </li>
		        <li class="nav-item">
		            <a class="dropdown-item" href="logoutAction.jsp"><%=userID %> 로그아웃</a>
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
				      <th scope="col">번호</th>
				      <th scope="col">문제</th>
				    </tr>
				  </thead>
				  <tbody>
					  <%
					  	for(int i = 0; i < quizList.size(); i++) {
					  %>
					    <tr class="table-active">
					      <th scope="row">No.<%= quizList.get(i).getId() %></th>
					      <td><a href="study.jsp?quizID=<%= quizList.get(i).getId() %>"><%= quizList.get(i).getTitle() %></a></td>
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
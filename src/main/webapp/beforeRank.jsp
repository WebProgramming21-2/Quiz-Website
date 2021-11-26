<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="Member.*" %>
<html>
	<title>beforeRank</title>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		
		<script src="https://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
			#wait {
				position: absolute;
				top: 45%;
				left: 50%;
				transform: translate(-50%, -45%);
				font-family: 'Jua', sans-serif;
			}
			#quiz {
				position: absolute;
				top: 70%;
				left: 50%;
				transform: translate(-50%, -70%);
				font-size: 40px;
				font-family: 'Jua', sans-serif;
			}
			font {
				font-family: 'Jua', sans-serif;
			}
		</style>
		
	</head>
	<body>
		<%
			PrintWriter script = response.getWriter();
			String login = (String)session.getAttribute("login");
			if(login == null){
				script.println("<script>");
				script.println("alert('로그인이 필요합니다.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
			// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
			String userID = null;
			String userName = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
				
				// 점수 갱신
				MemberDAO.getInstance().setScore(userID, Integer.parseInt(request.getParameter("score")));
			}
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
		          <a class="nav-link active" href="main.jsp"><font size="4">Home</font>
		            <span class="visually-hidden"></span>
		          </a>
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
		<div id="wait">
			<h1><font>퀴즈를 무사히 끝마쳤습니다!</font></h1>
			<h1 align="center"><font>당신의 랭킹을 확인해보세요!</font></h1>
		</div>
		<button type="button" class="btn btn-outline-info" id="quiz" onclick="location.href='ranking.jsp'">랭킹</button>
	</body>
</html>
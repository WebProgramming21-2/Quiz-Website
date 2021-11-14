<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<html>
	<title>모드선택</title>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
			font {
				font-family: 'Jua', sans-serif;
			}
			#all_inf {
				position: absolute;
				top: 46%;
				left: 50%;
				transform: translate(-50%, -46%);
			}
			#out {
				position: relative;
				left: 33%;
				top: 0%;
			}
			#Pid, #Pnick {
				background-color: white;
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
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
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
		            <a class="nav-link active" href="mypage.jsp"><font size="4"><%=userID %></font></a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link active" href="logoutAction.jsp"><font size="4">로그아웃</font></a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		<br>
		
		<div id="all_inf">
			<p id="inf" align="center"><font size="7">회원정보</font></p><br><br>
			
			<div id="Pid" style="border:1px solid; padding:10px;">
				<font size="5">ID: <%out.print("사용자 아이디 출력부분"); %> </font>
			</div><br><br>
			<div id="Pnick" style="border:1px solid; padding:10px;">
				<font size="5">Nickname: <%out.print("사용자 닉네임 출력부분"); %> </font>
			</div><br><br>
			<button type="button" class="btn btn-outline-info" id="out" onclick="location.href='registeroutAction.jsp'"><font size="5">회원탈퇴</font></button>
		</div>
	</body>
</html>
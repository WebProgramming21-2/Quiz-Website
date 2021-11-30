<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<html>
	<title>회원탈퇴</title>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		
		<!--각 요소의 위치 조정 CSS-->
		<style type="text/css">
			/*사용 폰트*/
			font {
				font-family: 'Jua', sans-serif;
			}
			/*form과 p를 담는 div*/
			#all_inf {
				position: absolute;
				top: 46%;
				left: 50%;
				transform: translate(-50%, -46%);
			}
			/*
			#out {
				position: relative;
				left: 33%;
				top: 0%;
			}
			
			#Pid, #Pnick {
				background-color: white;
			}
			*/
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
			String userName = null;
			if(session.getAttribute("userName") != null){
				userName = (String)session.getAttribute("userName");
			}
		%>
		<!-- 네비게이션 바(홈, 마이페이지, 로그아웃) -->
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
		<br>
		
		<!-- div 구성 순서 : 1. p 회원탈퇴 문장, 2. form 비밀번호 입력부, 탈퇴 버튼 -->
		<div id="all_inf">
			<p id="inf" align="center"><font size="7">회원탈퇴</font></p><br><br>
			
			<form action="registeroutAction.jsp" method="post">
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="userPassword">
				</div><br>
			<input type="submit" class="btn btn-primary form-control" value="탈퇴하기">
			
			</form>
		</div>
	</body>
</html>
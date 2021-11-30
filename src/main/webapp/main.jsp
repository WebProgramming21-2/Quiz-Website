<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<html>
	<title>동국퀴즈</title>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		
		<!--각 요소의 위치 조정 CSS-->
		<style type="text/css">
			/*학습모드 이동 버튼*/
			#learn {
				text-align: center;
				position: absolute;
				top: 78%;
				left: 30%;
				transform: translate(-30%, -78%);
			}
			/*퀴즈모드 이동 버튼*/
			#quiz {
				text-align: center;
				position: absolute;
				top: 78%;
				left: 70%;
				transform: translate(-70%, -78%);
			}
			/*학습모드 설명 카드*/
			#lcard {
				position: absolute;
				top: 60%;
				left: 27%;
				transform: translate(-27%, -60%);
			}
			/*퀴즈모드 설명 카드*/
			#qcard {
				position: absolute;
				top: 60%;
				left: 73%;
				transform: translate(-73%, -60%);
			}
			/*원하는 모드 선택 알림 문장 h1*/
			.head {
				position: absolute;
				top: 30%;
				left: 50%;
				transform: translate(-50%, -30%);
			}
			/*사용 폰트*/
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
		<!-- div구성 순서 : 1. 알림 문장 2. 학습모드 설명 + 학습모드 이동 버튼, 3. 퀴즈모드 설명 + 퀴즈모드 이동 버튼 -->
		<div class="container">
			<div class="content">
				<h1 class="head"><font size="7">원하는 모드를 선택하세요</font></h1>
				<div class="card text-white bg-info mb-3" id="lcard" style="max-width: 20rem;">
				  <div class="card-header"><font size="5">학습</font></div>
				  <div class="card-body">
				    <h4 class="card-title"><font>학교에 대해 알아봐요!</font></h4>
				    <p class="card-text"><font>이 모드는 퀴즈를 풀기 전, 학교에 대해 알아볼 수 있는 문제를 제공합니다. 정답 유무에 관계없이 학교에 대해 알아볼 수 있습니다.</font></p>
				  </div>
				</div>
				<div class="card text-white bg-info mb-3" id="qcard" style="max-width: 20rem;">
				  <div class="card-header"><font size="5">퀴즈</font></div>
				  <div class="card-body">
				    <h4 class="card-title"><font>퀴즈를 풀며 기억해보자!</font></h4>
				    <p class="card-text"><font>학습모드에서 확인한 문제들을 기억해서 퀴즈를 풀어봅시다. 단, 틀리거나 시간초과를 하면 그 즉시 정답 유무가 갈립니다.</font></p>
				  </div>
				</div>
				<button type="button" class="btn btn-outline-info" id="learn" onclick="location.href='studyView.jsp'"><font size="5">학습모드</font></button>
				<button type="button" class="btn btn-outline-info" id="quiz" onclick="location.href='quizStart.jsp'"><font size="5">퀴즈모드</font></button>
			</div>
		</div>
	</body>
</html>

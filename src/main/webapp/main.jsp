<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<title>모드선택</title>
	<head>
		<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
			.table {
				text-align: center;
				position: absolute;
				top: 50%;
				transform: translateY(-50%);
				border-top: none;
			}
			#please {
				position: absolute;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
			}
			#learn {
				text-align: center;
				position: absolute;
				top: 75%;
				left: 30%;
				transform: translate(-30%, -75%);
			}
			#quiz {
				text-align: center;
				position: absolute;
				top: 75%;
				left: 70%;
				transform: translate(-70%, -75%);
			}
			#lcard {
				position: absolute;
				top: 60%;
				left: 27%;
				transform: translate(-27%, -60%);
			}
			#qcard {
				position: absolute;
				top: 60%;
				left: 73%;
				transform: translate(-73%, -60%);
			}
			.head {
				position: absolute;
				top: 30%;
				left: 50%;
				transform: translate(-50%, -30%);
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
		          <a class="nav-link active" href="main.jsp">Home
		            <span class="visually-hidden"></span>
		          </a>
		        </li>
		        <li class="nav-item">
		            <a class="dropdown-item" href="logoutAction.jsp"><%=userID %> 로그아웃</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		<div class="container">
			<div class="content">
				<h1 class="head">원하는 모드를 선택하세요</h1>
				<div class="card text-white bg-info mb-3" id="lcard" style="max-width: 20rem;">
				  <div class="card-header">학습</div>
				  <div class="card-body">
				    <h4 class="card-title">학교에 대해 알아봐요!</h4>
				    <p class="card-text">이 모드는 퀴즈를 풀기 전, 학교에 대해 알아볼 수 있는 문제를 제공합니다. 정답 유무에 관계없이 학교에 대해 알아볼 수 있습니다.</p>
				  </div>
				</div>
				<div class="card text-white bg-info mb-3" id="qcard" style="max-width: 20rem;">
				  <div class="card-header">퀴즈</div>
				  <div class="card-body">
				    <h4 class="card-title">퀴즈를 풀며 기억해보자!</h4>
				    <p class="card-text">학습모드에서 확인한 문제들을 기억해서 퀴즈를 풀어봅시다. 단, 틀리거나 시간초과를 하면 그 즉시 정답 유무가 갈립니다.</p>
				  </div>
				</div>
				<button type="button" class="btn btn-outline-info" id="learn" onclick="location.href='studyView.jsp'">학습모드</button>
				<button type="button" class="btn btn-outline-info" id="quiz" onclick="location.href='quiz.jsp'">퀴즈모드</button>
			</div>
		</div>
	</body>
</html>

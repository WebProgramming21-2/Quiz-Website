<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<title>메인</title>
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
				top: 50%;
				left: 30%;
				transform: translate(-30%, -50%);
			}
			#quiz {
				text-align: center;
				position: absolute;
				top: 50%;
				left: 70%;
				transform: translate(-70%, -50%);
			}
			#list1 {
				position: absolute;
				top: 70%;
				left: 35%;
				transform: translate(-35%, -70%);
			}
			#list2 {
				position: absolute;
				top: 70%;
				left: 65%;
				transform: translate(-65%, -70%);
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
		    <a class="navbar-brand" href="index.jsp">동국퀴즈</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor03">
		      <ul class="navbar-nav me-auto">
		        <li class="nav-item">
		          <a class="nav-link active" href="index.jsp">Home
		            <span class="visually-hidden"></span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="dropdown-item" href="login.jsp">로그인</a>
		        </li>
		        <li class="nav-item">
		          <a class="dropdown-item" href="register.jsp">회원가입</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		<div class="container">
			<h1 id="please" align="center">로그인 또는 회원가입을 해주세요.</h1>
			<div class="d-grid gap-5" id="list1">
			  <button class="btn btn-lg btn-primary" type="button" onclick="location.href='login.jsp'">로그인</button>
			</div>
			<div class="d-grid gap-5" id="list2">
			  <button class="btn btn-lg btn-primary" type="button" onclick="location.href='register.jsp'">회원가입</button>
			</div>
		</div>
	</body>
</html>

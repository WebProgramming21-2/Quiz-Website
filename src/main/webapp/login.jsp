<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<title>로그인</title>
	<head>
		<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
			.container {
				position: absolute;
				left: 50%;
				top: 50%;
				transform: translate(-50%, -50%);
			}
			.badge bg-info {
				position: absolute;
				left: 50%;
				top: 50%;
				transform: translate(-50%, -50%);
			}
		</style>
	</head>
	<body>
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
		
		<div class="container">		<!-- 하나의 영역 생성 -->
			<div class="col-lg-15">	<!-- 영역 크기 -->
				<form method="post" action="loginAction.jsp">
					<h1 style="text-align: center;">로그인</h1>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div><br>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div><br>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
					<input type="reset" class="btn btn-primary form-control" value="취소">
				</form>
			</div>	
		</div>
	</body>
</html>
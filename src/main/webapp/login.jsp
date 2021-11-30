<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<title>로그인</title>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
			/*폼태그를 감싸는 div의 위치 조정 */
			.container {
				position: absolute;
				left: 50%;
				top: 50%;
				transform: translate(-50%, -50%);
			}
			/*사용 폰트 */
			font {
				font-family: 'Jua', sans-serif;
			}
		</style>
	</head>
	<body>
		<!-- 네비게이션 바(홈, 로그인, 회원가입) -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="index.jsp"><font size="6">동국퀴즈</font></a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor03">
		      <ul class="navbar-nav me-auto">
		        <li class="nav-item">
		          <a class="nav-link active" href="index.jsp"><font size="4">Home</font>
		            <span class="visually-hidden"></span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="login.jsp"><font size="4">로그인</font></a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="register.jsp"><font size="4">회원가입</font></a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		<!-- 로그인 폼 태그. 입력 정보 : 아이디, 비밀번호 -->
		<div class="container">		
			<div class="col-lg-15">	
				<form method="post" action="loginAction.jsp">
					<h1 style="text-align: center;"><font size="7">로그인</font></h1>
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